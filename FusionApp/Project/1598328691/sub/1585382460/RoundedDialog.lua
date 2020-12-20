require "import"
import "android.graphics.drawable.ColorDrawable"
import "android.transition.Visibility"
import "android.opengl.Visibility"
import "android.widget.*"
import "android.view.*"
import "android.view.animation.*"
local Roundeddialog={}
local n={}
n.we1='1'
n.we2='1'
n.we3='1'
function n.fun1()

end

function n.fun2()

end

function n.fun3()

end

function n.退出()
  local Alpha=AlphaAnimation(1,0)
  Alpha.setDuration(150)
  task(150,function()
    back.setAlpha(0)
  end)
  task(150,function()
    pop.dismiss()
  end)
  task(1,function()
    back.startAnimation(Alpha)
  end)
end

function 圆角对话框()
  return Roundeddialog
end

function Roundeddialog.设置标题(text)
  n.title=text
  return Roundeddialog
end

function Roundeddialog.设置消息(text)
  n.text=text
  return Roundeddialog
end

function Roundeddialog.设置积极按钮(text,fun)
  n.button3=text
  if fun then
    n.fun3=fun
  end
  return Roundeddialog
end
function Roundeddialog.设置消极按钮(text,fun)
  n.button1=text
  if fun then
    n.fun1=fun
  end
  return Roundeddialog
end

function Roundeddialog.设置中立按钮(text,fun)
  n.button2=text
  if fun then
    n.fun2=fun
  end
  return Roundeddialog
end

function Roundeddialog.设置圆角(radius)
  n.radius=radius
  return Roundeddialog
end

function Roundeddialog.显示()
  local viewlayout={
    RelativeLayout,
    id='back',
    layout_height=-1,
    layout_width=-1,
    backgroundColor="#00000000",
    onClick=function()
      n.退出()
    end,
    {
      CardView,
      id='card',
      Visibility="invisible",
      layout_column='1',
      layout_height=-2,
      layout_width='85%w',
      layout_centerInParent="true",
      CardElevation="24dp",
      CardBackgroundColor="#ffffff",
      Radius=n.radius,
      onClick=function()
        return true
      end,
      {
        RelativeLayout,
        layout_width="match_parent",
        layout_height="wrap_content",
        padding='10dp',
        {
          TextView,
          id='retitle',
          text=n.title,
          gravity='center',
          layout_width='match_parent',
          textSize='24sp',
          textStyle='bold',
          layout_height=-2,
          textColor='#b3000000',
        },
        {
          TextView,
          id='retext',
          layout_below="retitle",
          layout_width='match_parent',
          layout_height='wrap_content',
          text=n.text,
          padding='10dp',
          textColor='#80000000',
        },
        {
          LinearLayout,
          layout_width=-1,
          layout_height=-2,
          layout_below='retext',
          orientation="horizontal",
          {
            TextView,
            layout_width='0dp',
            layout_height=-2,
            layout_weight="1.0",
            gravity='center',
            text=n.button1,
            backgroundColor="#00000000",
            onClick=function()
              n.fun1()
              n.退出()
            end,
          },
          {
            TextView,
            layout_width='0dp',
            layout_height=-2,
            layout_weight="1.0",
            gravity='center',
            text=n.button2,
            backgroundColor="#00000000",
            onClick=function()
              n.fun2()
              n.退出()
            end,
          },
          {
            TextView,
            layout_width='0dp',
            layout_height=-2,
            layout_weight="1.0",
            gravity='center',
            text=n.button3,
            backgroundColor="#00000000",
            onClick=function()
              n.fun3()
              n.退出()
            end,
          },
        },
      },
    },
  }




  we=activity.getWidth()
  he=activity.getHeight()
  task(1,function()
    pop=PopupWindow(loadlayout(viewlayout))
    pop.setFocusable(true)
    pop.setWidth(we)
    pop.setHeight(he)
    pop.setTouchable(true)
    pop.setOutsideTouchable(false)
    pop.setBackgroundDrawable(ColorDrawable(0x00000000))
    pop.showAtLocation(webView,Gravity.CENTER,0,0)
    card.setVisibility(View.VISIBLE)
    card.startAnimation(ScaleAnimation(0.0, 1.0, 0.0, 1.0,1, 0.5, 1, 0.5).setDuration(250))
    local Alpha=AlphaAnimation(0,1)
  Alpha.setDuration(200)
  task(1,function()
  back.setBackgroundDrawable(ColorDrawable(0x00000000))
    back.startAnimation(Alpha)
  end)
  end)
end
