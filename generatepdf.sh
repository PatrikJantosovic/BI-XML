#!/bin/bash
java -jar src/saxon.jar output/countries.xml src/ToPDF.xsl > output/countries.fo 
fop -fo output/countries.fo -pdf output/countries.pdf 2>/dev/null
echo 'Vygenerovaný pdf súbor v zložke output'