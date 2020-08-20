--[[
小记事 project by Ayaka_Ago
]]

require "import"
import "global_string"

function isStared(c)
if c==true then
return "star.png"
else
return ""
end
end

function item_layout(note_list,c)
return {
              RelativeLayout,
              layout_width="fill",
              {
              CardView,
              elevation="0.5%w",
              radius="17dp",
              cardBackgroundColor=StrToTable(io.open(tostring(note_list[c])):read("*a"))["content"]["color"] or 0xffffffff,
              layout_margin="3.5%w",
              layout_width="fill",
              {
                LinearLayout,
                orientation="vertical",
                layout_width="fill",
                foreground=波纹(0xcb5B5B5B),
                padding="3.5%w",
                onClick=function ()
                  this.newActivity("edit",{tostring(note_list[c])})
                end,
  onLongClickListener={
onLongClick=function ()
local path=tostring(note_list[c])
local c=AlertDialog.Builder(this)
c.setTitle("选择操作")
c.setItems({"编辑","分享","删除"}, function (l,v)
if v==0 then
this.newActivity("edit",{path})
elseif v==1 then
shareText(StrToTable(io.open(path):read("*a"))["content"]["title"].."\n\n"..StrToTable(io.open(path):read("*a"))["content"]["messages"])
elseif v==2 then
local d=AlertDialog.Builder(this)
d.setTitle("要删除这条记事吗？")
d.setMessage("此操作无法撤销")
d.setPositiveButton("取消",nil)
d.setNegativeButton("删除", function ()
File(path).delete()
refreshList(keyword)
end)
local d=d.show()
setDialogButtonColor(d,0,按钮文字色)
圆角(d.getWindow(),0xfffafafa,{17,17,17,17,17,17,17,17})
end
end)
c.setPositiveButton("取消",nil)
local c=c.show()
setDialogButtonColor(c,0,按钮文字色)
圆角(c.getWindow(),0xfffafafa,{17,17,17,17,17,17,17,17})
return true
end},
               -- background=圆角(nil,0xfffafafa,{17,17,17,17,17,17,17,17}),
  {
  RelativeLayout,
             {
                  TextView,
                  textColor=0xff444444,
                  textSize="16sp",
                  singleLine=true,
                  paddingRight="7.5%w",
                  ellipsize="end",
                  text=getActuallyTitle(StrToTable(io.open(tostring(note_list[c])):read("*a"))["content"]["title"]),
                },
     {
     ImageView,
     layout_width="5%w",
     layout_alignParentRight=true,
     layout_height="5%w",
     colorFilter=主题色,
     src=isStared(StrToTable(io.open(tostring(note_list[c])):read("*a"))["content"]["star"]),
     },
 },
                {
                  TextView,
                  textSize="14sp",
                  maxLines=2,
                  ellipsize="end",
                  paddingTop="2%w",
                  text=getActuallyContent(string.gsub(string.gsub(StrToTable(io.open(tostring(note_list[c])):read("*a"))["content"]["messages"],":xjszkh:","["),":xjsykh:","]")),   
               -- text=StrToTable(io.open(tostring(note_list[c])):read("*a"))["content"]["messages"],
                },
  {
  RelativeLayout,
  paddingTop="3.5%w",
  paddingBottom=0,
                {
                  TextView,
                  textSize="14sp",
                  textColor=按钮文字色,
                  layout_alignParentRight=true,
                  text=StrToTable(io.open(tostring(note_list[c])):read("*a"))["date"]["update"]:match("(.+) "),
                },
    {
                  TextView,
                  textSize="14sp",
                  textColor=按钮文字色,
                  layout_alignParentLeft=true,
                  text=StrToTable(io.open(tostring(note_list[c])):read("*a"))["content"]["category"] or "记事",
                },
   },
              },
             },
            }
end

