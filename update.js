if (version<090117) {
	$("#update").html("发现最新版，点击<a href='http://code.google.com/p/jquery-api-zh-cn/downloads/list'>这里下载</a>");
	$("#changelog").html("\
2009-01-16 19:11:10 +0800\
+ jQuery.fx.off\
+ toggleClass( class, switch )\
+ toggle( switch )\
+ toggle(speed,[callback])\
* 修改queue和dequeue方法的参数和说明\
\
2009-01-15 22:31:02 +0800\
* jQuery(html,[ownerDocument])\
+ jQuery.selector\
+ jQuery.context\
* 效果下的queue和dequeue搬到核心下\
+ live\
+ die\
+ closest\
* stop( [clearQueue], [gotoEnd]) 增加两个参数\
+ jQuery.support\
+ jQuery.isArray( obj )\
")
	
}else {
	$("#update").text("您当前已经是最新版了。")
}