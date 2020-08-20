import "glob"

function base_info(pack)
return {--应用名称
 app_nm=pm.getPackageInfo(pack.packageName,64).applicationInfo.loadLabel(pm),
--应用包名
 app_pn=pack.packageName,
--安装包路径
 app_pt=pm.getApplicationInfo(pack.packageName,64).sourceDir,
--版本号
 app_vc=pack.versionCode,
--内部版本号
 app_vn=pack.versionName,
--应用图标
 app_ic=pack.applicationInfo.loadIcon(pm)}
end

--用于适配器的布局
list_lay={
RelativeLayout,
layout_height="wrap",
gravity="center",
layout_width="fill",
{
LinearLayout,
orientation="horizontal",
layout_width="fill",
{
ImageView,
id="app_ic",
layout_height="20%w",
layout_width="20%w",
adjustViewBounds=true,
padding="3.5%w",
},
{
LinearLayout,
orientation="vertical",
layout_gravity="center|left",
{
TextView,
textSize="16sp",
textColor=0xff444444,
id="app_nm",
padding="2%w",
paddingLeft=0,
paddingRight="3.5%w",
},
{
TextView,
textSize="14sp",
paddingBottom="2%w",
paddingRight="3.5%w",
id="app_pn",
},
{
TextView,
textSize="14sp",
paddingBottom="2%w",
visibility=8,
paddingRight="3.5%w",
id="app_pt",
},
{
TextView,
textSize="14sp",
paddingBottom="2%w",
paddingRight="3.5%w",
id="app_vn",
},
{
TextView,
textSize="14sp",
paddingBottom="2%w",
paddingRight="3.5%w",
visibility=8,
id="app_vc",
},
},
},
}

filter_data={"用户应用","系统应用","已冻结"}
filter_adp=LuaAdapter(activity,{},{TextView, textColor=0xff444444, gravity="center", padding="3.5%w", id="b"})
for i=1,#filter_data do
  filter_adp.add{b=filter_data[i]}
end

function checkApps(filter)
refresh.setRefreshing(true)
--获取所有应用
all_packages=pm.getInstalledPackages(0)
app_count.text="总共 "..#all_packages.." 个应用"
app_adp={}
if list_adp then
list_adp.clear()
end
list_adp=LuaAdapter(activity,app_adp,list_lay)
--索引从0开始，将所有应用的基本信息添加在适配器
if filter then
app_count.setVisibility(8)
find_count.setVisibility(0)
end
if filter=="fam.filter.app.isfrozen" then
for l=0,#all_packages-1 do
pack=all_packages.get(l)
if tonumber(pm.getApplicationEnabledSetting(pack.packageName))==pm.COMPONENT_ENABLED_STATE_DISABLED then
list_adp.add(base_info(pack))
end
end
elseif filter then
for l=0,#all_packages-1 do
pack=all_packages.get(l)
if pm.getPackageInfo(pack.packageName,64).applicationInfo.loadLabel(pm):find(filter) or pack.packageName:find(filter) then
list_adp.add(base_info(pack))
end
end
--没有权限
--[[pm.getPackageSizeInfo(pack.packageName,{
onGetStatsCompleted=function(pStats,isSuccess)
print ("缓存大小="..Formatter.formatFileSize(this, pStats.cacheSize).."\n数据大小="..Formatter.formatFileSize(this, pStats.dataSize).."\n程序大小=".. Formatter.formatFileSize(this, pStats.codeSize))
end})]]
else
app_count.setVisibility(0)
find_count.setVisibility(8)
for l=0,#all_packages-1 do
pack=all_packages.get(l)
list_adp.add(base_info(pack))
end
end
app_ls.setAdapter(list_adp)
if list_adp.getCount()>0 then
if filter=="fam.filter.app.isfrozen" then
find_count.text="总共 "..list_adp.getCount().." 个已冻结应用"
else
find_count.text="找到 "..list_adp.getCount().." 个应用"
end
else
if filter=="fam.filter.app.isfrozen" then
find_count.text="没有已冻结的应用"
else
find_count.text="没有找到要搜索的应用"
end
end
--设置下拉刷新的状态
refresh.setRefreshing(false)
end

