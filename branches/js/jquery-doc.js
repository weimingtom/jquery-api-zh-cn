/*
 * jQuery 中文参考文档 脚本
 *
 * Copyright (c) 2008 Shawphy (shawphy.com)
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 * $Id$
 * 
 */

jQuery(function($) {
	$("#sidebar>ul>li>a").click(function(){
		$(this).next().toggle();
		return false;
	});
	$("#sidebar ul ul li h2").click(function(){
		$(this).parent().clone().children().appendTo("#content");
	});
	/*
	$("#sidebar>ul ul a").click(function(){
		$("#content").load(this.href.replace(/#/," #"));
		return false;
	});
	$("#content").ajaxStart(function() {
		this.innerHTML="正在加载页面...";
	}).ajaxError(function(event, XMLHttpRequest, ajaxOptions, thrownError) {
		this.innerHTML="错误代码:" + XMLHttpRequest.status + "<br />加载"+ajaxOptions.url+"失败";
	});
	*/
	if($.browser.mozilla){
		jQuery(document).ready(function(){
			$('.longdesc,.desc:not(:has(.longdesc))').each(function(){
				$(this).html($(this).text());
			});
		});
	}
});