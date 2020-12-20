--保存图片
webView.onLongClick=function()
  hitTestResult = webView.getHitTestResult()
  if (hitTestResult.getType() == WebView.HitTestResult.IMAGE_TYPE or hitTestResult.getType() == WebView.HitTestResult.SRC_IMAGE_ANCHOR_TYPE)then
    AboutLayout={--布局
      LinearLayout;
      orientation="vertical";
      Focusable=true,
      FocusableInTouchMode=true,
      {
        Button;--钮扣
        text="功能菜单";--文本
        textSize="25";--文本大小
        textColor="#FFFFFFFF";
        backgroundColor="#ffee7785";--背景色
        id="dd";
        layout_weight="1.0"; 
        layout_width="fill";--宽度
        layout_height="5dp";
        layout_marginTop="fill";--边顶
      };
      {
        Button;
        text="保存图片";
        textSize="15";
        textColor="#FF000000";
        backgroundColor="#FFC2C2C2";
        layout_weight="1.0"; 
        layout_width="fill";
        layout_height="1dp";
        layout_marginTop="fill";
      };
      {
        Button;
        text="保存到相册";
        textSize="17";
        textColor="#FFee7785";
        backgroundColor="#FFFFFFFF";
        layout_weight="1.0";
        layout_width="fill";
        layout_height="40dp";
        layout_marginTop="fill";
        onClick=function()
          print("图片已保存到手机相册")
          picUrl = hitTestResult.getExtra()
          Http.download(picUrl,"/storage/emulated/0/DCIM/"..os.date("%Y-%m-%d-%H-%M-%S")..".png",function(a)
          end)
          关闭对话框()
        end
      };
    };
    dlg=AlertDialog.Builder(this).setView(loadlayout(AboutLayout)).show()
    function 关闭对话框()
      return dlg and dlg.dismiss()
    end
    import "android.graphics.Paint"
  end
end