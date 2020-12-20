--诗句
require "import"
import "android.widget.*"
import "android.view.*"
import "android.os.Build"
import "android.app.*"
import"json"
json=require ("json")
local url="https://api.gushi.ci/shuqing/aiqing.json"
Http.get(url,nil,"utf8",nil,function(code,content,cookie,header)
  if(code==200 and content)then
    local json=json.decode(content)
    local sj=json.content
    local ly=json.origin
    local zz=json.author
    local dllay=loadlayout{
      LinearLayout,
      orientation="vertical",
      {
        TextView,
        layout_marginLeft="0dp",
        layout_marginTop="0dp",
        textSize="15sp",
        textColor="#FFFFFFFF",
        text=""..sj,
      },
    }
    toolbar.addView(dllay,1)
    dllay.layoutParams.gravity=Gravity.CENTER
  else
    print("获取语录异常"..code)
  end
end)