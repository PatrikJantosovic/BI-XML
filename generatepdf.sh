#!/bin/bash
java -jar src/saxon.jar -o output/countries.fo output/countries.xml src/ToPDF.xsl
fop -fo output/countries.fo -pdf output/countries.pdf 2>/dev/null
echo 'Vygenerovaný pdf súbor v zložke output'