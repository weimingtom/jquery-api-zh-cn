if (version<090117) {
	$("#update").html("发现最新版，点击<a href='http://code.google.com/p/jquery-api-zh-cn/downloads/list'>这里下载</a>");
	$("#changelog").html("\
2009-01-16 19:11:10 +0800<br />\
+ jQuery.fx.off<br />\
+ toggleClass( class, switch )<br />\
+ toggle( switch )<br />\
+ toggle(speed,[callback])<br />\
* 修改queue和dequeue方法的参数和说明<br />\
<br />\
2009-01-15 22:31:02 +0800<br />\
* jQuery(html,[ownerDocument])<br />\
+ jQuery.selector<br />\
+ jQuery.context<br />\
* 效果下的queue和dequeue搬到核心下<br />\
+ live<br />\
+ die<br />\
+ closest<br />\
* stop( [clearQueue], [gotoEnd]) 增加两个参数<br />\
+ jQuery.support<br />\
+ jQuery.isArray( obj )<br />\
")
	
}else {
	$("#update").text("您当前已经是最新版了。")
}