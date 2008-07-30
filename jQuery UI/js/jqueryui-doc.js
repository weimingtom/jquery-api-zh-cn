/*
 * jQuery UI 中文参考文档 脚本
 *
 * Copyright (c) 2008 Shawphy (shawphy.com)
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 * $Date: 2008-03-13 01:10:02 +0800
 * $Rev: 1 $
 */

jQuery(function($) {
	$("#sidebar ul ul").hide();
	$("#sidebar>ul>li>a").click(function(){
		$(this).next().toggle();
		return false;
	});
	$("#sidebar>ul ul a").click(function(){
		$("#content").load(this.href.replace(/#/," #"))
		return false;
	});
	$("#content").ajaxStart(function() {
		this.innerHTML="正在加载页面...";
	}).ajaxError(function(event, XMLHttpRequest, ajaxOptions, thrownError) {
		this.innerHTML=XMLHttpRequest.status+"错误，加载"+ajaxOptions.url+"失败。";
	});
/*	setInterval(function() {
		$("#sidebar>ul ul a").eq(0).click();
	},1000);*/
});