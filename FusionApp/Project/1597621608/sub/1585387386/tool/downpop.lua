popWindowLayout = {
  LinearLayout;
  orientation="vertical";
  layout_width="match";
  layout_height="wrap";
  {
    CardView;
    layout_width="match";
    layout_height="wrap";
    layout_margin="20dp";
	elevation="15dp";
	radius="10dp";
    padding="3dp";
      {
         ListView;
         id="down_list";
         layout_width="match";
         layout_height="wrap";
      };
  };
  {
     CardView;
     id="pop_cancel";
     layout_width="match";
     layout_height="wrap";
     layout_margin="20dp";
     layout_marginTop="25dp";
	 elevation="15dp";
 	 radius="10dp";
     padding="3dp";
        {
          TextView;
	       layout_width="match";
	       layout_height="wrap";
	       layout_margin="15dp";
	       gravity="center";
           textSize="15sp";
           textColor=0xff9385FB;
           text="取消";
         }
    };
};

downSingleTextItem={
  LinearLayout;
  layout_width="match";
  layout_height="wrap";
  orientation="horizontal";
 	{
	    TextView;
	    id="name";
	    layout_width="match";
	    layout_height="wrap";
	    layout_margin="15dp";
	    gravity="center";
        textSize="15sp";
        textColor=0xff9385FB;
	 };
}


downData = {}
table.insert(downData,{name="ADM下载(推荐)"})
table.insert(downData,{name="本地下载"})
table.insert(downData,{name="复制链接"})

import"tool.checkpackage"

function downPop(url,fileName,filDir)
  if(pop == nil) then
    mPopView = loadlayout(popWindowLayout)
    down_list_adapter = LuaAdapter(activity,downData,downSingleTextItem)
    down_list.setAdapter(down_list_adapter)
    
    pop =  PopupWindow(mPopView,
                  LinearLayout.LayoutParams.MATCH_PARENT,
                  LinearLayout.LayoutParams.WRAP_CONTENT)
                  
    --不知道fa 怎么搞的，点外部 pop关不了
    pop.setBackgroundDrawable(ColorDrawable)
    pop.setOutsideTouchable(true)
    
    pop_cancel.setOnClickListener(View.OnClickListener{
       onClick = function(view)
         downPop()
       end
    })
  
    import"android.text.format.Formatter"
	
	function adm(url)
      if isPackageInstalled("com.dv.adm.pay") then
        this.startActivity(Intent().setAction("android.intent.action.SEND").setType("text/*").putExtra("android.intent.extra.TEXT", url).setClassName("com.dv.adm.pay", "com.dv.adm.pay.AEditor"))
      elseif toast==nil then
          print("没有安装ADM")
        else
          toast.setText("没有安装ADM")
          toast.show()
      end
	end
	
	function localDownload(url,fileName)
      
	  downloadManager=activity.getSystemService(Context.DOWNLOAD_SERVICE);--调用系统下载器下载
	  url=Uri.parse(url);
	  request=DownloadManager.Request(url);
      request.setDestinationInExternalPublicDir(filDir,fileName)
	  request.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED)
	  downloadManager.enqueue(request)
      
	  
	end
  
    down_list.setOnItemClickListener(AdapterView.OnItemClickListener{
       onItemClick = function(parent,view,pos,id)
       if pos==0 then
	      adm(url)
	    elseif pos==1 then
	      localDownload(url,fileName)
	    elseif pos==2 then
	      复制文本(url)
	    end
         downPop()
	  end
	})

    pop.showAtLocation(mPopView, Gravity.BOTTOM, 0, 0)
  elseif pop.isShowing() then
    pop.dismiss()
    pop=nil
  end
end