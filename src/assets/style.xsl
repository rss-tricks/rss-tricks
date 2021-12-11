<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" exclude-result-prefixes="feedburner"
                xmlns:feedburner="http://rssnamespace.org/feedburner/ext/1.0">
    <xsl:output method="html"/>
    <xsl:variable name="title" select="/rss/channel/title"/>
    <xsl:variable name="feedUrl" select="/rss/channel/atom10:link[@rel='self']/@href"
                  xmlns:atom10="http://www.w3.org/2005/Atom"/>
    <xsl:template match="/">
        <xsl:element name="html">
            <head>
                <title>
                    <xsl:value-of select="$title"/>
                </title>
                <link href="assets/style.css" rel="stylesheet" type="text/css" media="all"/>
                <link rel="alternate" type="application/rss+xml" title="{$title}" href="{$feedUrl}"/>
                <xsl:element name="script">
                    <xsl:attribute name="type">text/javascript</xsl:attribute>
                    <xsl:attribute name="src">assets/script.js</xsl:attribute>
                </xsl:element>
            </head>
            <xsl:apply-templates select="rss/channel"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="channel">
        <body id="browserfriendly">
            <header>
                <div id="bannerblock">
                    <xsl:apply-templates select="image"/>
                    <h1>
                        <xsl:choose>
                            <xsl:when test="link">
                                <a href="{normalize-space(link)}" title="Link to original website">
                                    <xsl:value-of select="$title"/>
                                </a>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$title"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </h1>
                </div>
            </header>
            <main>
                <ul>
                    <xsl:apply-templates select="item"/>
                </ul>
            </main>
            <footer>
            </footer>

        </body>
    </xsl:template>
    <xsl:template match="item" xmlns:dc="http://purl.org/dc/elements/1.1/">
        <li class="regularitem">
            <h2 class="itemtitle">
                <xsl:choose>
                    <xsl:when test="guid[@isPermaLink='true' or not(@isPermaLink)]">
                        <a href="{normalize-space(guid)}">
                            <xsl:value-of select="title"/>
                        </a>
                    </xsl:when>
                    <xsl:when test="link">
                        <a href="{normalize-space(link)}">
                            <xsl:value-of select="title"/>
                        </a>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="title"/>
                    </xsl:otherwise>
                </xsl:choose>
            </h2>
            <h5 class="itemposttime">
                <xsl:if test="count(child::pubDate)=1">
                    <span>Posted:</span>
                    <xsl:value-of select="pubDate"/>
                </xsl:if>
                <xsl:if test="count(child::dc:date)=1">
                    <span>Posted:</span>
                    <xsl:value-of select="dc:date"/>
                </xsl:if>
            </h5>
            <div class="itemcontent" name="decodeable">
                <xsl:value-of select="description" disable-output-escaping="yes"/>
            </div>
            <xsl:if test="count(child::enclosure)=1">
                <p class="mediaenclosure">MEDIA ENCLOSURE:
                    <a href="{enclosure/@url}">
                        <xsl:value-of select="child::enclosure/@url"/>
                    </a>
                </p>
            </xsl:if>
        </li>
    </xsl:template>
    <xsl:template match="image">
        <a href="{normalize-space(link)}" title="Link to original website">
            <img src="{url}" id="feedimage" alt="{title}"/>
        </a>
        <xsl:text/>
    </xsl:template>
</xsl:stylesheet>
