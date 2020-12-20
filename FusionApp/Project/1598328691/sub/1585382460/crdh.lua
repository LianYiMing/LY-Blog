require"import"
import "android.widget.LinearLayout"
import "android.widget.TextView"
import "android.widget.CardView"
import "android.widget.PopupWindow"
import "android.graphics.drawable.GradientDrawable$Orientation"
import "android.view.Gravity"
import "android.view.animation.TranslateAnimation"
import "android.view.animation.Animation"


diabj={
  LinearLayout;
  background="";
  gravity="center";
  orientation="vertical";
  layout_height="match";
  layout_width="match";
  {
    LinearLayout;
    layout_width="80%w";
    layout_height="30%h";
    {
      CardView;
      background="#ffffffff";
      layout_margin="1%w";
      radius="30";
      layout_height="match";
      elevation="10";
      layout_width="match";
      {
        LinearLayout;
        layout_width="match";
        orientation="horizontal";
        layout_height="5%h";
        gravity="center";
        {
          TextView;
          textSize="16sp";
          textColor="#000000";
          layout_height="wrap";
          text="清除数据中...";
          layout_width="wrap";
        };
      };
      {
        LinearLayout;
        layout_width="match";
        orientation="horizontal";
        layout_height="match";
        gravity="center";
        {
          CardView;
          id="ddq1";
          background="#FFEE7785";
          layout_margin="5%w";
          radius="2.5%w";
          layout_height="5%w";
          elevation="10";
          layout_width="5%w";
        };
        {
          CardView;
          id="ddq2";
          background="#FF84B1ED";
          layout_margin="5%w";
          radius="2.5%w";
          layout_height="5%w";
          elevation="10";
          layout_width="5%w";
        };
      };
    };
  };
};


pop=PopupWindow(activity)--创建PopWindow
pop.setContentView(loadlayout(diabj))--设置布局
pop.setWidth(activity.Width)--设置宽度
pop.setHeight(activity.Height)--设置高度
pop.setFocusable(true)--设置可获得焦点
pop.setTouchable(true)--设置可触摸
--设置点击外部区域是否可以消失
pop.setOutsideTouchable(false)
--显示

function 重复平移动画(a,b,c,d,e,f)
  Translate_up_down=TranslateAnimation(b, c, d, e)
  Translate_up_down.setDuration(f)
  Translate_up_down.setFillAfter(true)
  Translate_up_down.setRepeatCount(-1)--设置动画重复次数，这里-1代表无限
  Translate_up_down.setRepeatMode(Animation.REVERSE)
  a.startAnimation(Translate_up_down)
end