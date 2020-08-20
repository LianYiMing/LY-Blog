
buleng={
  LinearLayout,--线性布局
  orientation='vertical',--方向
  layout_width='fill',--宽度
  layout_height='fill',--高度
  background='#ff3f2a79',--背景颜色或图片路径
  {
    LinearLayout,--线性布局
    orientation='vertical',--方向
    layout_width='fill',--宽度
    layout_height='500',--高"
    background="#ff442d85";
    {
      CardView;--卡片控件
      layout_gravity='center';--重力
      --左:left 右:right 中:center 顶:top 底:bottom
      elevation='8dp';--阴影
      layout_width='fill';--宽度
      layout_height='200dp';--高
      -- CardBackgroundColor='0xff442d85';--颜色
      background='picture/indexbj.png';
      --radius='15dp';--圆角
      {
        LinearLayout,--线性布局
        --orientation='vertical',--方向
        layout_width='fill',--宽度
        layout_marginTop='40dp';--顶距
        layout_height='50dp',--高度
        Gravity='center';--重力属性
        --左:left 右:right 中:center 顶:top 底:bottom
        --background='#FfFFFFFF',--背景颜色或图片路径
        {
          TextView;--文本控件
          layout_gravity='left|center';
          layout_width='50%w';--宽度
          --layout_height='30dp';--高度
          textColor='#ffffffff';--文字颜色
          text='Good Evening';--显示文字
          textSize='18sp';--文字大小
        };
        {
          ImageView;--图片控件
          src='picture/Home.png';--图片路径
          layout_gravity='right|center';--卡片重力
          layout_width='25dp';--宽度
          layout_marginLeft='50dp';--左距
          layout_marginRight='10dp';--右距
          layout_height='25dp';--高度
          scaleType='fitXY';--图片显示类型
        };
        {
          TextView;--文本控件
          gravity='right';
          layout_width='wrap';--宽度
          textColor='#ffffffff';--文字颜色
          text='Function';--显示文字
          textSize='18sp';--文字大小
        };
      }; 
      {
        LinearLayout,--线性布局
        layout_gravity='bottom';
        layout_width='fill',--宽度
        layout_height='120dp',--高度
        -- background='#FFFFFFFF',--背景颜色或图片路径
        {
          LinearLayout,--线性布局
          orientation='vertical',--方向
          layout_gravity='left';--卡片重力
          Gravity='center';--重力属性
          layout_width='30%w',--宽度
          layout_height='fill',--高度
          {
            ImageView;--图片控件
            src='picture/account_remove_96x96.png';--图片路径
            layout_width='50dp';--宽度
            layout_height='50dp';--高度
            scaleType='fitXY';--图片显示类型
            onClick=function()
              进入子页面("movie")
--在这里填写控件单击事件
end;



            style='?android:attr/buttonBarButtonStyle';--安卓5.0以上控件点击水波纹效
          };
        };
        {
          CardView;--卡片控件
          layout_gravity='center';--重力
          --左:left 右:right 中:center 顶:top 底:bottom
          elevation='0';--阴影
          layout_width='40%w';--宽度
          layout_height='fill';--高度
          CardBackgroundColor='0';--颜色
          radius='0';--圆角
          {
            CircleImageView;--圆形图片
            layout_gravity='center';--卡片重力
            --左:left 右:right 中:center 顶:top 底:bottom
            layout_width='60dp';--宽度
            layout_height='60dp';--高度
            src='picture/tx.jpeg';--图片路径
          };
        };
        {
          LinearLayout,--线性布局
          orientation='vertical',--方向
          layout_width='30%w',--宽度
          layout_gravity='right';--卡片重力
          Gravity='center';--重力属性
          layout_height='fill',--高度
          {
            ImageView;--图片控件
            src='picture/dots_vertical_96x96.png';--图片路径
            layout_width='50dp';--宽度
            layout_height='50dp';--高度
            scaleType='fitXY';--图片显示类型
            style='?android:attr/buttonBarButtonStyle';--安卓5.0以上控件点击水波纹效果
            id="ab"
          };
        };
      };
    };
  };
  {
    ScrollView,--纵向滑动
    layout_width='fill';--宽度
    layout_height='fill';--高度
    VerticalScrollBarEnabled=false;--隐藏纵向滑条
    {
      LinearLayout,--线性布局
      orientation='vertical',--方向
      layout_width='fill',--宽度
      layout_height='fill',--高度
      background='#00FFFFFF',--背景颜色或图片路径
      {
        LinearLayout,--线性布局
        orientation='vertical',--方向
        layout_width='fill',--宽度
        layout_height='110dp',--高度
        background='#ff3f2a79',--背景颜色或图片路径
        {
          CardView;--卡片控件
          layout_gravity='top';--重力
          --左:left 右:right 中:center 顶:top 底:bottom
          elevation='0';--阴影
          layout_width='fill';--宽度
          layout_height='110dp';--高度
          CardBackgroundColor='0';--颜色
          radius='0';--圆角
          {
            TextView;--文本控件
            layout_gravity='left|top';--重力
            layout_marginLeft='5%w';--左距
            layout_marginTop='20dp';--顶距
            textColor='#ffffffff';--文字颜色
            text='New Annoucement';--显示文字
            textSize='20sp';--文字大小
          };
          {
            CardView;--卡片控件
            layout_gravity='bottom';--重力
            --左:left 右:right 中:center 顶:top 底:bottom
            elevation='0';--阴影
            layout_marginBottom='20dp';--底距
            layout_marginLeft='5%w';--左距
            layout_width='160dp';--宽度
            layout_height='30dp';--高度
            CardBackgroundColor='0xfff5f5f5';--颜色
            radius='15dp';--圆角
            {
              ImageView;--图片控件
              src='picture/gg.png';--图片路径
              layout_gravity='left|center';--卡片重力
              --左:left 右:right 中:center 顶:top 底:bottom
              layout_marginLeft='10dp';--左距
              layout_width='32dp';--宽度
              layout_height='32dp';--高度
              scaleType='fitXY';--图片显示类型
              style='?android:attr/buttonBarButtonStyle';--安卓5.0以上控件点击水波纹效果
            };
            {
              TextView;--文本控件
              layout_gravity='left|center';--重力
              --左:left 右:right 中:center 顶:top 底:bottom
              layout_marginLeft='35dp';--左距
              layout_width='fill';--宽度
              textColor='#ff404040';--文字颜色
              text='正在获取最新公告中…';--显示文字
              textSize='13sp';--文字大小
            };
          };
        };
      };
      {
        LinearLayout,--线性布局
        orientation='vertical',--方向
        layout_width='fill',--宽度
        layout_height='260dp',--高度
        background='#ff3f2a79',--背景颜色或图片路径
        {
          CardView;--卡片控件
          layout_gravity='top';--重力
          --左:left 右:right 中:center 顶:top 底:bottom
          elevation='0';--阴影
          layout_width='fill';--宽度
          layout_height='40dp';--高度
          CardBackgroundColor='0';--颜色
          radius='0';--圆角
          {
            TextView;--文本控件
            layout_gravity='left|top';--重力
            layout_marginLeft='5%w';--左距
            layout_marginTop='10dp';--顶距
            textColor='#ffffffff';--文字颜色
            text='Function';--显示文字
            textSize='20sp';--文字大小
          };
        };
        {
          LinearLayout,--线性布局
          layout_width='fill',--宽度
          layout_height='fill',--高度
          {
            LinearLayout,--线性布局
            orientation='vertical',--方向
            layout_gravity='left';--卡片重力
            --左:left 右:right 中:center 顶:top 底:bottom
            layout_width='50%w',--宽度
            layout_height='fill',--高度
            background='#ff3f2a79',--背景颜色或图片路径
            {
              CardView;--卡片控件
              layout_gravity='center';--重力
              --左:left 右:right 中:center 顶:top 底:bottom
              elevation='0';--阴影
              layout_width='fill';--宽度
              layout_margin='10dp';--边距
              layout_marginTop='20dp';--顶距
              layout_height='80dp';--高度
              CardBackgroundColor='0xffec407a';--颜色
              radius='5dp';--圆角
              {
                ImageView;--图片控件
                src='picture/google_earth_96x96.png';--图片路径
                layout_width='50dp';--宽度
                layout_height='45dp';--高度
                layout_gravity='right|top';--卡片重力
                layout_margin='10dp';--边距
                --左:left 右:right 中:center 顶:top 底:bottom
                scaleType='fitXY';--图片显示类型
                style='?android:attr/buttonBarButtonStyle';--安卓5.0以上控件点击水波纹效果
              };
              {
                TextView;--文本控件
                layout_gravity='left|bottom';--重力
                layout_margin='10dp';--边距
                textColor='#ffffffff';--文字颜色
                text='Small Tools';--显示文字
                textSize='14sp';--文字
                id="tool"
                
              };
            };
            {
              CardView;--卡片控件
              layout_gravity='center';--重力
              --左:left 右:right 中:center 顶:top 底:bottom
              elevation='0';--阴影
              layout_width='fill';--宽度
              layout_margin='10dp';--边距
              layout_height='80dp';--高度
              CardBackgroundColor='0xff00796a';--颜色
              radius='5dp';--圆角
              {
                ImageView;--图片控件
                src='picture/google_earth_96x96.png';--图片路径
                layout_width='50dp';--宽度
                layout_height='45dp';--高度
                layout_gravity='right|top';--卡片重力
                layout_margin='10dp';--边距
                --左:left 右:right 中:center 顶:top 底:bottom
                scaleType='fitXY';--图片显示类型
                style='?android:attr/buttonBarButtonStyle';--安卓5.0以上控件点击水波纹效果
              };
              {
                TextView;--文本控件
                layout_gravity='left|bottom';--重力
                layout_margin='10dp';--边距
                textColor='#ffffffff';--文字颜色
                text='';--显示文字
                textSize='14sp';--文字
              };
            };
          };
          {
            LinearLayout,--线性布局
            orientation='vertical',--方向
            layout_gravity='right';--卡片重力
            --左:left 右:right 中:center 顶:top 底:bottom
            layout_width='50%w',--宽度
            layout_height='fill',--高度
            background='#ff3f2a79',--背景颜色或图片路径
            {
              CardView;--卡片控件
              layout_gravity='center';--重力
              --左:left 右:right 中:center 顶:top 底:bottom
              elevation='0';--阴影
              layout_width='fill';--宽度
              layout_margin='10dp';--边距
              layout_marginTop='20dp';--顶距
              layout_height='80dp';--高度
              CardBackgroundColor='0xff7c4dff';--颜色
              radius='5dp';--圆角
              {
                ImageView;--图片控件
                src='picture/google_earth_96x96.png';--图片路径
                layout_width='50dp';--宽度
                layout_height='45dp';--高度
                layout_gravity='right|top';--卡片重力
                layout_margin='10dp';--边距
                --左:left 右:right 中:center 顶:top 底:bottom
                scaleType='fitXY';--图片显示类型
                style='?android:attr/buttonBarButtonStyle';--安卓5.0以上控件点击水波纹效果
              };
              {
                TextView;--文本控件
                layout_gravity='left|bottom';--重力
                layout_margin='10dp';--边距
                textColor='#ffffffff';--文字颜色
                text='情侣树';--显示文字
                textSize='14sp';--文字
              };
            };
            {
              CardView;--卡片控件
              layout_gravity='center';--重力
              --左:left 右:right 中:center 顶:top 底:bottom
              elevation='0';--阴影
              layout_width='fill';--宽度
              layout_margin='10dp';--边距
              layout_height='80dp';--高度
              CardBackgroundColor='0xffd32f2e';--颜色
              radius='5dp';--圆角
              {
                ImageView;--图片控件
                src='picture/google_earth_96x96.png';--图片路径
                layout_width='50dp';--宽度
                layout_height='45dp';--高度
                layout_gravity='right|top';--卡片重力
                layout_margin='10dp';--边距
                --左:left 右:right 中:center 顶:top 底:bottom
                scaleType='fitXY';--图片显示类型
                style='?android:attr/buttonBarButtonStyle';--安卓5.0以上控件点击水波纹效果
              };
              {
                TextView;--文本控件
                layout_gravity='left|bottom';--重力
                layout_margin='10dp';--边距
                textColor='#ffffffff';--文字颜色
                text='情侣小屋';--显示文字
                textSize='14sp';--文字
              };
            };
          };
        };
      };
      {
        LinearLayout,--线性布局
        orientation='vertical',--方向
        layout_width='fill',--宽度
        layout_height='200dp',--高度
        background='#ff3f2a79',--背景颜色或图片路径

        {
          CardView;--卡片控件
          layout_gravity='top';--重力
          --左:left 右:right 中:center 顶:top 底:bottom
          elevation='0';--阴影
          layout_width='fill';--宽度
          layout_height='60dp';--高度
          CardBackgroundColor='0';--颜色
          radius='0';--圆角
          {
            TextView;--文本控件
            layout_gravity='left|top';--重力
            layout_marginLeft='5%w';--左距
            layout_marginTop='10dp';--顶距
            textColor='#ffffffff';--文字颜色
            text='Music';--显示文字
            textSize='20sp';--文字大小
          };

        };
        {
          LinearLayout,--线性布局
          orientation='vertical',--方向
          layout_width='fill',--宽度
          layout_height='130dp',--高度
          --background='#ffFFFFFF',--背景颜色或图片路径
          Gravity='center';--重力属性
          --左:left 右:right 中:center 顶:top 底:bottom
          {
            CardView;--卡片控件
            layout_gravity='center';--重力
            --左:left 右:right 中:center 顶:top 底:bottom
            elevation='5dp';--阴影
            layout_width='80%w';--宽度
            layout_height='60dp';--高度
            CardBackgroundColor='0xddffffff';--颜色
            radius='10dp';--圆角
            {
              TextView;--文本控件
              layout_gravity='left|center';--重力
              --左:left 右:right 中:center 顶:top 底:bottom
              layout_marginLeft='15dp';--右距
              textColor='#ff000000';--文字颜色
              text='走马';--显示文字
              textSize='14sp';
            };
            {
              CircleImageView;--圆形图片
              layout_gravity='right|center';--卡片重力
              layout_marginRight='15dp';--右距
              --左:left 右:right 中:center 顶:top 底:bottom
              layout_width='50dp';--宽度
              layout_height='50dp';--高度
              src='picture/tx.jpeg';--图片路径
            };
          };
        };
      };
    };
  };
};
activity.setContentView(loadlayout(buleng))
onClick=function()
--在这里填写控件单击事件
end;

--布局外填写:(去掉注释)
ab.onClick=function()
  进入子页面("about")
--在这里填写控件单击事件  
end
tool.onClick=function()
   进入子页面("在线工具")
--在这里填写控件单击事件  
end























