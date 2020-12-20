local n=0 
function images() 
  task(3000,function() 
    n=n+1 pg3.showPage(n%3)
    images() 
  end)
end 
images();
--作者QQ2926037170
--二群小白制作，高仿任何布局，魔改任何布局以及支持修复任何布局。