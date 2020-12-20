--悦听音乐台
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
      src="__ic_fltbtn.png";
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
      text="下载";
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
      text="收藏";
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
      text="教程";
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
      text="首页";
      id="text3";
    };
  };
  {
    CardView;
    layout_height="50dp";
    Visibility="invisible";
    layout_alignLeft="cardview4";
    layout_width="50dp";
    id="cardview5";
    layout_marginBottom="14dp";
    cardElevation="4dp";
    layout_above="cardview4";
    {
      TextView;
      textColor="#FFFFFFFF";
      layout_gravity="center";
      textSize="14dp";
      text="退出";
      id="text4";
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
    cardview5.startAnimation(ScaleAnimation(1.0, 0.0, 1.0, 0.0,1, 0.5, 1, 0.5).setDuration(500))
    cardview5.setVisibility(View.INVISIBLE)
    text.setImageBitmap(loadbitmap("__ic_fltbtn.png"))
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
    cardview5.setVisibility(View.VISIBLE)
    cardview5.startAnimation(ScaleAnimation(0.0, 1.0, 0.0, 1.0,1, 0.5, 1, 0.5).setDuration(500))
    text.setImageBitmap(loadbitmap("__ic_fltbtn.png"))
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
控件颜色=0xFFDB2C1F
CircleButton(cardview,控件颜色)
CircleButton(cardview1,控件颜色)
CircleButton(cardview2,控件颜色)
CircleButton(cardview3,控件颜色)
CircleButton(cardview4,控件颜色)
CircleButton(cardview5,控件颜色)
cardview5.onClick=function()
  退出页面()
  dianji()
end
cardview.onClick=function()
  dianji()
end
cardview3.onClick=function()
  import "android.graphics.drawable.ColorDrawable"
  import "android.content.res.ColorStateList"
  import "android.view.animation.Animation"
  import "android.view.animation.RotateAnimation"
  import "android.animation.Animator$AnimatorListener"
  yuxuan={
    LinearLayout,
    orientation="vertical",
    layout_height="50%h";
    layout_width="100%w";
    gravity="center";
    id="dc",
    {
      CardView;
      layout_height="60%h";
      id="card";
      {
        ScrollView,
        layout_width="fill";
        layout_height="fill";
        layout_marginTop="3%h",
        VerticalScrollBarEnabled=false;
        {
          LinearLayout,
          orientation="vertical",
          layout_height="fill";
          layout_width="fill";
          {
            LinearLayout;
            layout_height="10%h";
            layout_width="100%w";
            layout_marginTop="0%h",
            orientation="vertical",
            id="xm1",
            style="?android:attr/buttonBarButtonStyle";
            {
              LinearLayout;
              orientation="horizontal";
              layout_gravity="center";
              layout_width="50%w";
              layout_height="10%h";
              gravity="center";
              {
                TextView;
                layout_height="100dp";
                layout_width="100%w";
                gravity="center",
                textColor="#FF25AA62";
                text="下载教程";
                textSize='30dp';
              };
            };
          };
          {
            LinearLayout;
            layout_height="50%h";
            layout_width="100%w";
            layout_marginTop="1%h",
            orientation="vertical",
            id="xm7",
            style="?android:attr/buttonBarButtonStyle";
            {
              LinearLayout;
              orientation="horizontal";
              layout_gravity="center";
              layout_width="100%w";
              layout_height="100%h";
              gravity="center";
              {
                TextView;
                layout_height="100dp";
                layout_width="100%w";
                gravity="center",
                textColor="#FF808080";
                text="1、选择你所喜欢的音乐点击进入播放页\n\n2、在播放页点击悬浮球你可以选择下载或收藏\n\n3、部分数字专辑会出现下载失败情况";
                textSize='15dp';
              };
            };
          };
        },
      },
    },
  }
  dialog= AlertDialog.Builder(this)
  dialog1=dialog.show()
  dialog1.getWindow().setContentView(loadlayout(yuxuan));
  dialog1.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));
  dialogWindow = dialog1.getWindow();
  dialogWindow.setGravity(Gravity.BOTTOM);
  dialog1.setCancelable(true)
  p=dialog1.getWindow().getAttributes();
  p.width=(activity.Width);
  dialog1.getWindow().setAttributes(p);
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setColor(0x00FFFFFF)
  drawable.setCornerRadii({25,25,25,25,0,0,0,0});
  dc.setBackgroundDrawable(drawable)
  function 圆角(id)
    import "android.graphics.drawable.GradientDrawable"
    drawable = GradientDrawable()
    drawable.setShape(GradientDrawable.RECTANGLE)
    drawable.setColor(0xFFffffff)
    drawable.setCornerRadii({20,20,20,20,0,0,0,0});
    id.setBackgroundDrawable(drawable)
  end
  圆角(card)
  function 上滑动画(id)
    import "android.view.animation.LayoutAnimationController"
    import "android.view.animation.Animation"
    import "android.view.animation.AlphaAnimation"
    import "android.view.animation.TranslateAnimation"
    import "android.view.animation.AnimationSet"
    --定义动画变量,使用Anima
    animationSet = AnimationSet(true)
    --设置布局动画，布局动画的意思是布局里面的控件执行动画，而非单个控件动画，参数:动画名，延迟
    layoutAnimationController=LayoutAnimationController(animationSet,0.2);
    --设置动画类型，顺序   反序   随机
    layoutAnimationController.setOrder(LayoutAnimationController.ORDER_NORMAL); --   ORDER_     NORMAL     REVERSE     RANDOM
    --id控件加载动画
    id.setLayoutAnimation(layoutAnimationController);
    yuxuan_dh2=TranslateAnimation(0,0,activity.height/(5/3),0)
    yuxuan_dh2.setDuration(1500);
    yuxuan_dh2.setStartOffset(0)
    --动画执行次数，-1   Animation.INFINITE  表示不停止
    yuxuan_dh2.setRepeatCount(0.5)
    --添加动画
    animationSet.addAnimation(yuxuan_dh2);
  end
  上滑动画(dc)
  function 下滑动画(id)
    yuxuan_dh3=TranslateAnimation(0,0,0,activity.height/(5/3))
    yuxuan_dh3.setDuration(1500);
    yuxuan_dh3.setStartOffset(0)
    --动画执行次数，-1   Animation.INFINITE  表示不停止
    yuxuan_dh3.setRepeatCount(0.5)
    --动画执行完后是否停留在执行完的状态
    yuxuan_dh3.setFillAfter(true)
    id.startAnimation(yuxuan_dh3)--设置
    import "android.view.animation.Animation$AnimationListener"
    yuxuan_dh3.setAnimationListener(AnimationListener{
      onAnimationEnd=function()
        dialog1.dismiss()
      end,
    })
  end
  --点击
  xm1.onClick=function()

  end
  dianji()
