require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import 'android.support.*'
import "com.androlua.LuaAdapter"
import "org.w3c.dom.Text"
import "android.view.WindowManager"
import "android.widget.TextView"
import "com.androlua.LuaAdapter"
import "android.widget.ImageView"
import "android.widget.ListView"
import "android.support.v7.widget.*"
import "android.widget.GridLayout"
import "android.support.v4.app.*"
import "com.tencent.smtt.sdk.*"
import "android.widget.PopupMenu"


fltBtncolor='#FFFFFFFF'--悬浮窗颜色
fltBtncolor2='#FF4E8EFE'--悬浮窗图标颜色

color1='#ffffff'--页面背景颜色
image1='welcome1.png'--页面图片路径

color2='#ffffff'
image2='welcome2.png'

color3='#ffffff'
image3='welcome3.png'

local viewlayout={
RelativeLayout,
layout_height="match_parent",
layout_width="match_parent",
{
LinearLayout,
id='back',
orientation="vertical",
layout_width="match_parent",
layout_height="match_parent",
{
PageView,
layout_width="match_parent",
id="hd",
layout_height="match_parent",
pages={
{
RelativeLayout,
background=color1,
layout_width="match_parent",
layout_height="match_parent",
{
ImageView,
id='image1',
elevation='2dp',
layout_centerInParent="true",
background='#ffefefef',
src=image1,
layout_width="100%w",
layout_height="100%h",
},
},
{
RelativeLayout,
background=color2,
layout_width="match_parent",
layout_height="match_parent",
{
ImageView,
id='image2',
elevation='2dp',
layout_centerInParent="true",
background='#ffefefef',
src=image2,
layout_width="100%w",
layout_height="100%h",
},
},

{
RelativeLayout,
background=color3,
layout_width="match_parent",
layout_height="match_parent",
{
ImageView,
id='image3',
elevation='2dp',
layout_centerInParent="true",
background='#ffefefef',
src=image3,
layout_width="100%w",
layout_height="100%h",
},
},
},
},
},
{
LinearLayout,
id='tt',
layout_height="56dp",
background="#FFFFFFFF",
layout_centerHorizontal="true",
layout_alignBottom="back",
layout_width="match_parent",
layout_height="70dp",
gravity='center',
{
LinearLayout;
layout_width="12.4%w";
--底部滑条宽度
background="#FFFFFFFF",
--底部滑条背景色
{
TextView;
layout_width="3.125%w";
--滑动动作条的宽度
layout_height="2dp";
background="#FF4E8EFE",
id="hua",
},
},
},
{
CardView,
id='button',
layout_column='1',
layout_width='60dp',
CardElevation="3dp",
CardBackgroundColor=fltBtncolor,
layout_height='60dp',
Radius='30dp',
layout_alignRight="tt",
layout_alignTop="tt",
layout_marginRight="20dp",
layout_marginTop="-20dp",
{
ImageView,
id='imageview',
src='right.png',
ColorFilter=fltBtncolor2,
layout_width="wrap_content",
layout_height="wrap_content",
layout_gravity="center",
adjustViewBounds='true',
maxWidth='30dp',
maxHeight='30dp',
},
},
}


activity.requestWindowFeature(Window.FEATURE_NO_TITLE)
activity.getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,WindowManager.LayoutParams.FLAG_FULLSCREEN)
activity.setContentView(loadlayout(viewlayout))


local pag=0
local ppg=0
hd.addOnPageChangeListener{
onPageScrolled=function(p,pO,pp)
pag=p
ppg=pO
if pO~=0 then
hua.setX(activity.getWidth()/32*pO+p*activity.getWidth()/32)
end
if (pag==2 and tonumber(pO)>=0.1 or pag==3)then
imageview.setImageBitmap(loadbitmap('true.png'))
else
imageview.setImageBitmap(loadbitmap('right.png'))
end
end,
}
button.onClick=function()
if (pag==2 and tonumber(ppg)>=0.1 or pag==3)then
activity.finish()
end
hd.showPage(pag+1)
pag=pag+1
end