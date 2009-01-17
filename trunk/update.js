if (version<090117) {
	$("#update").html("发现最新版，点击<a href='http://code.google.com/p/jquery-api-zh-cn/downloads/list'>这里下载</a>");
	$("#changelog").load("http://jquery-api-zh-cn.googlecode.com/svn/trunk/changelog.txt")
	
}else {
	$("#update").text("您当前已经是最新版了。")
}