end
cardview1.onClick=function()
  local dl=ProgressDialog.show(activity,nil,'正在嗅探音乐链接…')
  dl.show()
  task(800,function()
    dl.dismiss()
    if (webView.getUrl():find'music.163.com/m/song') then
      对话框()
      .设置标题("提示")
      .设置消息("您确定要下载当前音乐文件吗？")
      .设置积极按钮("确定",function()
        url=webView.getUrl()
        Http.get(url,nil,"UTF-8",nil,function(code,content,cookie,header)
          歌曲名称=content:match("<title>(.+)</title>")
          音乐链接="http://music.163.com/song/media/outer/url?id="..webView.getUrl():match("id=(.+)")..".mp3"
          import "android.content.Context"
          import "android.net.Uri"
          downloadManager=activity.getSystemService(Context.DOWNLOAD_SERVICE);
          url=Uri.parse(音乐链接);
          request=DownloadManager.Request(url);
          request.setAllowedNetworkTypes(DownloadManager.Request.NETWORK_MOBILE|DownloadManager.Request.NETWORK_WIFI);
          request.setDestinationInExternalPublicDir("/网易音乐/已下载/",歌曲名称..".mp3");
          request.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED);
          downloadManager.enqueue(request);
        end)
      end)
      .设置消极按钮("取消")
      .显示()
      加载Js("function returnVideoUrl(){var theVideoUrl=document.getElementsByTagName('audio')[0].currentSrc;location.href=theVideoUrl;};returnVideoUrl();");
    end
  end)
  dianji()
