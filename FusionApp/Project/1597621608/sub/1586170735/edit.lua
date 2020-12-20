--[[
小记事 project by Ayaka_Ago
]]

require "import"
import "global_string"

path=...
create_time=StrToTable(io.open(path):read("*a"))["date"]["create"]
after_c=string.gsub(StrToTable(io.open(path):read("*a"))["content"]["messages"],":xjszkh:","[")
after_c=string.gsub(after_c,":xjsykh:","]")
card_color=StrToTable(io.open(path):read("*a"))["content"]["color"] or -1
note_category=StrToTable(io.open(path):read("*a"))["content"]["category"] or "记事"
isStared=StrToTable(io.open(path):read("*a"))["content"]["star"] or false

function setCurrentSelectedCardColor(v)
c1.Parent.getChildAt(1).setVisibility(8)
c2.Parent.getChildAt(1).setVisibility(8)
c3.Parent.getChildAt(1).setVisibility(8)
c4.Parent.getChildAt(1).setVisibility(8)
c5.Parent.getChildAt(1).setVisibility(8)
c6.Parent.getChildAt(1).setVisibility(8)
if v==c1 then
card_color=card_color_list[1]
elseif v==c2 then
card_color=card_color_list[2]
elseif v==c3 then
card_color=card_color_list[3]
elseif v==c4 then
card_color=card_color_list[4]
elseif v==c5 then
card_color=card_color_list[5]
elseif v==c6 then
card_color=card_color_list[6]
end
v.Parent.getChildAt(1).setVisibility(0)
end

function setCategory(v)
f1.setTextColor(0xff444444)
f2.setTextColor(0xff444444)
f3.setTextColor(0xff444444)
f4.setTextColor(0xff444444)
f5.setTextColor(0xff444444)
f6.setTextColor(0xff444444)
f7.setTextColor(0xff444444)
v.setTextColor(主题色)
note_category=v.text
end

