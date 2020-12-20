--背景音乐
import "android.media.MediaPlayer"
import "java.io.*"
local m=MediaPlayer()
function 播放(path)
  m.reset()
  m.setDataSource(path)
  m.prepare()
  m.start()
end
路径=this.getFilesDir().toString().."/sub/1555068569/open.mp3"
file,err=io.open(路径)
if err==nil then
  播放(路径)
else
  弹出消息("程序出问题啦，歌曲没法播放！")
end