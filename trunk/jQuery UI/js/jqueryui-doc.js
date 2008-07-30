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
/*	setInterval(function() {
		$("#sidebar>ul ul a").eq(0).click();
	},1000);*/
});