import "android.content.*"
import "android.net.Uri"

import "android.app.*"
import "android.os.*"
import "java.lang.Math"
import "android.view.VelocityTracker"
import "android.view.MotionEvent"
import "android.view.ViewConfiguration"
import "android.support.v4.widget.SwipeRefreshLayout"
import "android.net.ConnectivityManager"
import "com.androlua.LuaUtil"
import "android.content.res.ColorStateList"
import "android.support.v7.widget.CardView"
import "android.animation.AnimatorSet"
import "android.view.View"
import "android.widget.ArrayAdapter"
import "android.graphics.Color"
import "android.widget.LinearLayout"
import "android.animation.ObjectAnimator"
import "android.widget.PageView"
import "com.androlua.Http"
import "android.widget.RelativeLayout"
import "android.view.animation.AlphaAnimation"
import "android.widget.Switch"
import "android.widget.Spinner"
import "android.graphics.PorterDuffColorFilter"
import "android.graphics.PorterDuff"
import "android.graphics.Bitmap"
import "java.io.FileOutputStream"
import "java.io.File"
import "android.graphics.drawable.ColorDrawable"
import "android.content.Context"
import "android.content.Intent"
import "android.view.WindowManager"
import "android.widget.ScrollView"
import "android.widget.CircleImageView"
import "android.net.Uri"
import "android.graphics.drawable.GradientDrawable"
import "android.view.ViewAnimationUtils"
import "android.widget.TextView"
import "android.graphics.Bitmap"
import "android.animation.ArgbEvaluator"
import "android.os.Build"
import "android.app.AlertDialog"
import "android.view.animation.DecelerateInterpolator"
import "android.animation.ArgbEvaluator"
import "android.widget.ImageView"
import "android.widget.EditText"
import "android.webkit.MimeTypeMap"
import "android.content.ClipData"
import "android.provider.MediaStore"
import "android.content.ContentValues"
import "android.graphics.BitmapFactory"
import "android.view.Gravity"
import "android.widget.Toast"
import "android.text.format.Formatter"
import "android.view.inputmethod.InputMethodManager"

w=this.width
h=this.height
window=activity.getWindow()
DecorView=window.getDecorView()
pack_name=this.getPackageName()
window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
DecorView.setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN|View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR)
window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS)
window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
window.setStatusBarColor(Color.TRANSPARENT)
window.setNavigationBarColor(0xFFF7F7F7)

local resid=activity.getResources().getIdentifier("status_bar_height","dimen","android")
if resid>0 then
  状态栏高度 = activity.getResources().getDimensionPixelSize(resid)
 else
  状态栏高度 = w*0.07
end
titleClose=function() end



--下载方式
function Too_young()
  webView.setDownloadListener{onDownloadStart=function(url,userAgent,contentDisposition,mimetype,contentLength)
    文件名=URLUtil.guessFileName(url, contentDisposition, mimeType);
    下载链接=url
    文件类型=mimetype
    文件大小=Formatter.formatFileSize(this, contentLength)
    下载()
    function adm(dlurl)
      this.startActivity(Intent().setAction("android.intent.action.SEND").setType("text/*").putExtra("android.intent.extra.TEXT", dlurl).setClassName("com.dv.adm", "com.dv.get.Main"));
    end
  end}
end





--print美化事项
主题色=0xFFFFA9BE
按钮文字色=主题色
顶栏文字色=0xFFFFFFFF

function 圆角(控件,背景色,角度)
  local gd=GradientDrawable()
  .setShape(GradientDrawable.RECTANGLE)
  .setColor(背景色)
  .setCornerRadii(角度)
  if 控件 then
    控件.setBackgroundDrawable(gd)
  end
  return gd
end





--圆角弹窗事项
function setDialogButtonColor(id,button,color)
  local win=id.getWindow()
  if Build.VERSION.SDK_INT >= 22 then
    import "android.graphics.PorterDuffColorFilter"
    import "android.graphics.PorterDuff"
    local b1=id.getButton(id.BUTTON_NEUTRAL)
    local b2=id.getButton(id.BUTTON_NEGATIVE)
    local b3=id.getButton(id.BUTTON_POSITIVE)
    if button==1 then
      b3.setTextColor(color)
    elseif button==2 then
      b2.setTextColor(color)
    elseif button==3 then
      b1.setTextColor(color)
    elseif button==0 then
      b1.setTextColor(color)
      b2.setTextColor(color)
      b3.setTextColor(color)
    end
    b1.getPaint().setFakeBoldText(true)
    b2.getPaint().setFakeBoldText(true)
    b3.getPaint().setFakeBoldText(true)
  else
    return false
  end
  pcall(function () id.findViewById(android.R.id.message).setTextIsSelectable(true) end)
end





--下面是有按钮的toast
function 按钮提示(content,botton,operate)
return toastwbtn(content,botton,operate)
end

function toastwbtn(content,botton,operate)
pop_toast=PopupWindow(activity)--创建PopWindow
  pop_toast.setContentView(loadlayout(
  {
  LinearLayout;
  layout_height="48dp";--"fill";
  gravity="bottom";
  layout_width="24%w";
  orientation="vertical";
  {
    LinearLayout;
--    background="#4FC3F7";--背景色
    layout_width="fill";
    layout_height="24%w";
                  id="beijing";
    {
      LinearLayout;
      gravity="center|left";
      layout_width="75%w";
      layout_height="fill";
      {
        TextView;
        textColor="#FF000000";
        text=content;
                    textSize="18sp";--文字大小
        layout_marginLeft="16dp";

      };
    };
    {
      LinearLayout;
      gravity="center";
      layout_height="fill";
      layout_width="25%w";
      id="btn";
      layout_gravity="center";
      {
        TextView;
        textSize="16dp";
        textColor="#ffffff";--按钮颜色
        text=botton;
      };
    };
  };
}
  ))--设置布局
  pop_toast.setHeight(activity.Width*0.14) --设置显示高度
  pop_toast.setWidth(-5) --设置显示宽度
  pop_toast.setFocusable(false)--设置可获得焦点
  pop_toast.setOutsideTouchable(false)--设置点击外部区域后消失
  pop_toast.setTouchable(true)--设置可触摸
  import "android.graphics.drawable.ColorDrawable"
  pop_toast.setBackgroundDrawable(ColorDrawable(0xFF999FFD));

  pop_toast.showAtLocation(lay,Gravity.BOTTOM,0,60)--设置位置并显示
  
  
  
  
  

beijing.onClick=function()
pop_toast.dismiss()
end
btn.onClick=function()
if operate~=nil then
loadstring(operate)()
end
pop_toast.dismiss()
end
end