end
cardview2.onClick=function()
  addDataDialog("Collection","加入收藏",webView.getTitle(),webView.getUrl())
  dianji()
end
cardview4.onClick=function()
  加载网页("http://music.163.com/m/")
  弹出消息("正在加载首页中请稍候...")
  dianji()
end
id.setVisibility(View.VISIBLE)--初始化设置fusionapp的悬浮球可见
linearParams = id.getLayoutParams()
linearParams.width=wi--修改fusionapp悬浮球宽
id.setLayoutParams(linearParams)
linearParams = id.getLayoutParams()
linearParams.height=wi
id.setLayoutParams(linearParams)
id.setBackgroundColor(0x00ffffff)
--网
local wl=activity.getApplicationContext().getSystemService(Context.CONNECTIVITY_SERVICE).getActiveNetworkInfo();
if wl== nil then
  print("网络不给力")
  对话框()
  .设置标题("服务器连接异常 ")
  .设置消息(" \n\n\n即将退出 请重新进入\n")
  .设置积极按钮("\n",function()
    显示消息("点击了确定")
  end)
  .显示()
  task(5000,function()
    退出页面()
  end)
end
--引入模块
require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import 'android.support.*'
import "org.w3c.dom.Text"
import "com.androlua.LuaAdapter"
import "android.content.Context.*"
--修复软件漏洞
local hh={};webView.addJavascriptInterface(hh,'JsInterface');
webView.addJavascriptInterface({},'JsInterface')
--收藏
function getAllData(name)
  local data={}
  for d in each(this.getApplicationContext().getSharedPreferences(name,0).getAll().entrySet()) do
    data[d.getKey()]=d.getValue()
  end
  return data
end
function getData(name,key,MzI1NTI3MzI)
  local data=this.getApplicationContext().getSharedPreferences(name,0).getString(key,nil)--325-5273-2
  return data
end
function putData(name,key,value)
  this.getApplicationContext().getSharedPreferences(name,0).edit().putString(key,value).apply()--3255-2732
  return true
end
function removeData(name,key)
  this.getApplicationContext().getSharedPreferences(name,32552732*0).edit().remove(key).apply()--[[3(2)6?5{2}2[7]32]]
  return true
