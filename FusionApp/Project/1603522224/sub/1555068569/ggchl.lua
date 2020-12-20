--公告
对话框()
.设置标题("公告")
.设置消息("本程序名为幸运树本地精简版。\n本程序为本地版公告、状态栏通知、软件更新、远程锁定、启动页、爱情加工厂图片、网络同步背景均无法远程控制，需要定制远程版请加群。\n修改工具推荐使用fusion app、MT文件管理器。\n修改过程中如有疑问请加群：775811238")
.设置积极按钮("确定",function()
end)
.设置消极按钮("取消")
.显示()
--侧滑栏
drawerLayout.setScrimColor(0)
drawerLayout.addView(loadlayout({
  ImageView,
  id="background",
  scaleType="fitXY",
}),0)
function setdata(a,b)
  c = this.getSharedPreferences("PicCustom", Activity.MODE_PRIVATE)
  c.edit().putString(a, b).commit()
end
function getdata(a)
  c = this.getSharedPreferences("PicCustom", Activity.MODE_PRIVATE)
  b = c.getString(a, "")
  return b
end
if getdata("fileSrc")=="" then
  background.setImageBitmap(loadbitmap("2.jpg"))
 else
  background.setImageBitmap(loadbitmap(getdata("fileSrc")))
end
local lay=drawerLayout.getChildAt(1)
function CircleButton(view,InsideColor,radiu)
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setColor(InsideColor)
  drawable.setCornerRadii({radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu});
  view.setBackgroundDrawable(drawable)
end
角度=50
控件id=sidebar
控件颜色=0xA1FFFFFF
CircleButton(控件id,控件颜色,角度)
linearParams = sidebar.getLayoutParams()
linearParams.width =520
local h=this.getHeight()
linearParams.height =h-100
sidebar.setLayoutParams(linearParams)
flt=sidebar.getLayoutParams( )
flt.setMargins(0, 60,0,300)
sidebar.setLayoutParams(flt)
local pio=this.getWidth()*0.1
drawerLayout.setDrawerListener(DrawerLayout.DrawerListener{
  onDrawerSlide=function(v,i)
    lay.setScaleX(1-i/3.5).setScaleY(1-i/3.5)
    lay.setTranslationX((({0,0,1,0,-1})[v.LayoutParams.gravity])*(i*7*pio))
  end})
function onKeyDown(key,event)
  if(key==4)then
    if drawerLayout.isDrawerOpen(3) or drawerLayout.isDrawerOpen(5) then
      drawerLayout.closeDrawer(3)
     elseif(webView.canGoBack())then
      webView.goBack()
     else
      this.finish()
    end
    return true
  end
end