<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="html" indent="no" omit-xml-declaration="no" encoding="utf-8"
		cdata-section-elements="" media-type="text/html"
		doctype-public="-//W3C//DTD XHTML 1.1//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml11.dtd" />
	<xsl:template match="/method">
		<html xmlns="http://www.w3.org/1999/xhtml">
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<title>jQuery 中文参考 - <xsl:value-of select="@name"/>
					<xsl:if test="params">(<xsl:for-each select="params">
							<xsl:value-of select="@name"/>
							<xsl:if test="position() != last()">, </xsl:if>
						</xsl:for-each>)</xsl:if>
			</title>
			<link type="text/css" rel="stylesheet" rev="stylesheet" href="css/base.css" media="all" />
			<script type="text/javascript" src="js/jquery-1.2.6.pack.js"></script>
			<script type="text/javascript" src="js/jqueryui-doc.js"></script>
		</head>
		<body id="method">
		<div  id="content">
			<a href="index.html">回到首页</a>
			<div>
				<xsl:attribute name="id"><xsl:value-of select="@name"/></xsl:attribute>
				<h2><xsl:value-of select="@name"/>
					<xsl:if test="params">(<xsl:for-each select="params">
							<xsl:value-of select="@name"/>
							<xsl:if test="position() != last()">, </xsl:if>
						</xsl:for-each>)</xsl:if>
				</h2>
				<h3>概述</h3>
				<div class="desc">
					<p><xsl:value-of select="@short"/></p>
					<div class="longdesc">
						<p><xsl:value-of select="desc"/></p>
					</div>
				</div>
				<xsl:if test="params">
					<h3>参数</h3>
					<div>
						<xsl:for-each select="params">
							<h4>
								<strong><xsl:value-of select="@name"/></strong>
								<span><xsl:value-of select="@type"/></span>
								<em>默认值：'original'</em>
							</h4>
							<p><xsl:value-of select="desc"/></p>
						</xsl:for-each>
					</div>
				</xsl:if>
				<xsl:if test="examples">
					<div class="examples">
						<h3>示例</h3>
						<xsl:apply-templates select="examples"/>
					</div>
				</xsl:if>
			</div>
		</div>
		</body>
		</html>
	</xsl:template>

	<xsl:template match="examples">
		<xsl:if test="desc">
			<h4>说明:</h4>
			<p><xsl:value-of select="desc"/></p>
		</xsl:if>
		<xsl:if test="before">
			<h5>HTML 代码:</h5>
			<code><xsl:value-of select="before"/></code>
		</xsl:if>
		<xsl:if test="code">
			<h5>jQuery 代码:</h5>
			<code><xsl:value-of select="code"/></code>
		</xsl:if>
		<xsl:if test="result">
			<h5>结果:</h5>
			<code><xsl:value-of select="result"/></code>
		</xsl:if>
		<xsl:if test="following-sibling::examples">
			<hr />
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
