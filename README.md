# Semestrálna práca na BI-XML
- Semestrálna práca na predmet BI-XML na FIT ČVUT, Letný semester 2018/2019
- Autor: Patrik Jantošovič
## Požiadavky
- xmllint
- fop
- jing
- saxon - .jar súbor priložený v adresári ./src
# Obsah projektu
- data
  - zdrojové XML súbory
  - Krajiny: Guernsey, Guinea, Guinea-Bissau, Guyana
  - Použitý parser: https://gitlab.fit.cvut.cz/dvorat19/bi-xml-survivors/blob/master/parser/parser.jar
  - Zdroj dát: https://www.cia.gov/library/publications/resources/the-world-factbook/
- output
  - Do tohoto odresára sa generujú všetky výstupy
- src
  - Obsahuje xsl soubory na transformácie
  - Obsahuje DTD a RelaxNG súbory na validácie
  - ToOne.xml definuje zlúčenie XML zdrojovd do jednoho súboru
- zadanie
  - BI-XML-PROJEKT-INSTRUKCE.txt
  - BI-XML-PROJEKT-PREZENTACE.txt

# Príkazy
- Predpokladá sa nainštalovaný software zo sekcie "Požiadavky"
- Pre všetky príkazy sú vytvorené bash scripty v koreňovom adresári
## 1. Zlúčenie do 1 XML
```
./merge.sh
```

## 2. Validácia DTD
```
./validatedtd.sh
```

## 3. Validácia RelaxNG
```
./validaterelaxng.sh
```

## 4. Vygenerovánie HTML
```
./generatehtml.sh
```

## 5. Vygenerovánie PDF
```
./generatepdf.sh
```
