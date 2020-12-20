--[[
小记事 project by Ayaka_Ago
]]

import "android.app.*"
import "android.os.*"
import "android.widget.HorizontalScrollView"
import "com.androlua.LuaUtil"
import "android.support.v4.widget.SwipeRefreshLayout"
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
import "android.view.inputmethod.InputMethodManager"
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
import "java.lang.Math"
import "android.view.ViewAnimationUtils"

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
本地版本=this.getPackageManager().getPackageInfo(pack_name,64).versionName
内部版本=this.getPackageManager().getPackageInfo(pack_name,64).versionCode
window.setNavigationBarColor(0xFFB8B8B8)
local resid=activity.getResources().getIdentifier("status_bar_height","dimen","android")
if resid>0 then
  状态栏高度 = activity.getResources().getDimensionPixelSize(resid)
 else
  状态栏高度 = w*0.07
end
imm = activity.getSystemService(Context.INPUT_METHOD_SERVICE)
piclist={
"http://image.coolapk.com/picture/2019/0128/18/1414254_1548672692_5472@1440x2560.jpg.m.jpg", --两个粉红色圆形
"http://image.coolapk.com/picture/2019/0125/11/1914123_1548388091_471@1080x2160.jpg.m.jpg", --灰蓝灰白渐变
"http://image.coolapk.com/picture/2019/0124/17/1062337_1548321577_1253@1080x2160.png.m.jpg", --顶部橙色波浪
"http://image.coolapk.com/picture/2019/0120/10/1118425_1547952433_2893@1080x1919.jpg.m.jpg", --吊饰
"http://image.coolapk.com/picture/2019/0121/08/1147616_1548029107_1659@1080x1920.jpg.m.jpg"; --荷叶与猫咪
"http://image.coolapk.com/picture/2019/0201/09/1866552_1548983857_1882@1080x1919.jpg.m.jpg"; --云与海
"http://image.coolapk.com/picture/2019/0201/09/1866552_1548983859_8499@1080x1919.jpg.m.jpg"; --礁石上的海鸥
"http://image.coolapk.com/picture/2019/0130/11/1058369_1548818235_8891@1080x1920.jpg.m.jpg"; --饮料机旁猫和人
"http://image.coolapk.com/picture/2019/0126/21/1166111_1548510997_9613@1080x1920.jpg.m.jpg"; --质感白色
"http://image.coolapk.com/picture/2019/0122/10/2080075_1548123255_6404@720x1280.jpg.m.jpg"; --天空下竹竿吊饰
"http://image.coolapk.com/picture/2019/0119/00/2129136_1547830299_2528@1080x2160.jpg.m.jpg"; --未上色的建筑建模
"http://image.coolapk.com/picture/2019/0103/18/1625219_1546509870_1319@1080x1920.jpg.m.jpg"; --粉紫的山峦
"http://image.coolapk.com/picture/2019/0103/18/1625219_1546509873_0732@1080x1920.jpg.m.jpg"; --蓝山峦
"http://image.coolapk.com/picture/2018/1230/19/1118425_1546167826_5698@1080x1920.jpg.m.jpg";--天与海中一艘船
"http://image.coolapk.com/picture/2018/1230/19/1118425_1546167841_0472@1080x1920.jpg.m.jpg"; --海滩
"http://image.coolapk.com/picture/2018/1223/16/1865879_1545552135_2609@1080x2280.png.m.jpg";--一只猫躺着
"http://image.coolapk.com/picture/2019/0130/08/615966_1548807965_0339@1080x1920.jpg.m.jpg";--秋天树林
"http://image.coolapk.com/picture/2019/0129/19/750329_1548762294_5761@1080x2160.jpg.m.jpg";--柴柴顶面包
"http://image.coolapk.com/picture/2019/0129/19/750329_1548762297_3927@1080x2160.jpg.m.jpg";--柴柴睡了
"http://image.coolapk.com/picture/2019/0129/19/750329_1548762305_8528@1080x2160.jpg.m.jpg";--柴柴顶树叶
"http://image.coolapk.com/picture/2019/0126/12/898597_1548477241_721@720x1280.jpg.m.jpg";--屋里花与猫
"http://image.coolapk.com/picture/2018/1229/14/1190381_1546064967_6429@1080x1920.jpg.m.jpg";--面包上躺一只猫
"http://image.coolapk.com/picture/2018/1104/08/945857_1541291868_7698@1200x2133.png.m.jpg";--树枝下果子和猫
"http://image.coolapk.com/picture/2018/1027/17/1310491_1540632977_8286@960x1920.jpg.m.jpg";--歇息的猫
}
主题色=0xFF2EC4B6
顶栏文字色=0xffffffff
顶栏图标色=0xffffffff
按钮文字色=主题色
card_color_list={-1,tonumber(0xFFACACAC),tonumber(0xFFFF8074),tonumber(0xFFFFff00),tonumber(0xFFD1F5FF),tonumber(主题色)}
app_path="/sdcard/小记事/" 
记事文件=app_path.."记事/"
配图目录=app_path.."配图备份/"
File(app_path).mkdirs()
File(记事文件).mkdirs()
File(配图目录).mkdirs()