this.setContentView(loadlayout({
  RelativeLayout,
  {
    RelativeLayout,
    layout_height="21.75%w",
    layout_width="fill",
    id="topBar",
    onClick=function () end,
    backgroundColor=0,
    elevation="1%w",
    paddingTop=状态栏高度,
    {
      ImageView,
      src="pen.png",
      layout_alignParentLeft=true;
      layout_height="fill",
      layout_width="13%w",
      padding="3.5%w",
      id="icon",
      colorFilter=0xff000000,
    },
    {
      TextView,
      id="title",
      text="小记事",
      layout_toRightOf="icon",
      gravity="left|center",
      textSize="18sp",
      layout_height="fill",
      textColor=0xff444444,
    },
    {
      ImageView,
      id="none_ic",
      visibility=8,
    },
    {
    RelativeLayout,
    visibility=8,
    elevation="2%w",
    layout_width="fill",
    id="searchBar",
    backgroundColor=0xffffffff,
    {
    EditText,
    padding="3.5%w",
    hint="搜索关键词",
    layout_height="fill",
    paddingRight="26%w",
    backgroundColor=0,
    singleLine=true,
    layout_width="fill",
    },
 {
 ImageView,
 src="close.png",
 layout_alignParentRight=true,
 onClick=function ()
 searchBar.getChildAt(0).text=""
refreshList(keyword)
--task(300, function ()
searchBar.setVisibility(8)
--end)
透明动画(searchBar,350,1,0)
keyword=nil
--圆形扩散(searchBar,0,w,h,0,750)
imm.hideSoftInputFromWindow(searchBar.getChildAt(0).getWindowToken(), 0)
end,
foreground=波纹(0xcb5B5B5B),
padding="3.5%w",
 layout_height="fill",
 id="search_close",
 layout_width="13%w",
 },
{
 ImageView,
 src="magnify.png",
 layout_toLeftOf="search_close",
 onClick=function ()
if #searchBar.getChildAt(0).text>0 then
refreshList(searchBar.getChildAt(0).text)
else
print ("未输入关键词")
end
end,
foreground=波纹(0xcb5B5B5B),
padding="3.5%w",
 layout_height="fill",
 layout_width="13%w",
 },
    },
 {
ImageView,
src="magnify.png",
layout_width="13%w",
layout_height="fill",
colorFilter=0xff000000,
layout_alignParentRight=true,
--layout_toLeftOf="info",
padding="3.5%w",
id="search",
onClick=function ()
searchBar.setVisibility(0)
--透明动画(searchBar,350,0,1)
圆形扩散(searchBar,w,0,0,h,750)
imm.toggleSoftInput(0,InputMethodManager.RESULT_SHOWN)
searchBar.getChildAt(0).requestFocus()
end,
foreground=波纹(0xcb5B5B5B),
},
  },
{
SwipeRefreshLayout,
id="refresh",
OnRefreshListener={
  onRefresh=function()
    refreshList(keyword)
  end,
},
DistanceToTriggerSync=w*0.22+状态栏高度,
ColorSchemeColors={主题色},
  {
    ScrollView,
    layout_width="fill",
    id="content",
  {
  LinearLayout,
  layout_width="fill",
  orientation="vertical",
{
RelativeLayout,
id="topPic",
layout_width="fill",
layout_height="55%w",
{
ImageView,
src=piclist[math.random(1,24)],
scaleType="centerCrop",
foreground=上下渐变({0x88FAFAFA,0x88FAFAFA,0xFFFAFAFA}),
layout_width="fill",
},
  {
  LinearLayout,
  padding="8%w",
 -- paddingTop="21.75%w",
  layout_alignParentBottom=true,
  orientation="vertical",
{
  LinearLayout,
  orientation="vertical",
  id="hello",
{
TextView,
text="记录点滴，美好生活",
paddingTop="3.5%w",
textColor=0xff444444,
textSize="25sp",
},
{
TextView,
textSize="16sp",
paddingTop="3.5%w",
id="today",
text=os.date("%y.%m.%d"),
},
},
{
LinearLayout,
orientation="vertical",
id="note_notfound_msg",
gravity="center|left",
layout_width="fill",
visibility=8,
{
TextView,
text="未找到记事",
paddingTop="3.5%w",
textColor=0xff444444,
textSize="25sp",
},
{
TextView,
textSize="16sp",
paddingTop="3.5%w",
text="尝试其他关键词，英文区分大小写",
},
},
{
LinearLayout,
orientation="vertical",
gravity="center|left",
layout_width="fill",
id="no_note_msg",
{
TextView,
text="暂无记事",
paddingTop="3.5%w",
textColor=0xff444444,
textSize="25sp",
},
{
TextView,
textSize="16sp",
paddingTop="3.5%w",
text="点击 + 新建记事",
onClick=function ()
        newNote()
      end,
},
},
{
TextView,
text="加载列表时出错",
paddingTop="3.5%w",
id="error_msg",
textColor=0xff444444,
textSize="25sp",
},
 {
 TextView,
 textSize="25sp",
 id="resultcount_show",
 visibility=8,
 textColor=0xff444444,
 layout_width="fill",
 },
},
},
 },
 },
},
{
  LinearLayout,
  gravity="right|center",
  orientation="horizontal",
  background=上下渐变({0x88FAFAFA,0xFFFAFAFA,0xFFFAFAFA}),
  layout_alignParentBottom=true,
  layout_alignParentRight=true,
  layout_width="fill",
  padding="3.5%w",
    {
      ImageView,
      src="plus.png",
      layout_height=w*0.2175-状态栏高度,
      layout_width=w*0.2175-状态栏高度,
      onClick=function ()
        newNote()
      end,
      foreground=波纹(0xcb5B5B5B),
      padding="3.5%w",
    },
  },
}))

