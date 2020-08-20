require "import"
import "glob"

fea_list=pm.getSystemAvailableFeatures()

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
      text="系统 Features",
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

perm_adp=LuaAdapter(activity,{},{
TextView,
id="p",
padding="3.5%w",
textSize="16sp",
layout_width="fill",
textColor=0xff444444,
})
for l=0,#fea_list-1 do
perm_adp.add({p=fea_list[l].name})
end
perm_count.text="总共 "..perm_adp.getCount().." 个 Features"
per_ls.setAdapter(perm_adp)
