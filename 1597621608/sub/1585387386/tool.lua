--快捷工具栏 by 酷安@Too_young，如需使用请注明
--请勿删除版权信息
--为了照顾小白，已将id等命名为简单易懂的中文

--[[
使用说明：
-快捷工具栏的初衷：取代顶栏图标，使顶栏更加简洁，并让操作更便捷。
-快捷工具栏的样式模仿了Android P的关机菜单，可以自行修改样式
-我在可以自定义的地方（例如颜色，尺寸等）做了标注，可以自己试着改
-从屏幕右侧向左滑动打开快捷工具栏，反方向滑动或者点击快捷工具栏左侧区域关闭。
-在某些情况下，快捷工具栏可能会影响使用（例如与MIUI的全面屏手势冲突），这时可以关闭快捷工具栏，使用顶栏的菜单替代快捷工具栏。
-打开快捷工具栏，点击设置菜单进行设置
-“快捷工具栏”代码是从我用fa制作的软件“老子要刷机”中移植过来的，你可以在打开的蓝奏云链接中下载成品参考。
-快捷工具栏只是“老子要刷机”的冰山一角，如果想要这个软件的部分其他源码，可以在酷安联系我。如果我同意的话，会将部分源码给你。（伸手党可以无视这一条）
]]

侧栏颜色=0xFFFFFFFF--快捷工具栏背景色
波纹颜色=0x40000000--菜单按钮的波纹颜色

function 波纹(id,颜色)
  import "android.content.res.ColorStateList"
  local attrsArray = {android.R.attr.selectableItemBackgroundBorderless} 
  local typedArray =activity.obtainStyledAttributes(attrsArray) 
  ripple=typedArray.getResourceId(0,0) 
  Pretend=activity.Resources.getDrawable(ripple) 
  Pretend.setColor(ColorStateList(int[0].class{int{}},int{颜色}))
  id.setBackground(Pretend.setColor(ColorStateList(int[0].class{int{}},int{颜色})))
end

function 启用菜单()
  菜单布局={
    LinearLayout;
    layout_height="fill";
    layout_width="48dp";
    orientation="horizontal";
    {
      ImageView;
      id="菜单按钮";
      layout_marginLeft="10dp";
      layout_marginRight="15dp";
      layout_height="23dp";
      layout_width="23dp";
      src="drawable/__ic_more.png";
      ColorFilter="#FFFFFFFF";--菜单按钮颜色
      layout_gravity="center";
    };
  };

  toolbar.addView(loadlayout(菜单布局))

  菜单按钮.onClick=function()
    pop=PopupMenu(activity,菜单按钮)
    menu=pop.Menu
    menu.add("刷新网页").onMenuItemClick=function(a)
      刷新网页()
    end
    menu.add("网页后退").onMenuItemClick=function(a)
      网页后退()
    end
    menu.add("网页前进").onMenuItemClick=function(a)
      网页前进()
    end
    menu.add("设置菜单").onMenuItemClick=function(a)
      设置菜单()
    end
    menu.add("退出程序").onMenuItemClick=function(a)
      退出页面()
    end
    pop.show()--显示菜单
  end
  波纹(菜单按钮,波纹颜色)
end

function 启用快捷工具栏()
  快捷工具栏布局={
    LinearLayout,
    id="快捷工具栏",
    layout_width="70dp",--快捷工具栏布局宽度
    layout_height="fill",
    orientation="vertical";
    gravity="center";
    {
      CardView;
      radius="5dp";--设置圆角
      id="侧滑卡片";
      Elevation=0;--关闭阴影
      layout_width="60dp";--快捷工具栏宽度
      layout_marginRight="10dp";--快捷工具栏向左移动10dp
      layout_gravity="right|center";
      {
        ListView; 
        dividerHeight="0";--隐藏列表分隔线
        layout_width="fill";
        layout_height="fill";
        id="侧滑列表";
      };
    };
  };

  列表布局={
    LinearLayout;
    gravity="center";
    layout_width="60dp";
    orientation="vertical";
    layout_height="50dp";
    {
      ImageView;
      id="布局图标";
      ColorFilter="#FF7490FF";--图标颜色
      layout_height="25dp";
      layout_width="25dp";
    };
    {
      TextView;
      id="布局文字";
      textColor="#FF757575";--文字颜色
      textSize="12dp";
    };
  };
  列表数据={}--可以自己增减项目
  列表图标={"drawable/refresh.png","drawable/arrow_left.png","drawable/arrow_right.png","drawable/cog.png","drawable/exit_to_app.png";}
  列表文字={"刷新网页","网页后退","网页前进","设置菜单","退出程序"}
  for 列表数量=1,#列表文字 do
    table.insert(列表数据,{布局文字=列表文字[列表数量],布局图标=列表图标[列表数量]})
  end
  列表适配器=LuaAdapter(activity,列表数据,列表布局)

  drawerLayout.addView(loadlayout(快捷工具栏布局))

  侧滑列表.Adapter=列表适配器

  侧滑列表.setOnItemClickListener(AdapterView.OnItemClickListener{
    onItemClick=function(parent,v,pos,id)
      if pos == 0 then--可以自己增减项目
        刷新网页()
        drawerLayout.closeDrawer(5)--点击后关闭快捷工具栏
      elseif pos == 1 then
        网页后退()
        drawerLayout.closeDrawer(5)
      elseif pos == 2 then
        网页前进()
        drawerLayout.closeDrawer(5)
      elseif pos == 3 then
        设置菜单()
        drawerLayout.closeDrawer(5)
      elseif pos == 4 then
        退出页面()
        drawerLayout.closeDrawer(5)
      end
    end
  }) 

  快捷工具栏.LayoutParams.gravity=5--设置为右侧侧栏

  if 快捷工具栏设置=="true" then
    侧滑卡片.setCardBackgroundColor(侧栏颜色)--设置侧栏颜色
  end
