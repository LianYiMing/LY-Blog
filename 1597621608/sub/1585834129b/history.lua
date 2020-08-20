

lstads="/data/data/"..activity.getPackageName().."/history.lua"
lstwebads="/data/data/"..activity.getPackageName().."/history.lua"
--2.序列化
function slz(obj) 
  local lua = "" 
  local t = type(obj) 
  if t == "number" then 
    lua = lua .. obj 
  elseif t == "boolean" then 
    lua = lua .. tostring(obj) 
  elseif t == "string" then 
    lua = lua .. string.format("%q", obj) 
  elseif t == "table" then 
    lua = lua .. "{\n" 
    for k, v in pairs(obj) do 
      lua = lua .. "[" .. slz(k) .. "]=" .. slz(v) .. ",\n" 
    end 
    local metatable = getmetatable(obj) 
    if metatable ~= nil and type(metatable.__index) == "table" then 
      for k, v in pairs(metatable.__index) do 
        lua = lua .. "[" .. slz(k) .. "]=" .. slz(v) .. ",\n" 
      end 
    end 
    lua = lua .. "}" 
  elseif t == "nil" then 
    return nil 
  else 
    error("can not serialize a " .. t .. " type.") 
  end 
  return lua 
end 
function rslz(lua) 
  local t = type(lua) 
  if t == "nil" or lua == "" then 
    return {}
  elseif t == "number" or t == "string" or t == "boolean" then 
    lua = tostring(lua) 
  else 
    error("can not unserialize a " .. t .. " type.") 
  end 
  lua = "return " .. lua 
  local func = loadstring(lua) 
  if func == nil then 
    return nil 
  end 
  return func() 
end

--3.历史记录框布局
function hstshow()
  hstlayout={
    LinearLayout,
    orientation="1",
    gravity="center",
    layout_width="wrap_content",
    layout_height="wrap_content",
    {
      TextView,
      text="",
      gravity="center",
      layout_width="wrap_content",
      textSize="0sp",
      background="#000000",
      layout_height="15dp",},
    {
      TextView,
      text="历史记录",
      gravity="center",
      layout_width="wrap_content",
      textSize="30sp",
      textStyle="bold",
      layout_height="50dp",},
    {
      ListView,
      id="ust",
      items=lst,
      layout_width="fill",
      layout_height="wrap_content",
    },
  }
end


--##功能函数##

--1.读取历史文件
function read_hst()
  import "java.io.File"
  File(lstads).createNewFile()
  slst=io.open(lstads):read("*a")
  File(lstwebads).createNewFile()
  slstweb=io.open(lstwebads):read("*a")
  --转换成table
  lst=rslz(slst)
  lstweb=rslz(slstweb)
end

--2.新网页加入历史记录
function add_hst()
  if string.len(webView.getTitle())<=300 then--粗略过掉无效标题
    newtitle=webView.getTitle()
    newurl=webView.getUrl()
    table.insert(lst,1,newtitle) --标题表添加新标题
    table.insert(lstweb,1,newurl) --网址表添加新网址
  end
end

--3.存储历史文件
function save_hst()
  --转换成string
  slst=slz(lst)
  slstweb=slz(lstweb)
  --保存
  file=io.open(lstads,"w+")
  io.output(file)
  io.write(slst)
  io.flush()
  io.close(file)
  file=io.open(lstwebads,"w+")
  io.output(file)
  io.write(slstweb)
  io.flush()
  io.close(file)
end

--4.显示历史记录框
function show_hst() 
  hstshow()
  local u=AlertDialog.Builder(activity)
  u.setView(loadlayout(hstlayout))
  u.setNeutralButton("清空",DialogInterface.OnClickListener{
    onClick=function()print("清理历史记录成功")
      执行Shell("rm -rf /data/data/"..activity.getPackageName().."/lshj.lua")
      执行Shell("rm -rf /data/data/"..activity.getPackageName().."/lsthj.lua")
      刷新网页()
    end})
  u.setNegativeButton("保留",DialogInterface.OnClickListener{
    onClick=function()
    end})
  u.create()
  u=u.show()
        setDialogButtonColor(u,0,0xFF468DFF)
      圆角(u.getWindow(),0xFFFAFAFA,{50,40,40,40,40,40,40,40})

  ust.onItemClick=function(l,v,c,b)
    加载网页(lstweb[b])
    u.dismiss()
  end
  ust.onItemLongClick=function(l,v,c,b)
    u.dismiss()
    local u=AlertDialog.Builder(this)
      --u.setCancelable(false)--强制对话框
      u.setTitle("")
      --      u.setView(loadlayout(输入对话框))--布局ID
      u.setMessage("是否删除记录?")
      u.setPositiveButton("确定",function()
         table.remove(lst,b)
      table.remove(lstweb,b)
      save_hst()
      show_hst()
   
      end)
      u.setNegativeButton("取消",function()
        
      end)
     u.setNeutralButton("",function()--中立按钮
 
      end)

      u=u.show()
      setDialogButtonColor(u,0,0xFF468DFF)
      圆角(u.getWindow(),0xFFFAFAFA,{50,40,40,40,40,40,40,40})


    return true
  end
end