<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4" page-height="29.7cm" page-width="21.0cm" margin="2cm">
                    <fo:region-body margin="1.5cm"/>
                    <fo:region-before extent="2cm" />
                    <fo:region-after   extent="2cm"
                       display-align="after">
                       </fo:region-after>
                </fo:simple-page-master>
            </fo:layout-master-set>

            <!-- úvod -->
            <fo:page-sequence master-reference="A4">
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block text-align="center">
                        <fo:page-number/>
                    </fo:block>
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body" space-after="2cm">
                    <fo:block font-size="24pt" text-align="center">World Factbook</fo:block>
                    <fo:block font-size="14pt" text-align="center">
                        Semestrálna práca na predmet BI-XML v LS 2018/2019
                    </fo:block>
                    <fo:block font-size="12pt" space-before="1cm">
						jantopat@fit.cvut.cz
                    </fo:block>
                    <fo:block font-size="20pt" space-before="0.5cm" font-weight="bold" text-align="center">
                        Obsah
                    </fo:block>
                    <xsl:apply-templates mode="content" /> <!-- vygeneruje zoznam krajin -->
                </fo:flow>
            </fo:page-sequence>

            <!-- Obsah jednotlivých krajín -->
            <fo:page-sequence master-reference="A4">
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block border-bottom-style="solid" text-align="center">
				    	Semestrálna práca na predmet BI-XML v LS 2018/2019, jantopat@fit.cvut.cz
				    </fo:block>
		        </fo:static-content>

                <fo:static-content flow-name="xsl-region-after">
                    <fo:block text-align="center">
                        <fo:page-number/>
                    </fo:block>
                </fo:static-content>

                <fo:flow flow-name="xsl-region-body">
                    <xsl:apply-templates mode="pages"/>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template match="//country" mode="content"> <!-- zoznam krajin -->
        <fo:block font-size="14pt" font-weight="bold" space-before="0.5cm">
            <fo:basic-link internal-destination="{@name}"
               text-decoration="underline"><xsl:value-of select="@name"/></fo:basic-link>
        </fo:block>
    </xsl:template>


    <xsl:template match="//country" mode="pages">
        <fo:block font-size="22pt" font-weight="bold" id="{@name}" page-break-before="always">
            <xsl:value-of select="@name"/>
        </fo:block>
        <fo:block font-size="22pt" font-weight="bold">
            <xsl:apply-templates mode="content"/> <!-- vygeneruje obsah krajiny -->
        </fo:block>
		<fo:block page-break-before="always" />
        <xsl:apply-templates/> <!-- data krajiny -->
    </xsl:template>

    <xsl:template match="//section" mode="content">
        <fo:block font-size="12pt" font-weight="bold" space-before="0.5cm" >
            <fo:basic-link internal-destination="{../@name}-{@name}"
               text-decoration="underline"><xsl:value-of select="@name"/></fo:basic-link>
        </fo:block>
    </xsl:template>

	<!-- s obrázkami -->
    <xsl:template match="//section[(@src)]">
        <fo:block font-size="18pt" font-weight="bold" space-before="30pt" id="{../@name}-{@name}">
            <xsl:value-of select="@name"/>
        </fo:block>
        <fo:block>
            <fo:external-graphic src="url('../data/{@src}')" content-height="10em" content-width="10em"/>
        </fo:block>
    </xsl:template>

    <!-- bez obrázkov -->
    <xsl:template match="//section[not(@src)]">
        <fo:block font-size="18pt" font-weight="bold" space-before="30pt" id="{../@name}-{@name}">
            <xsl:value-of select="@name"/>
        </fo:block>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="//text">
        <fo:block font-size="14pt" font-weight="bold" space-before="30pt">
            <xsl:value-of select="@name"/>
        </fo:block>
        <fo:block text-indent="1cm">
            <xsl:value-of select="."/>
        </fo:block>
    </xsl:template>

</xsl:stylesheet>
