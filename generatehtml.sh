#!/bin/bash
#java -jar ~/Saxon/saxon9he.jar countries.xml ./transformation/transformIndex.xsl
java -jar src/saxon.jar output/countries.xml src/ToHtml.xsl 1>/dev/null