<xsl:stylesheet version='2.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<!-- INDEX -->
	
	<xsl:template match="/">
        <xsl:result-document href="output/index.html">
            <html>
                <head>
                    <title>Semestrálna práca</title>
                    <link rel="stylesheet" type="text/css" media="screen" href="../data/style.css" />
                </head>
                <body>
                    <header>
                        <h1>World Factbook</h1>
                    </header>
                    <main>
                        <h3> Semestrálna práca na predmet BI-XML v LS 2018/2019 </h3>
						<h2> Obsah </h2>
                        <ul>
                            <xsl:apply-templates mode="index"/>
                        </ul>
                    </main>
                    <footer>
                        jantopat@fit.cvut.cz
                    </footer>
                </body>
            </html>
        </xsl:result-document>
        <xsl:apply-templates mode="pages"/>
    </xsl:template>

    <xsl:template match="//country" mode="index">
        <li>
            <a href="{@name}.html">
                <xsl:value-of select="@name"/>
            </a>
        </li>
    </xsl:template>

	<!-- PAGES -->

    <xsl:template match="//country" mode="pages">
        <xsl:result-document href="output/{@name}.html">
            <html>
                <head>
                    <title><xsl:value-of select="@name"/></title>
                    <link rel="stylesheet" type="text/css" media="screen" href="../data/style.css" />
                </head>
                <body>
                    <header>
                        <a href="index.html">Hlavná stránka</a>
                    </header>
                    <main>
                        <h2>
                            <xsl:value-of select="@name"/>
                        </h2>
                        <section class="menu">
                            <ul>
                                <xsl:apply-templates mode="menu"/>
                            </ul>
                        </section>
                        <xsl:apply-templates/>
                    </main>
                    <footer>
                        jantopat@fit.cvut.cz
                    </footer>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>


    <xsl:template match="//section[not(@src)]" mode="menu">
        <li>
            <a href="#{@name}">
                <xsl:value-of select="@name"/>
            </a>
        </li>
    </xsl:template>

    <xsl:template match="//section[not(@src)]">
        <section>
            <h3 id="{@name}">
                <xsl:value-of select="@name"/>
            </h3>
            <xsl:apply-templates/>
        </section>
    </xsl:template>

    <xsl:template match="//section[@src]">
        <img src="../data/{@src}"/>
    </xsl:template>


    <xsl:template match="//text">
        <p>
           <xsl:value-of select="."/>
        </p>
    </xsl:template>

</xsl:stylesheet>
