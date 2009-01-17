if (version<090117) {
	$("#update").html("发现新版，点击<a href='http://code.google.com/p/jquery-api-zh-cn/downloads/list'>下载新版</a>");
	$("#changelog").html("\
2009-01-17 18:31:10 +0800<br />\
+ jQuery.support.scriptEval<br />\
+ 原 Dimension 插件功能（1.2.6版加入jQuery核心）<br />\
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
");
	
}else {
	$("#update").text("当前已是最新版。");
}