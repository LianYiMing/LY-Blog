require "import"
import "glob"

name=...
packinfo = pm.getPackageInfo(name, 64)

function onResume()
if pcall(function ()
--所有activity
per=pm.getPackageInfo(name,PackageManager.GET_ACTIVITIES).activities
perm_adp=LuaAdapter(activity,{},{
TextView,
id="p",
padding="3.5%w",
textSize="16sp",
layout_width="fill",
textColor=0xff444444,
})
for l=0,#per-1 do
perm_adp.add({p=per[l].name})
end
perm_count.text="总共 "..perm_adp.getCount().." 个 Activity"
per_ls.setAdapter(perm_adp)
end) then else
print ("Activity 列表加载失败，该应用可能没有 Activity。")
this.finish()
end
end

this.setContentView(loadlayout (
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
      ImageView,
      src="back.png",
      onClick=function ()
       this.finish()
       end,
      foreground=波纹(0xcb5B5B5B),
      layout_height="fill",
      id="back",
      layout_width="13%w",
      padding="3.5%w",
    },
    {
      TextView,
      id="title",
      text="Activity 列表",
      paddingRight="13%w",
      paddingLeft="3%w",
      layout_toRightOf="back";
      gravity="left|center",
      singleLine=true,
      ellipsize="end",
      textSize="18sp",
      layout_height="fill",
      layout_width="fill",
      textColor=0xff444444,
    },
  },
  {
TextView,
id="perm_count",
layout_width="fill",
textSize="14sp",
padding="2%w",
paddingLeft="3.5%w",
},
{
ListView,
id="per_ls",
layout_width="fill",
fastScrollEnabled=true,
VerticalScrollBarEnabled=false,
dividerHeight=1,
onItemClick=function(parent, view, position, id)

end,
},
}))
