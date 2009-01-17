if (version<090117) {
	$("#update").html("发现最新版，点击<a href='http://code.google.com/p/jquery-api-zh-cn/downloads/list'>这里下载</a>");
	$("#changelog").html("\
2009-01-16 19:11:10 +0800\r\n\
+ jQuery.fx.off\r\n\
+ toggleClass( class, switch )\r\n\
+ toggle( switch )\r\n\
+ toggle(speed,[callback])\r\n\
* 修改queue和dequeue方法的参数和说明\r\n\
\r\n\
2009-01-15 22:31:02 +0800\r\n\
* jQuery(html,[ownerDocument])\r\n\
+ jQuery.selector\r\n\
+ jQuery.context\r\n\
* 效果下的queue和dequeue搬到核心下\r\n\
+ live\r\n\
+ die\r\n\
+ closest\r\n\
* stop( [clearQueue], [gotoEnd]) 增加两个参数\r\n\
+ jQuery.support\r\n\
+ jQuery.isArray( obj )\r\n\
")
	
}else {
	$("#update").text("您当前已经是最新版了。")
}