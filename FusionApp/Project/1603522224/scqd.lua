--首次启动
function getData(name,key)
  local data=this.getApplicationContext().getSharedPreferences(name,0).getString(key,nil)--325-5273-2
  return data
end

function putData(name,key,value)
  this.getApplicationContext().getSharedPreferences(name,0).edit().putString(key,value).apply()--3255-2732
  return true
end
if not getData("welcome","启动过了咩") then
  putData("welcome","启动过了咩","启动过了")
  activity.newActivity('welcome.lua')
end