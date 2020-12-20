--悬浮
require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
fltBtn.addView(loadlayout({
  RelativeLayout;
  layout_height="fill";
  layout_width="fill";
  background="#00FFFFFF";
  {
    CardView;
    layout_marginRight="4dp"; 
    layout_alignParentRight="true";
    Visibility="visible";
    layout_width="50dp";
    id="cardview";
    layout_alignParentBottom="true";
    layout_marginBottom="4dp";
    cardElevation="4dp";
    layout_height="50dp";
    {
      ImageView;
      layout_gravity="center";
      layout_marginRight="3dp";
      layout_marginLeft="3dp";
      src="drawable/__ic_menu.png";
      id="text";
    };
  };
  {
    CardView;
    layout_height="50dp";
    Visibility="invisible";
    layout_alignLeft="cardview";
    layout_width="50dp";
    id="cardview1";
    layout_marginBottom="14dp";
    cardElevation="4dp";
    layout_above="cardview";
    {
      TextView;
      textColor="#FFFFFFFF";
      layout_gravity="center";
      textSize="14dp";
      text="刷新";
      id="text1";
    };
  };
  {
    CardView;
    layout_height="50dp";
    Visibility="invisible";
    layout_alignLeft="cardview1";
    layout_width="50dp";
    id="cardview2";
    layout_marginBottom="14dp";
    cardElevation="4dp";
    layout_above="cardview1";
    {
      TextView;
      textColor="#FFFFFFFF";
      layout_gravity="center";
      textSize="14dp";
      text="语录";
      id="text2";
    };
  };
  {
    CardView;
    layout_height="50dp";
    Visibility="invisible";
    layout_alignLeft="cardview2";
    layout_width="50dp";
    id="cardview3";
    layout_marginBottom="14dp";
    cardElevation="4dp";
    layout_above="cardview2";
    {
      TextView;
      textColor="#FFFFFFFF";
      layout_gravity="center";
      textSize="14dp";
      text="技巧";
      id="text3";
    };
  };
  {
    CardView;
    layout_height="50dp";
    Visibility="invisible";
    layout_alignLeft="cardview3";
    layout_width="50dp";
    id="cardview4";
    layout_marginBottom="14dp";
    cardElevation="4dp";
    layout_above="cardview3";
    {
      TextView;
      textColor="#FFFFFFFF";
      layout_gravity="center";
      textSize="14dp";
      text="更多";
      id="text3";
    };
  };
}))
id=fltBtn;
wi=activity.getWidth()*31/180
he=activity.getHeight()
function dianji()
  if cardview1.getVisibility()==0 then
    import "android.view.animation.Animation$AnimationListener"
    import "android.view.animation.ScaleAnimation"
    cardview1.startAnimation(ScaleAnimation(1.0, 0.0, 1.0, 0.0,1, 0.5, 1, 0.5).setDuration(100))
    cardview1.setVisibility(View.INVISIBLE)
    cardview2.startAnimation(ScaleAnimation(1.0, 0.0, 1.0, 0.0,1, 0.5, 1, 0.5).setDuration(200))
    cardview2.setVisibility(View.INVISIBLE)
    cardview3.startAnimation(ScaleAnimation(1.0, 0.0, 1.0, 0.0,1, 0.5, 1, 0.5).setDuration(300))
    cardview3.setVisibility(View.INVISIBLE)
    cardview4.startAnimation(ScaleAnimation(1.0, 0.0, 1.0, 0.0,1, 0.5, 1, 0.5).setDuration(400))
    cardview4.setVisibility(View.INVISIBLE)
    text.setImageBitmap(loadbitmap("drawable/__ic_menu.png"))
    task(300,function()
      linearParams = id.getLayoutParams()
      linearParams.width=wi
      id.setLayoutParams(linearParams)
      linearParams = id.getLayoutParams()
      linearParams.height=wi
      id.setLayoutParams(linearParams)
    end)
  else
    import "android.view.animation.ScaleAnimation"
    cardview1.setVisibility(View.VISIBLE)
    cardview1.startAnimation(ScaleAnimation(0.0, 1.0, 0.0, 1.0,1, 0.5, 1, 0.5).setDuration(100))
    cardview2.setVisibility(View.VISIBLE)
    cardview2.startAnimation(ScaleAnimation(0.0, 1.0, 0.0, 1.0,1, 0.5, 1, 0.5).setDuration(200))
    cardview3.setVisibility(View.VISIBLE)
    cardview3.startAnimation(ScaleAnimation(0.0, 1.0, 0.0, 1.0,1, 0.5, 1, 0.5).setDuration(300))
    cardview4.setVisibility(View.VISIBLE)
    cardview4.startAnimation(ScaleAnimation(0.0, 1.0, 0.0, 1.0,1, 0.5, 1, 0.5).setDuration(400))
    text.setImageBitmap(loadbitmap("drawable/__ic_close.png"))
    linearParams = id.getLayoutParams()
    linearParams.width=wi
    id.setLayoutParams(linearParams)
    linearParams = id.getLayoutParams()
    linearParams.height=he*0.7
    id.setLayoutParams(linearParams)
    id.setBackgroundColor(0x00ffffff)
  end
end
function CircleButton(view,InsideColor)
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable() 
  drawable.setShape(GradientDrawable.OVAL) 
  drawable.setColor(InsideColor)
  view.setBackgroundDrawable(drawable)
  view.setElevation(4.0)
end
控件颜色=0xFFEE7785
CircleButton(cardview,控件颜色)
CircleButton(cardview1,控件颜色)
CircleButton(cardview2,控件颜色)
CircleButton(cardview3,控件颜色)
CircleButton(cardview4,控件颜色)
cardview.onLongClick=function()
  import "android.view.animation.ScaleAnimation"
  id.startAnimation(ScaleAnimation(1.0, 0.0, 1.0, 0.0,1, 0.5, 1, 0.5).setDuration(300))
  id.setVisibility(View.GONE)
  dianji()
end
cardview.onClick=function()
  dianji()
end
cardview.onClick=function()
  dianji()
end
cardview1.onClick=function()
  刷新网页()
  dianji()
end
cardview2.onClick=function()
  进入子页面("情感语录")
  dianji()
end
cardview3.onClick=function()
  进入子页面("撩妹惯例")
  dianji()
end