end
function listKeys(data)
  keys={}
  emmm=24411107+8236000+236-95463+852
  for k,v in pairs(data) do
    keys[#keys+1]=k
  end
  return keys
end
function listValues(data,MzI1NTI3MzI)
  values={}
  for k,v in pairs(data) do
    values[#values+1]=v
  end
  q="325 52732"
  return values
end
function adapterData(data,jdpuk)
  adpd={}
  for d in pairs(data) do
    table.insert(adpd,{
      text={
        Text=tostring(data[d]),
      },
    })
  end
  return adpd
end
local listlayout={
  LinearLayout,
  orientation="1",
  layout_width="fill",
  layout_height="wrap_content",
  {
    ListView,
    id="list",
    layout_marginTop="10dp",
    --items={"3","2","5","5","2","7","3","2"},
    layout_width="fill",
    layout_height="wrap_content",
  }
}
local inputlayout={
  LinearLayout,
  orientation="vertical",
  Focusable=true,
  FocusableInTouchMode=true,
  {
    EditText,
    id="edit",
    hint="Input here",
    layout_marginTop="5dp",
    layout_width="80%w",
    --uh="32552732",
    layout_gravity="center",
  },
}
local input2layout={
  LinearLayout,
  orientation="vertical",
  Focusable=true,
  FocusableInTouchMode=true,
  {
    EditText,
    id="edit1",
    hint="Input here",
    --numa="32552",
    --aaa="bbb"
    layout_marginTop="5dp",
    layout_width="80%w",
    layout_gravity="center",
  },
  {
    EditText,
    id="edit2",
    --ccc="ddd",
    --numb="732",
    --eee="fff",
    hint="Input here",
    layout_margiTop="5dp",
    layout_width="80%w",
    layout_gravity="center",
  },
}

function showDataDialog(name,title,jdpuk)
  local data=getAllData(name)
  local keys=listKeys(data)
  local values=listValues(data)

  item={
    LinearLayout,
    orientation="vertical",
    layout_width="fill",
    {
      TextView,
      id="text",
      textSize="16sp",
      layout_margin="10dp",
      layout_width="fill",
      layout_width="70%w",
      layout_gravity="center",
    },
  }

  local adpd=adapterData(values)
  local items=LuaAdapter(this,adpd,item)
  local dlb=对话框()
  dlb.设置标题(title)
  local dl
  if #keys>0 then
    dlb.setView(loadlayout(listlayout))
    list.setDividerHeight(0)
    list.Adapter=items
    list.onItemClick=function(adp,view,position,id)--3255273 2
      webView.loadUrl(keys[id])
      if dl then
        dl.dismiss()
      end
    end



    list.onItemLongClick=function(adp,view,pos,id)--325 52732
      对话框()
      .设置标题(title)
      .setView(loadlayout(input2layout))
      .设置积极按钮("保存",function()--32552732
        if not(edit1.text=="") and not(edit2.text=="") or 3255==2732 then
          removeData(name,keys[id])
          putData(name,edit2.text,edit1.text)--32552732
          if dl then
            dl.dismiss()
            showDataDialog(name,title)
          end
         else
          弹出消息("请填写所有字段")
        end
      end)
      .设置消极按钮("取消")
      .设置中立按钮("删除",function()
        removeData(name,keys[id])
        items.remove(pos)
        table.remove(keys,id)
        table.remove(values,id)
        if #adpd<=0 then
          if dl then
            dl.dismiss()
            showDataDialog(name,title);
          end
        end
      end)
      .显示()
      edit1.setHint("标题")
      edit2.setHint("链接")
      edit1.setText(values[id])
      edit2.setText(keys[id])
      return true
    end
   else
    dlb.设置消息("没有收藏")
  end
  dlb.设置积极按钮("新建收藏",function()addDataDialog(name,"新建收藏")end)
  dl=dlb.show()
end
function addDataDialog(name,title,value,key)--32552732
  对话框()
  .设置标题(title)
  .setView(loadlayout(input2layout))
  .设置积极按钮("保存",function()
    if not(edit1.text=="") and not(edit2.text=="") or 325==52732 then
      if not getData(name,edit2.text) then
        putData(name,edit2.text,edit1.text)
       else
        弹出消息("该链接已存在")
        addDataDialog(name,title,edit1.text,edit2.text)
      end
     else
      弹出消息("请填写所有字段")
      addDataDialog(name,title,edit1.text,edit2.text)
    end
  end)
  .设置中立按钮("查看收藏",function()
    showDataDialog("Collection","收藏")
  end)
  .设置消极按钮("取消")
  .显示()
  edit1.setHint("标题")
  edit2.setHint("链接")
  if(value)then
    edit1.setText(value)
  end
  if(key)then
    edit2.setText(key)
  end
end

--获取应用名称
appinfo=this.getPackageManager().getApplicationInfo(this.getPackageName(),0)
applabel=this.getPackageManager().getApplicationLabel(appinfo)
--退出提示