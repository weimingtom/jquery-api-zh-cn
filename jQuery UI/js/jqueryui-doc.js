/*
 * jQuery UI 中文参考文档 脚本
 *
 * Copyright (c) 2008 Shawphy (shawphy.com)
 * Dual licensed under the MIT (MIT-LICENSE.txt)
 * and GPL (GPL-LICENSE.txt) licenses.
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
});