this.setContentView(loadlayout({
  RelativeLayout,
  {
    RelativeLayout,
    layout_height="21.75%w",
    layout_width="fill",
    id="topBar",
    backgroundColor=0,
    elevation="1%w",
    paddingTop=状态栏高度,
    {
      ImageView,
      src="back.png",
      layout_alignParentLeft=true;
      layout_height="fill",
      layout_width="13%w",
      padding="3.5%w",
      id="back",
      onClick=function ()
this.finish()
end,
foreground=波纹(0xcb5B5B5B),
      ColorFilter=0xff000000,
    },
    {
      TextView,
      id="title",
      text="编辑记事",
      layout_toRightOf="back",
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
 LinearLayout,
 layout_alignParentRight=true,
 orientation="horizontal",
{
ImageView,
ColorFilter=0xff000000,
src="save.png",
layout_width="13%w",
layout_height="fill",
padding="3.5%w",
id="save",
onClick=function ()
saveNote()
end,
foreground=波纹(0xcb5B5B5B),
},
{
ImageView,
ColorFilter=0xff000000,
src="share.png",
layout_width="13%w",
layout_height="fill",
padding="3.5%w",
id="share",
onClick=function ()
shareText(note_title.text.."\n\n"..note_content.text)
end,
foreground=波纹(0xcb5B5B5B),
},
{
ImageView,
src="delete.png",
layout_width="13%w",
layout_height="fill",
ColorFilter=0xff000000,
padding="3.5%w",
id="del",
onClick=function ()
local d=AlertDialog.Builder(this)
d.setTitle("要删除这条记事吗？")
d.setMessage("此操作无法撤销")
d.setPositiveButton("取消",nil)
d.setNegativeButton("删除", function ()
File(path).delete()
isDeleted=true
this.finish()
end)
local d=d.show()
setDialogButtonColor(d,0,按钮文字色)
圆角(d.getWindow(),0xfffafafa,{17,17,17,17,17,17,17,17})
end,
foreground=波纹(0xcb5B5B5B),
},
{
ImageView,
ColorFilter=0xff000000,
src="info.png",
layout_width="13%w",
layout_height="fill",
padding="3.5%w",
id="info",
onClick=function ()
local i=AlertDialog.Builder(this)
i.setTitle("记事信息")
i.setMessage("创建时间: "..StrToTable(io.open(path):read("*a"))["date"]["create"]	.."\n更新时间: "..StrToTable(io.open(path):read("*a"))["date"]["update"]	.."\n\n字数统计: (含标点符号)\n内容字数: "..utf8.len(note_content.text)	.."\n标题字数: "..utf8.len(note_title.text).."\n总字数: "..utf8.len(note_title.text)+utf8.len(note_content.text).."\n\n文件大小: "..getFileSize(path))
i.setPositiveButton("好的",nil)
local i=i.show()
setDialogButtonColor(i,0,按钮文字色)
圆角(i.getWindow(),0xfffafafa,{25,25,25,25,25,25,25,25})
end,
foreground=波纹(0xcb5B5B5B),
},
  },
},
{
ScrollView,
id="content",
layout_width="fill",
 {
 LinearLayout,
 orientation="vertical",
 paddingTop="21.75%w",
 padding="3.5%w",
 layout_width="fill",
{
EditText,
layout_height=h*0.13-状态栏高度,
backgroundColor=0,
text=StrToTable(io.open(path):read("*a"))["content"]["title"]	,
id="note_title",
layout_width="fill",
singleLine=true,
hint="标题",
textSize="20sp",
},
{
EditText,
backgroundColor=0,
layout_width="fill",
hint="内容",
textSize="18sp",
--text=StrToTable(io.open(path):read("*a"))["content"]["messages"]	,
text=after_c,
id="note_content",
},
{
LinearLayout,
paddingTop="15%w",
orientation="vertical",
layout_width="fill",
{
TextView,
text="卡片颜色",
textSize="16sp",
},
{
HorizontalScrollView,
paddingTop="3.5%w",
paddingBottom="3.5%w",
layout_width="fill",
HorizontalScrollBarEnabled=false,
OverScrollMode=2,
{
LinearLayout,
orientation="horizontal",
layout_width="wrap",
{
RelativeLayout,
layout_width="14%w",
layout_height="14%w",
{
ImageView,
ColorFilter=card_color_list[1],
layout_width="fill",
layout_height="fill",
id="c1",
onClick=function (v)
setCurrentSelectedCardColor(v)
end,
src="dot.png",
},
{
ImageView,
ColorFilter=0xff000000,
layout_width="fill",
padding="2.5%w",
layout_height="fill",
src="true.png",
},
},
{
RelativeLayout,
layout_width="14%w",
layout_height="14%w",
{
ImageView,
id="c2",
ColorFilter=card_color_list[2],
onClick=function (v)
setCurrentSelectedCardColor(v)
end,
layout_width="fill",
layout_height="fill",
src="dot.png",
},
{
ImageView,
ColorFilter=0xffffffff,
layout_width="fill",
padding="2.5%w",
layout_height="fill",
src="true.png",
},
},
{
RelativeLayout,
layout_width="14%w",
layout_height="14%w",
{
ImageView,
id="c3",
ColorFilter=card_color_list[3],
layout_width="fill",
onClick=function (v)
setCurrentSelectedCardColor(v)
end,
layout_height="fill",
src="dot.png",
},
{
ImageView,
ColorFilter=0xffffffff,
layout_width="fill",
padding="2.5%w",
layout_height="fill",
src="true.png",
},
},
{
RelativeLayout,
layout_width="14%w",
layout_height="14%w",
{
ImageView,
ColorFilter=card_color_list[4],
layout_width="fill",
id="c4",
layout_height="fill",
onClick=function (v)
setCurrentSelectedCardColor(v)
end,
src="dot.png",
},
{
ImageView,
ColorFilter=0xff000000,
layout_width="fill",
padding="2.5%w",
layout_height="fill",
src="true.png",
},
},
{
RelativeLayout,
layout_width="14%w",
layout_height="14%w",
{
ImageView,
ColorFilter=card_color_list[5],
layout_width="fill",
onClick=function (v)
setCurrentSelectedCardColor(v)
end,
id="c5",
layout_height="fill",
src="dot.png",
},
{
ImageView,
ColorFilter=0xffffffff,
layout_width="fill",
padding="2.5%w",
layout_height="fill",
src="true.png",
},
},
{
RelativeLayout,
layout_width="14%w",
visibility=8,
layout_height="14%w",
{
ImageView,
onClick=function (v)
setCurrentSelectedCardColor(v)
end,
ColorFilter=card_color_list[6],
layout_width="fill",
layout_height="fill",
src="dot.png",
id="c6",
},
{
ImageView,
ColorFilter=0xffffffff,
layout_width="fill",
padding="2.5%w",
layout_height="fill",
src="true.png",
},
},
},
},
{
TextView,
text="记事分类",
textSize="16sp",
},
{
HorizontalScrollView,
paddingTop="3.5%w",
paddingBottom="3.5%w",
layout_width="fill",
HorizontalScrollBarEnabled=false,
OverScrollMode=2,
{
LinearLayout,
orientation="horizontal",
layout_width="wrap",
{
TextView,
textColor=0xff444444,
textSize="16sp",
Text="记事",
padding="3.5%w",
onClick=function (v)
setCategory(v)
end,
id="f1",
},
{
TextView,
textColor=0xff444444,
textSize="16sp",
Text="日常",
onClick=function (v)
setCategory(v)
end,
padding="3.5%w",
id="f2",
},
{
TextView,
textColor=0xff444444,
textSize="16sp",
Text="清单",
padding="3.5%w",
onClick=function (v)
setCategory(v)
end,
id="f3",
},
{
TextView,
Text="写作",
textColor=0xff444444,
textSize="16sp",
onClick=function (v)
setCategory(v)
end,
padding="3.5%w",
id="f4",
},
{
TextView,
Text="计划",
padding="3.5%w",
textColor=0xff444444,
textSize="16sp",
onClick=function (v)
setCategory(v)
end,
id="f5",
},
{
TextView,
Text="目标",
textColor=0xff444444,
textSize="16sp",
onClick=function (v)
setCategory(v)
end,
padding="3.5%w",
id="f6",
},
{
TextView,
Text="杂项",
textColor=0xff444444,
textSize="16sp",
onClick=function (v)
setCategory(v)
end,
padding="3.5%w",
id="f7",
},
},
},
{
RelativeLayout,
{
TextView,
text="星标",
textColor=0xff444444,
textSize="16sp",
},
{
Switch,
OnCheckedChangeListener={
  onCheckedChanged=function(v,isChecked)
				if isChecked then
				isStared=true
v.ThumbDrawable.setColorFilter(PorterDuffColorFilter(主题色,PorterDuff.Mode.SRC_ATOP))
v.TrackDrawable.setColorFilter(PorterDuffColorFilter(主题色,PorterDuff.Mode.SRC_ATOP))
				else
				isStared=false
v.ThumbDrawable.setColorFilter(PorterDuffColorFilter(0xFFB9B9B9,PorterDuff.Mode.SRC_ATOP))
v.TrackDrawable.setColorFilter(PorterDuffColorFilter(0xFFB9B9B9,PorterDuff.Mode.SRC_ATOP))
				end
				end						},
checked=isStared,
id="star_switch",
layout_alignParentRight=true,
},
},
},
},
},
}))