this.setContentView(loadlayout ({
RelativeLayout,
{
LinearLayout,
orientation="vertical",
{
    RelativeLayout,
    layout_height="21.75%w",
    layout_width="fill",
    id="topBar",
    elevation="1%w",
    paddingTop=状态栏高度,
    backgroundColor=0xfffafafa,
    {
      TextView,
      id="title",
      text="应用列表",
      paddingRight="13%w",
      paddingLeft="3.5%w",
      layout_alignParentLeft=true;
      gravity="left|center",
      singleLine=true,
      ellipsize="end",
      textSize="18sp",
      layout_height="fill",
      layout_width="fill",
      textColor=0xff444444,
    },
{
LinearLayout,
layout_alignParentRight=true;
    {
      ImageView,
      src="magnify.png",
      onClick=function ()
        searchBar.Parent.setVisibility(0)
        base_filter.setVisibility(0)
        圆形扩散(searchBar.Parent,w,0,0,h,350)
 --弹出输入法
imm.toggleSoftInput(0,InputMethodManager.RESULT_SHOWN)
--取得edittext焦点
searchBar.getChildAt(0).requestFocus()
      end,
      foreground=波纹(0xcb5B5B5B),
      layout_height="fill",
      layout_width="13%w",
      padding="3.5%w",
    },
 {
      ImageView,
      src="info.png",
      onClick=function ()
  this.newActivity("sysinfo")
      end,
      foreground=波纹(0xcb5B5B5B),
      layout_height="fill",
      layout_width="13%w",
      padding="3.5%w",
    },
},
  },
  {
TextView,
id="app_count",
layout_width="fill",
textSize="14sp",
padding="2%w",
paddingLeft="3.5%w",
},
{
TextView,
id="find_count",
layout_width="fill",
textSize="14sp",
padding="2%w",
paddingLeft="3.5%w",
},
{
SwipeRefreshLayout,
id="refresh",
OnRefreshListener={
  onRefresh=function()
    checkApps(filter)
  end},
DistanceToTriggerSync=w*0.2175+状态栏高度,
--设置颜色
--ColorSchemeColors={0xff000000},
{
ListView,
id="app_ls",
layout_width="fill",
fastScrollEnabled=true,
VerticalScrollBarEnabled=false,
dividerHeight=1,
onItemClick=function(parent, view, position, id)
this.newActivity("info",{view.getChildAt(0).getChildAt(1).getChildAt(1).text})
end,
onItemLongClickListener={
onItemLongClick=function(parent, view, position, id)
print(view.getChildAt(0).getChildAt(1).getChildAt(0).text.."\n"..view.getChildAt(0).getChildAt(1).getChildAt(1).text)
return true
end},
},
},
},
{
LinearLayout,
visibility=8,
layout_height="fill",
orientation="vertical",
{
    RelativeLayout,
layout_height="21.75%w",
    layout_width="fill",
    id="searchBar",
    paddingTop=状态栏高度,
    backgroundColor=0xfffafafa,
    {
      EditText,
      id="search_edit",
      hint="搜索应用名称",
      imeOptions="actionSearch",
      paddingRight="26%w",
      paddingLeft="3.5%w",
      layout_alignParentLeft=true,
      gravity="left|center",
      singleLine=true,
      backgroundColor=0,
      textSize="18sp",
      layout_height="fill",
      layout_width="fill",
      textColor=0xff444444,
    },
{
LinearLayout,
orientation="horizontal",
layout_alignParentRight=true;
    {
      ImageView,
      src="magnify.png",
      onClick=function ()
      if #search_edit.text<1 then
        print("未输入关键词")
        base_filter.setVisibility(0)
      else
      base_filter.setVisibility(8)
        checkApps(search_edit.text)
      end
      end,
      foreground=波纹(0xcb5B5B5B),
      layout_height="fill",
      layout_width="13%w",
      id="search_mag",
      visibility=8,
      padding="3.5%w",
    },
  {
      ImageView,
      src="close.png",
      onClick=function ()
      圆形扩散(searchBar.Parent,w,0,h,0,350)
      task(300, function ()
      searchBar.Parent.setVisibility(8)
      end)
        --透明动画(searchBar.Parent,350,1,0)
if filter~=nil then
search_edit.text=""
checkApps()
end
--隐藏输入法，同时会清除edittext焦点
imm.hideSoftInputFromWindow(searchBar.getChildAt(0).getWindowToken(), 0)
      end,
      foreground=波纹(0xcb5B5B5B),
      layout_height="fill",
      layout_width="13%w",
      padding="3.5%w",
    },
},
  },
{
LinearLayout,
backgroundColor=0xaefafafa,
orientation="vertical",
id="base_filter",
layout_height="fill",
onClick=function ()
end,
layout_width="fill",
{
TextView,
text="分类查看",
textSize="16sp",
layout_gravity="center",
padding="5%w",
},
{
    GridView;
    numColumns=3;
    gravity="center",
    onItemClick=function(parent, view, position, id)
if position==0 then

elseif position==1 then

elseif position==2 then
filter="fam.filter.app.isfrozen"
checkApps(filter)
end
base_filter.setVisibility(8)
end,
    Adapter=filter_adp,
    paddingLeft="5%w",
    paddingRight="5%w",
  },
},
},
}))

checkApps()

search_edit.addTextChangedListener({
 onTextChanged=function() 
 if #search_edit.text<1 then
 filter=nil
 checkApps()
 base_filter.setVisibility(0)
-- search_mag.setVisibility(8)
 else
 filter=search_edit.text
 checkApps(filter)
 --search_mag.setVisibility(0)
 base_filter.setVisibility(8)
end
end})

search_edit.setOnEditorActionListener{
onEditorAction=function(view,int,KeyEvent)
checkApps(filter)
return true
end}

function onKeyDown(k)
if k==4 and searchBar.Parent.getVisibility()~=8 then
圆形扩散(searchBar.Parent,w,0,h,0,350)
      task(300, function ()
      searchBar.Parent.setVisibility(8)
      end)
imm.hideSoftInputFromWindow(searchBar.getChildAt(0).getWindowToken(), 0)
if filter~=nil then
search_edit.text=""
 checkApps()
 end
return true 
end
end