function GetFileSize(path)
 return File(tostring(path)).length()
end

function shareText(t)
local f,e=pcall(function ()
activity.startActivity(Intent.createChooser(Intent(Intent.ACTION_SEND)
.setType("text/plain")
.putExtra(Intent.EXTRA_SUBJECT, "分享")
.putExtra(Intent.EXTRA_TEXT, t)
.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK),"分享到:"))
  end)
 if e then
  print ("无法进行分享")
 end
end

function 透明动画(id,时间,开始透明度,结束透明度)
  id.startAnimation(AlphaAnimation(开始透明度,结束透明度).setDuration(时间))
end

function getFileSize(path)
 return Formatter.formatFileSize(activity, File(tostring(path)).length())
end

function 波纹(颜色)
  return activity.Resources.getDrawable(activity.obtainStyledAttributes({android.R.attr.selectableItemBackgroundBorderless}).getResourceId(0,0)).setColor(ColorStateList(int[0].class{int{}},int{颜色}))
end

function getFileCount(path)
if File(path).listFiles()~=nil then
local list=luajava.astable(File(path).listFiles())
return #list
else
return 0
end
end

function getFileList(path)
if File(path).listFiles()~=nil then
return luajava.astable(File(path).listFiles())
else
return {"no file"}
end
end

function StrToTable(str)
    if str == nil or type(str) ~= "string" then
        return
    end
    return loadstring("return " .. str)()
end

function getFileName(path)
return File(path).getName()
end

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

function 上下渐变(color)
  return GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM,color)
end

function newNote()
local log=记事文件..os.time()..".txt"
File(log).createNewFile()
io.open(log,"w+"):write([[{
["date"]	={
["create"]	="]]..os.date("%y.%m.%d %H:%M:%S")..[[";
["update"]	="]]..os.date("%y.%m.%d %H:%M:%S")..[[";
};
["content"]	={
["color"]="0xffffffff",
["category"]="记事",
["title"]	="";
["star"]=false,
["messages"]	=]].."[[]]"..[[;
};
}]]):close()
this.newActivity("edit",{log})
refreshList()
end

function transColor(view,type,color,time)
  ObjectAnimator.ofInt(view,type,color) 
  .setDuration(time) 
  .setEvaluator(ArgbEvaluator())
  .start()
end

function setSystemUi(isBlack)
if isBlack then
DecorView.setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN|View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR)
else
DecorView.setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN)
end
end

function print(内容)
  local toast=Toast.makeText(activity,"", Toast.LENGTH_SHORT)
  toast.setView(loadlayout({
    LinearLayout,
    layout_width="100%w",
    gravity="center", 
    orientation="horizontal",
      {
        TextView,
        text=tostring(内容), 
        background=圆角(nil,主题色,{17,17,17,17,17,17,17,17}),
        layout_height="fill",
        textColor=顶栏文字色, 
        layout_margin="2%w", 
        padding="3%w", 
        elevation="1%w",
        layout_width="95%w",
        layout_gravity="center", 
        id="toast_main",
        gravity="center", 
    },
  }))
  toast.setGravity(Gravity.TOP,0,w*0.15);
  toast.show()
end

function setDialogButtonColor(id,button,color)
local win=id.getWindow()
  if Build.VERSION.SDK_INT >= 22 then
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
   else
    return false
  end
  pcall(function () id.findViewById(android.R.id.message).setTextIsSelectable(true) end)
end

function 圆形扩散(v,sx,ex,sy,ey,time)
ViewAnimationUtils.createCircularReveal(v,sx,ex,sy,ey)
.setDuration(time)
.start()
end

function getActuallyTitle(ori)
if #ori<1 then
return "无标题"
else
return ori
end
print (ori)
end

function getActuallyContent(ori)
if #ori<1 then
return "无内容"
else
return ori
end
print (ori)
end
