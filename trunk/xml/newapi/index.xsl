<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes"
		doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" />

	<xsl:template match="/">
		<html>
		<head>
			<title>jQuery <xsl:value-of select="/api/categories/category[@name='Version']/category[last()]/@name"/> 中文文档 </title>
			<link rel="stylesheet" href="style.css"/>
		</head>
		<body id="api">
			<div id="header">
				<div id="headerMain"><h1>jQuery 中文文档 XSLT/CSS/JS Written by <a href="http://shawphy.com">Shawphy</a> Translated by <a href="http://www.cn-cuckoo.com/">为之漫笔</a>, <a href="http://shawphy.com">Shawphy</a> and <a href="http://cloudream.name">Cloudream</a>.  <a href="http://code.google.com/p/jquery-api-zh-cn/downloads/list">下载CHM离线版</a></h1></div>
			</div>
			<div id="wrapper">
				<div id="sidebar">
					<xsl:for-each select="/api/categories/category">
						<h2><xsl:value-of select="@name"/></h2>
						<div>
							<xsl:choose>
								<xsl:when test="category">
									<xsl:for-each select="category">
										<b><xsl:value-of select="@name"/></b>
										<ul>
											<xsl:for-each select="//entry/category[@name=current()/@name]/..">
												<xsl:sort select="@name"/>
												<xsl:if test="not(following::entry[1]/@name=@name)">
													<xsl:choose>
														<xsl:when test="@type='selector'">
															<li class="selector">
																<xsl:attribute name="title"><xsl:value-of select="@name"/></xsl:attribute>
																<xsl:value-of select="sample"/>
															</li>
														</xsl:when>
														<xsl:otherwise>
															<li><xsl:value-of select="@name"/><xsl:if test="@type='method'">()</xsl:if></li>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:if>
											</xsl:for-each>
										</ul>
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<ul>
									<xsl:for-each select="//entry/category[@name=current()/@name]/..">
										<xsl:sort select="@name"/>
										<xsl:if test="not(following::entry[1]/@name=@name)">
											<li><xsl:value-of select="@name"/><xsl:if test="@type='method'">()</xsl:if></li>
										</xsl:if>
									</xsl:for-each>
									</ul>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</xsl:for-each>
				</div>
				<div id="content">
					<xsl:for-each-group select="/api/entries/entry" group-by="@type">
						<xsl:for-each-group select="current-group()" group-by="@name">
							<xsl:sort select="@name"/>
							<xsl:choose>
								<xsl:when test="@type='selector'">
									<xsl:result-document href="./output/{replace(@name,' ','-')}-selector.html">
										<xsl:apply-templates select="current-group()"/>
									</xsl:result-document>
								</xsl:when>
								<xsl:otherwise>
									<xsl:result-document href="./output/{@name}.html">
										<xsl:apply-templates select="current-group()"/>
									</xsl:result-document>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each-group>
					</xsl:for-each-group>
				</div>
			</div><!--
			<script type="text/javascript">
				var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
				document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
				</script>
				<script type="text/javascript">
				var pageTracker = _gat._getTracker("UA-5320749-1");
				pageTracker._initData();
				pageTracker._trackPageview();
			</script>-->
			<script src="jquery.min.js"></script>
			<script>
				$("#sidebar h2").click(function(){
					$(this).next("div").toggle().siblings("div").hide();
				});
				$("#sidebar li").click(function(){
					$("#content").empty().css("top",$(document).scrollTop());
					var name="output/"+$(this).text().replace("()","");
					if($(this).hasClass("selector")){
						name="output/"+$(this).attr("title").replace(" ","-")+"-selector";
					}
					$("#content").load(name+".html");
				});
			</script>
		</body>
		</html>
	</xsl:template>

	<xsl:template match="/api/entries/entry">
		<div>
			<h2>
				<xsl:if test="@return!=''">
					<span>返回值:<xsl:value-of select="@return"/></span>
					</xsl:if>
				<xsl:if test="@type='method'">
						<xsl:value-of select="@name"/>(<xsl:for-each select="signature[1]/argument">
							<xsl:choose>
								<xsl:when test="@optional">
									<em class="optional">[<xsl:value-of select="@name"/>]</em>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="@name"/>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:if test="position() != last()">, </xsl:if>
						</xsl:for-each>)<br/>
				</xsl:if>
				<xsl:if test="@type='selector'">
					<xsl:value-of select="sample"/>
				</xsl:if>
				<xsl:if test="@type='property'">
					<xsl:value-of select="@name"/>
				</xsl:if>
			</h2>
			<h3>概述</h3>
			<div class="desc">
				<p><xsl:value-of select="desc"/></p>
				<ul class="signatures">

					<xsl:for-each select="signature">
						<li>
						<h4>
						<span><xsl:value-of select="added"/> 版增加</span>
						<xsl:value-of select="../@name"/>(<xsl:for-each select="argument">
							<xsl:choose>
								<xsl:when test="@optional">
									<em class="optional">[<xsl:value-of select="@name"/>]</em>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="@name"/>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:if test="position() != last()">, </xsl:if>
						</xsl:for-each>)</h4>
						<xsl:for-each select="argument">
							<p class="arguement">
								<strong><xsl:value-of select="@name"/></strong>
								(<xsl:value-of select="@type"/>)
								<xsl:if test="@optional"> 可选参数，</xsl:if>
								<xsl:if test="@default">默认值:'<xsl:value-of select="@default"/>'</xsl:if>
								<xsl:value-of select="desc"/>
							</p>
						</xsl:for-each>
						</li>
					</xsl:for-each>
				</ul>
				<div class="longdesc">
					<xsl:copy-of select="longdesc/*"/>
				</div>
			</div>
			<xsl:if test="params">
				<h3>参数</h3>
				<div>
					<xsl:for-each select="params">
						<h4>
							<strong><xsl:value-of select="@name"/><xsl:if test="@optional"> <em> (可选)</em></xsl:if></strong>
							<span><xsl:value-of select="@type"/></span>
							<xsl:if test="@default"><em>默认值:'<xsl:value-of select="@default"/>'</em></xsl:if>
						</h4>
						<p>
							<xsl:value-of select="desc" disable-output-escaping="yes"/>
						</p>
					</xsl:for-each>
				</div>
			</xsl:if>
			<xsl:if test="option">
				<h3>选项</h3>
				<div>
					<xsl:for-each select="option">
						<h4>
							<strong><xsl:value-of select="@name"/></strong>
							<span><xsl:value-of select="@type"/></span>
							<xsl:if test="@default"><em>默认值:'<xsl:value-of select="@default"/>'</em></xsl:if>
						</h4>
						<p><xsl:value-of select="desc" disable-output-escaping="yes"/></p>
						<xsl:if test="code">
							<pre><code><xsl:value-of select="code"/></code></pre>
						</xsl:if>
					</xsl:for-each>
				</div>
			</xsl:if>
			<xsl:if test="example">
				<div class="example">
					<h3>示例</h3>
					<xsl:apply-templates select="example"/>
				</div>
			</xsl:if>
		</div>
	</xsl:template>

	<xsl:template match="example">
		<xsl:if test="desc">
			<h4>描述:</h4>
			<p><xsl:value-of select="desc"/></p>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="html[1] and code[1]">
			<pre><code>&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;<xsl:if test="css">
&lt;style&gt;
<xsl:value-of select="css"/>
&lt;/style&gt;
</xsl:if>
&lt;script src="jquery.min.js"&gt;&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
    <xsl:value-of select="html"/>
    &lt;script&gt;<xsl:value-of select="code"/>&lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;</code></pre>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="css">
					<h5>CSS 代码:</h5>
					<pre><code><xsl:value-of select="css"/></code></pre>
				</xsl:if>
				<xsl:if test="html">
					<h5>HTML 代码:</h5>
					<pre><code><xsl:value-of select="html"/></code></pre>
				</xsl:if>
				<xsl:if test="code">
					<h5>jQuery 代码:</h5>
					<pre><code><xsl:value-of select="code"/></code></pre>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="results">
			<h5>结果:</h5>
			<pre><code><xsl:value-of select="results"/></code></pre>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>