end

快捷工具栏文件="/data/data/"..activity.getPackageName().."/快捷工具栏设置.txt"
File(快捷工具栏文件).createNewFile()--创建保存配置的文件
快捷工具栏设置=io.open(快捷工具栏文件):read("*a")--读取文件
if 快捷工具栏设置=="" then--默认打开快捷工具栏
  io.open(快捷工具栏文件,"w+"):write("true"):close()
  快捷工具栏设置="true"
  启用快捷工具栏()
end
if 快捷工具栏设置=="true" then--检验是否开启快捷工具栏
  启用快捷工具栏()
else
  启用菜单()
end

function 设置菜单()--设置快捷工具栏
  设置布局={
    LinearLayout;
    gravity="center";
    {
      LinearLayout;
      layout_width="210dp";
      orientation="vertical";
      {
        TextView;
        text="开关";
        textSize="18dp";
      };
      {
        TextView;
        textColor="#FF969696";
        text="当快捷工具栏影响使用（如与MIUI的全面屏手势冲突）时，可以关闭该功能。关闭后快捷工具栏的功能会移至顶栏的菜单中";
        textSize="12dp";
      };
    };
    {
      Switch;
      id="开关";
    };
  };
  AlertDialog.Builder(this)
  .setTitle("设置")
  .setMessage("快捷工具栏设置")
  .setView(loadlayout(设置布局))
  .setPositiveButton("关闭",nil) 
  .show()

  if 快捷工具栏设置=="true" then
    开关.setChecked(true)
  end

  开关.setOnCheckedChangeListener{
    onCheckedChanged=function(g,c)
      if c then
        io.open(快捷工具栏文件,"w+"):write("true"):close()
        AlertDialog.Builder(this)
        .setTitle("提示")
        .setMessage("设置将在重启后生效")
        .setNegativeButton("好",nil)
        .setPositiveButton("重启",function()
          退出页面()
        end)
        .show()
      else
        io.open(快捷工具栏文件,"w+"):write("false"):close()
        AlertDialog.Builder(this)
        .setTitle("提示")
        .setMessage("设置将在重启后生效")
        .setNegativeButton("好",nil)
        .setPositiveButton("重启",function()
          退出页面()
        end)
        .show()
      end
    end}
end

function exit()--按两次返回键退出
  back=0
  function onKeyDown(key,event)
    if(key==4)then--当侧栏或快捷工具栏打开时按返回键关闭
      if drawerLayout.isDrawerOpen(3) or drawerLayout.isDrawerOpen(5) then
        drawerLayout.closeDrawer(3)--如果停用了侧滑，就把这一行和上一行中的“drawerLayout.isDrawerOpen(3) or ”删掉
        if 快捷工具栏设置=="true" then
          drawerLayout.closeDrawer(5)
        end
      else
        if(webView.canGoBack())then--当网页可以后退时后退
          webView.goBack()
        else
          back=back+1
          if(back==1)then 
            print("再按一次返回键退出")
            back=1
          end
          task(2500,function()--默认Toast消息时长为2.5s
            back=0
          end)
          if(back==2)then--按两次返回键退出
            退出页面()
          end
        end
      end
      return true
    end
  end
end
exit()