pos=0
content.onScrollChange=function (v,x,y,px,py)
--print(x.." "..y.." "..px.." "..py)
pos=y
if y>=title.top then
setSystemUi()
if none_ic.getVisibility()~=0 then
none_ic.setVisibility(0)
transColor(topBar,"backgroundColor",{topBar.getBackground().getColor(),主题色},350)
transColor(back,"ColorFilter",{back.getColorFilter(),顶栏图标色},350)
transColor(info,"ColorFilter",{info.getColorFilter(),顶栏图标色},350)
transColor(del,"ColorFilter",{del.getColorFilter(),顶栏图标色},350)
transColor(share,"ColorFilter",{share.getColorFilter(),顶栏图标色},350)
transColor(save,"ColorFilter",{save.getColorFilter(),顶栏图标色},350)
transColor(title,"textColor",{title.getCurrentTextColor(),顶栏文字色},350)
end
else
setSystemUi(0)
if none_ic.getVisibility()~=8 then
none_ic.setVisibility(8)
transColor(topBar,"backgroundColor",{topBar.getBackground().getColor(),0},350)
transColor(back,"ColorFilter",{back.getColorFilter(),0xff000000},350)
transColor(info,"ColorFilter",{info.getColorFilter(),0xff000000},350)
transColor(del,"ColorFilter",{del.getColorFilter(),0xff000000},350)
transColor(share,"ColorFilter",{share.getColorFilter(),0xff000000},350)
transColor(save,"ColorFilter",{save.getColorFilter(),0xff000000},350)
transColor(title,"textColor",{title.getCurrentTextColor(),0xff444444},350)
end
end
end

function onKeyDown(k)
if k==4 and pos~=0 then
content.smoothScrollTo(0,0)
return true
end
end

function saveNote()
local tosave_c=string.gsub(note_content.text,"%[",":xjszkh:")
local tosave_c=string.gsub(tosave_c,"%]",":xjsykh:")
local f,e=pcall(function ()
io.open(path,"w+"):write([[{
["date"]	={
["create"]	="]]..create_time	..[[";
["update"]	="]]..os.date("%y.%m.%d %H:%M:%S")..[[";
};
["content"]	={
["color"]=]]..card_color..[[;
["star"]=]]..tostring(isStared)..[[,
["category"]="]]..note_category..[[";
["title"]	="]]..note_title.text..[[";
["messages"]	=]].."[["..tosave_c.."]]"..[[;
};
}]]):close()
end)
if not e then
print ("已保存")
end
end

function onDestroy()
if not isDeleted then
saveNote()
end
end

if note_category==f1.text then
setCategory(f1)
elseif note_category==f2.text then
setCategory(f2)
elseif note_category==f3.text then
setCategory(f3)
elseif note_category==f4.text then
setCategory(f4)
elseif note_category==f5.text then
setCategory(f5)
elseif note_category==f6.text then
setCategory(f6)
elseif note_category==f7.text then
setCategory(f7)
end

if card_color==(card_color_list[1]) then
setCurrentSelectedCardColor(c1)
elseif card_color==(card_color_list[2]) then
setCurrentSelectedCardColor(c2)
elseif card_color==(card_color_list[3]) then
setCurrentSelectedCardColor(c3)
elseif card_color==(card_color_list[4]) then
setCurrentSelectedCardColor(c4)
elseif card_color==(card_color_list[5]) then
setCurrentSelectedCardColor(c5)
elseif card_color==(card_color_list[6]) then
setCurrentSelectedCardColor(c6)
else
setCurrentSelectedCardColor(c1)
end
