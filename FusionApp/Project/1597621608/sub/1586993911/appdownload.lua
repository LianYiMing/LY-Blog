--程序启动时会执行的事件
function xdc(url,path)
  require "import"
  import "java.net.URL"
  local ur =URL(url)
  import "java.io.File"
  file =File(path);
  local con = ur.openConnection();
  local co = con.getContentLength();
  local is = con.getInputStream();
  local bs = byte[1024]
  local len,read=0,0
  import "java.io.FileOutputStream"
  local wj= FileOutputStream(path);
  len = is.read(bs)
  while len~=-1 do
    wj.write(bs, 0, len);
    read=read+len
    pcall(call,"ding",read,co)
    len = is.read(bs)
  end
  wj.close();
  is.close();
  pcall(call,"dstop",co)
end
function appDownload(url,path)
  thread(xdc,url,path)
end

function 软件内下载(title,url,path,colour)
  local ts=true
  appDownload(url,path)
  local 布局={
    LinearLayout,
    id="appdownbg",
    layout_width="fill",
    layout_height="fill",
    orientation="vertical",
    {
      TextView,
      id="appdownsong",
      text=title,
      --  typeface=Typeface.DEFAULT_BOLD,
      layout_margin="15dp",
      textColor="#ff000000",
      textSize="20sp",
    },
    {
      TextView,
      id="appdowninfo",
      text="已下载：0MB/0MB\n下载状态：准备下载",
      --id="显示信息",
      --  typeface=Typeface.MONOSPACE,
      layout_marginRight="15dp",
      layout_marginLeft="15dp",
      layout_marginBottom="15dp",
      textSize="15sp",
    },
    {
      ProgressBar,
      id="进度条",
      style="?android:attr/progressBarStyleHorizontal",
      layout_width="fill",
      progress=0,
      layout_marginRight="15dp",
      layout_marginLeft="15dp",
      layout_marginBottom="15dp",
    },

  }
  local dldown=AlertDialog.Builder(activity)
  .setView(loadlayout(布局))
  
  
 --将dl.show赋值
 local dialogk=dldown.show()
--在某按钮点击后关闭这个对话框

-- .show()
  .setCancelable(false)

  function ding(a,b)--已下载，总大小(byte)
   appdowninfo.Text="已下载:"..string.format("%0.2f",a/1024/1024).."MB/".."总大小:"..string.format("%0.2f",b/1024/1024).."MB".."\n安装包正在下载中…"
   
    进度条.progress=(a/b*100)
  end

  function dstop(c)--总长度
    if ts then
      appdowninfo.Text="下载完成，总大小:"..string.format("%0.2f",c/1024/1024).."MB"
      --后台下载.setText("关闭")
      print("下载完成")
import "android.content.Intent"
import "android.net.Uri"
intent = Intent(Intent.ACTION_VIEW)



function OpenFile(path)
  import "android.webkit.MimeTypeMap"
  import "android.content.Intent"
  import "android.net.Uri"
  import "java.io.File"
  FileName=tostring(File(path).Name)
  ExtensionName=FileName:match("%.(.+)")
  Mime=MimeTypeMap.getSingleton().getMimeTypeFromExtension(ExtensionName)
  if Mime then 
    intent = Intent(); 
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK); 
    intent.setAction(Intent.ACTION_VIEW); 
    intent.setDataAndType(Uri.fromFile(File(path)), Mime); 
    activity.startActivity(intent);
  else
    print("找不到可以用来打开此文件的程序")
  end
end


OpenFile(路径..wjmc.."."..lx)
     dialogk.dismiss()
      luajava.clear(ts)
    
      
end
  end 
  end
  
 
  
