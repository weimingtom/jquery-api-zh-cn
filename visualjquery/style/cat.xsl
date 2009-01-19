<?xml version="1.0" encoding="GB2312"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output method="html"/>
  <xsl:template match="/docs">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
        <title>Visual jQuery 1.1 (Automated)</title>
        <link rel="stylesheet" href="style/site.css" type="text/css" />
      </head>
      
      <body>
      	<div id="header">
      		<img src="img/page-top.png" />
					<div id="nav_buttons">
						<a>jQuery1.3 API 中文版</a>
						<!--
						<a href="about_me">About Me</a>

						<a href="magazine">Visual jQuery Magazine</a>-->
					</div>
				</div>
				<div id="wrapper">
					<div id="content">
						<ul id="root">
		        	<xsl:apply-templates/>
						</ul>

					</div>
				</div>   
        <script type="text/javascript" src="style/jquery_110.js"></script>
				<script type="text/javascript" src="style/iutil.js"></script>
        <script type="text/javascript" src="style/jq-corners.js"></script>                
        <script type="text/javascript" src="style/center.js"></script>				
        <script type="text/javascript" src="style/visual_jquery.js"></script>
      </body>
    </html>
  </xsl:template>

  
  <xsl:template match="cat">
    <xsl:if test="@value != ''">
	    <li class="link"><a href="#"><xsl:value-of select="@value"/></a></li>

			<li class="list"><ul>
				<xsl:apply-templates>
				<xsl:sort select="@name"/>
				<xsl:sort select="count(params)"/>
				<xsl:sort select="@value"/>
				</xsl:apply-templates>
			</ul></li>
    </xsl:if>
  </xsl:template>

  
  <xsl:template match="examples">
    <xsl:if test="desc">
      <h5>说明:</h5>
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
  
  <xsl:template match="method">
    <xsl:if test="not(@private)">
    <li class="link direct"><a href="#"><xsl:value-of select="@name"/><xsl:if test="not(@property)">(<xsl:for-each select="params">
      <xsl:value-of select="@name"/>
      <xsl:if test="position() != last()">, </xsl:if>

    </xsl:for-each>)</xsl:if></a></li>
    <li class="text">
      <h1>
        <xsl:value-of select="@name"/><xsl:if test="not(@property)">(<xsl:for-each select="params">
            <xsl:value-of select="@name"/>
            <xsl:if test="position() != last()">, </xsl:if>
        </xsl:for-each>)</xsl:if>

      </h1>
     
      <p class="cndesc">
        <xsl:value-of select="cndesc"/>
      </p>
      <p class="endesc">
        <xsl:value-of select="desc"/>
      </p>
			<xsl:if test="@type">
				<h2>返回值</h2>
				<p><xsl:value-of select="@type" /></p>
			</xsl:if>

      <xsl:if test="params">
        <h2>参数</h2>
        <ul class="params">
          <xsl:for-each select="params">
            <li class="param">
              <span><xsl:value-of select="@name"/></span> (<xsl:value-of select="@type"/>): <xsl:value-of select="child::desc"/>
            </li>

          </xsl:for-each>
        </ul>
      </xsl:if>				
      <xsl:if test="options">
        <h2>Hash 选项</h2>
        <ul class="params">
          <xsl:for-each select="options">
            <li class="param">
              <span><xsl:value-of select="@name"/></span> (<xsl:value-of select="@type"/>): <xsl:value-of select="child::desc"/>

            </li>
          </xsl:for-each>
        </ul>
      </xsl:if>								
      <xsl:if test="examples">
        <div class="examples">
          <h2>示例</h2>

          <xsl:apply-templates select="examples"/>

        </div>
      </xsl:if>  
    </li>
    </xsl:if>
  </xsl:template>
    
</xsl:stylesheet>
      