function refreshList(filter)
today.text=os.date("%y.%m.%d")
  local f,e=pcall(function ()
  no_note_msg.setVisibility(8)
  hello.setVisibility(8)
  error_msg.setVisibility(8)
  resultcount_show.setVisibility(8)
  filter_resultcount=0
  note_list=getFileList(记事文件)
  if content_list then
      content.getChildAt(0).removeView(content_list)
      content_list=nil
    end
    content.getChildAt(0).addView(loadlayout ({
      LinearLayout,
     -- paddingTop="21.75%w",
      layout_width="fill",
      id="content_list",
      paddingBottom=w*0.2,
      orientation="vertical",
    }))
    if getFileCount(记事文件)>0 then
      for c=1,#note_list do
        if filter then
        keyword=filter
          if StrToTable(io.open(tostring(note_list[c])):read("*a"))["content"]["category"]:find(filter) or StrToTable(io.open(tostring(note_list[c])):read("*a"))["content"]["title"]:find(filter) or StrToTable(io.open(tostring(note_list[c])):read("*a"))["content"]["messages"]:find(filter) then
          filter_resultcount=filter_resultcount+1
          resultcount_show.setVisibility(0)
          resultcount_show.text="找到 "..filter_resultcount.." 条记事"
            content_list.addView(loadlayout (item_layout(note_list,c)))
          end
          if filter_resultcount~=0 then
        note_notfound_msg.setVisibility(8)
        else
        note_notfound_msg.setVisibility(0)
        end
         else
         hello.setVisibility(0)
         no_note_msg.setVisibility(8)
         note_notfound_msg.setVisibility(8)
          content_list.addView(loadlayout (item_layout(note_list,c)))
        end
      end
     else
     hello.setVisibility(8)
     no_note_msg.setVisibility(0)
    end
  end)
  if e then
  hello.setVisibility(8)
         no_note_msg.setVisibility(8)
         note_notfound_msg.setVisibility(8)
     error_msg.setVisibility(0)
     refresh.setRefreshing(false)
     else
     error_msg.setVisibility(8)
    refresh.setRefreshing(false)
  end
end

function onResume()
--refreshList(keyword)
today.text=os.date("%y.%m.%d")
end

refreshList(keyword)

pos=0
content.onScrollChange=function (v,u,p)
pos=p
if p>=title.top then
if none_ic.getVisibility()~=0 then
none_ic.setVisibility(0)
transColor(topBar,"backgroundColor",{topBar.getBackground().getColor(),主题色},350)
transColor(icon,"ColorFilter",{icon.getColorFilter(),顶栏图标色},350)
--transColor(info,"ColorFilter",{info.getColorFilter(),顶栏图标色},350)
transColor(search,"ColorFilter",{search.getColorFilter(),顶栏图标色},350)
transColor(title,"textColor",{title.getCurrentTextColor(),顶栏文字色},350)
setSystemUi()
end
else
if none_ic.getVisibility()~=8 then
none_ic.setVisibility(8)
transColor(topBar,"backgroundColor",{topBar.getBackground().getColor(),0},350)
transColor(icon,"ColorFilter",{icon.getColorFilter(),0xff000000},350)
--transColor(info,"ColorFilter",{info.getColorFilter(),0xff000000},350)
transColor(search,"ColorFilter",{search.getColorFilter(),0xff000000},350)
transColor(title,"textColor",{title.getCurrentTextColor(),0xff444444},350)
setSystemUi(0)
end
end
end

searchBar.getChildAt(0).addTextChangedListener({
 onTextChanged=function() 
 if #searchBar.getChildAt(0).text>0 then
 refreshList(searchBar.getChildAt(0).text)
 keyword=searchBar.getChildAt(0).text
 else
 keyword=nil
 refreshList(keyword)
end
end})

function onKeyDown(k)
if k==4 then
if searchBar.getVisibility()==0 then
searchBar.getChildAt(0).text=""
refreshList(keyword)
--task(300, function ()
searchBar.setVisibility(8)
--end)
透明动画(searchBar,350,1,0)
--圆形扩散(searchBar,0,w,h,0,750)
imm.hideSoftInputFromWindow(searchBar.getChildAt(0).getWindowToken(), 0)
elseif pos~=0 then
content.smoothScrollTo(0,0)
else
this.finish()
end
return true
end
end
