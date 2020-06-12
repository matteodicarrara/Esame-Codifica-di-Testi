<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:tei="http://www.tei-c.org/ns/1.0"
xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <script src="lettera.js"/>
                <script src="https://code.jquery.com/jquery-3.4.0.min.js" type="text/javascript"></script>
                <script>
                    $(document).ready(function(){
                        $("div#dS").find("p").hide();
                        $("#descFis").click(function(){
                           $(this).next().toggle();
                        });
                       
                    });
                </script>

                <link href="foglioStile.css" rel="stylesheet" type="text/css"/>
                <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet"/> 
                <title>Lettera di Bellini a Pietro Ponzani</title>
            </head>
            <body>
                <header>
                    <span id = "tit">Lettera di Bellini a Pietro Ponzani</span>
                </header>
                <div id = "InfoLettera">
                    <xsl:apply-templates select = "//tei:teiHeader"/>
                    <xsl:apply-templates select = "//tei:date[@xml:id='datPrinc']"/>
                    <xsl:apply-templates select = "//tei:msItem//tei:title//tei:placeName"/>
                    <xsl:apply-templates select = "//tei:msItem//tei:textLang"/>
                    <xsl:apply-templates select = "//tei:p[@xml:id = 'descLet']"/>
                </div>
                
                <img id = "bel" src = "bellini.png"/>

                <div id = "corpo">
                    <div id = "imgLettera" >
                        <input type="button" value="Indietro" id="indietro"/>  
                        <img id="LL1.29_000"/>  
                        <!--Mappe interattive-->
                        <map id = 'm1' name = "LL1.29_0001.png">
                            <xsl:for-each select = "//tei:surface[@n='1']//tei:zone">
                                <area shape = "rect">
                                    <xsl:attribute name = "href">
                                        #<xsl:value-of select = "current()/@xml:id"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="coords">
                                        <xsl:value-of select="concat(@ulx, ',', @uly, ',', @lrx, ',', @lry)"/>
                                    </xsl:attribute>
                                </area>
                            </xsl:for-each>
                        </map>
                        <map id = 'm2' name = "LL1.29_0002.png">
                            <xsl:for-each select = "//tei:surface[@n='2']//tei:zone">
                                <area shape = "rect">
                                    <xsl:attribute name = "href">
                                        #<xsl:value-of select = "current()/@xml:id"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="coords">
                                        <xsl:value-of select="concat(@ulx, ',', @uly, ',', @lrx, ',', @lry)"/>
                                    </xsl:attribute>
                                </area>
                            </xsl:for-each>
                        </map>
                        <map id = 'm3'  name = "LL1.29_0003.png">
                            <xsl:for-each select = "//tei:surface[@n='3']//tei:zone">
                                <area shape = "rect">
                                    <xsl:attribute name = "href">
                                        #<xsl:value-of select = "current()/@xml:id"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="coords">
                                        <xsl:value-of select="concat(@ulx, ',', @uly, ',', @lrx, ',', @lry)"/>
                                    </xsl:attribute>
                                </area>
                            </xsl:for-each>
                        </map>
                        <map id = 'm4'  name = "LL1.29_0004.png">
                             <xsl:for-each select = "//tei:surface[@n='4']//tei:zone">
                                <area shape = "rect">
                                    <xsl:attribute name = "href">
                                        #<xsl:value-of select = "current()/@xml:id"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="coords">
                                        <xsl:value-of select="concat(@ulx, ',', @uly, ',', @lrx, ',', @lry)"/>
                                    </xsl:attribute>
                                </area>
                            </xsl:for-each>
                        </map>
                        <input type="button" value="Avanti" id="avanti"/> 
                    </div>

                    <div id = "testoLettera">
                       <xsl:apply-templates select = "//tei:ab[@n = 'ab_01']"/>
                        <xsl:apply-templates select = "//tei:salute[@n = 'ab_02']"/>
                        <xsl:apply-templates select = "//tei:ab[@n = 'ab_03']"/>
                        <xsl:apply-templates select = "//tei:ab[@n = 'ab_04']"/>
                        <xsl:apply-templates select = "//tei:ab[@n = 'ab_05']"/>
                        <xsl:apply-templates select = "//tei:ab[@n = 'ab_06']"/>
                    </div>  
                </div>

                <footer>
                    <xsl:apply-templates select = "//tei:titleStmt//tei:respStmt"/>
                    
                     <xsl:apply-templates select = "//tei:editionStmt//tei:edition"/>
                   
                     <xsl:apply-templates select = "//tei:editionStmt//tei:respStmt"/>


                </footer>
            </body>
        </html>
    </xsl:template>

    <!--Template per informazioni generali sulla lettera-->
    <xsl:template match = "tei:teiHeader">
        <h2>Informazioni lettera</h2>
    </xsl:template>

    <xsl:template match = "tei:date">
        <xsl:choose>
            <xsl:when test = "@when ='1835-05-30'">
                <div class = "int"><h3 class = "bottone">Data</h3>
                <p><xsl:apply-templates/></p></div>
            </xsl:when>
            <xsl:otherwise>
                  <p><xsl:apply-templates/> </p>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match = "tei:teiHeader//tei:placeName">
       <div class = "int"><h3 class = "bottone">Luogo</h3>
          <p><xsl:apply-templates/></p></div>
    </xsl:template>

    <xsl:template match = "tei:textLang">
        <div class = "int"><h3 class = "bottone">Lingua</h3>
        <p><xsl:apply-templates/></p></div>
    </xsl:template>

    <xsl:template match = "tei:p">
        <xsl:choose>
            <xsl:when test = "@xml:id='descLet'">
                <div class = "int" id = "dS"><h3 id = "descFis">Descrizione fisica</h3>
                <p><xsl:apply-templates/></p></div>
            </xsl:when>
            <xsl:otherwise>
                 <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!--Template per corpo lettera-->
    <xsl:template match = "tei:ab">
        <xsl:choose>
                <xsl:when test = "@n = 'ab_01'">
                <h2>Testo codificato</h2>
                <div id = "01" class = "p1"> 
                   <p><xsl:apply-templates/></p>
                </div>
                </xsl:when>
                <xsl:when test = "@n = 'ab_03'">
                <div id = "03" class = "p1"> <p><xsl:apply-templates/></p></div>
                </xsl:when>
                <xsl:when test = "@n = 'ab_04'">
                <div id = "04" class = "p2"> <p><xsl:apply-templates/></p></div>
                </xsl:when>
                <xsl:when test = "@n = 'ab_05'">
                <div id = "05" class = "p3"> <p><xsl:apply-templates/></p></div>
                </xsl:when>
                <xsl:when test = "@n = 'ab_06'">
                <div id = "06" class = "p4"> <p><xsl:apply-templates/></p></div>
                </xsl:when>
            </xsl:choose>
    </xsl:template>

   <xsl:template match = "tei:lb">
        <xsl:if test="@rend='double stroke'">
            <span class="aCapo">
                <xsl:text>=</xsl:text>
            </span>
        </xsl:if>
        <xsl:choose>
            <xsl:when test = "@n ='01'or @n='5' or @n='4' or @n='3' or @n='2' or @n='1'">
            </xsl:when>
            <xsl:otherwise>
            <br/>
            </xsl:otherwise>
        </xsl:choose>
        <span>
            <xsl:attribute name ="id">
                <xsl:value-of select = "translate(current()/@facs, '#','')"/>
            </xsl:attribute>
            <xsl:choose>
                <xsl:when test = "@n='2' or @n='5'">
                    <br/>
                    <xsl:value-of select = "@n"/>
                </xsl:when>
                <xsl:when test = "@n='3'">
                    <xsl:value-of select = "@n"/>
                </xsl:when>
                <xsl:otherwise>
                      <xsl:value-of select = "@n"/>
                </xsl:otherwise>
            </xsl:choose>
        </span>
    </xsl:template>

    <xsl:template match = "tei:salute[@n='ab_02']">
        <div class = "p1">
            <xsl:attribute name = "id">
                <xsl:value-of select = "current()/@n"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match = "tei:hi">
        <xsl:choose>
            <xsl:when test = "@xml:id = 'ponzani'">
                <span class = "left" id = 'ponzani'><xsl:apply-templates/></span>
             </xsl:when>
            <xsl:when test = "@rend = 'align(left)'">
                <span class = "left"><xsl:apply-templates/></span>
            </xsl:when>
            <xsl:when test = "@rend = 'align(right)'">
                <span class = "right"><xsl:apply-templates/></span>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match = "tei:expan">
        <a hidden = 'hidden'>
            <xsl:apply-templates/>
        </a>
    </xsl:template>

     <xsl:template match = "tei:corr">
        <a hidden = "hidden">
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    
    <xsl:template match = "//tei:ab[@n='ab_05']//tei:stamp">
        <span>
            <xsl:attribute name ="id">
                <xsl:value-of select = "translate(current()/@facs, '#','')"/>
            </xsl:attribute>
            In alto a sinistra è presente un timbro non leggibile, 
            ma probabilmente riferibile all'arrivo della lettera.
        </span>
        <xsl:apply-templates/> 
    </xsl:template>

    <xsl:template match = "tei:ab[@n='ab_06']//tei:add">
        <span>
            <xsl:attribute name ="id">
                <xsl:value-of select = "translate(current()/@facs, '#','')"/>
            </xsl:attribute>
        Annotazione numerica:
        </span>
        <xsl:apply-templates/> 
         <br/>
    </xsl:template>

    <xsl:template match = "tei:unclear">
          <span>
            <xsl:attribute name ="id">
                <xsl:value-of select = "translate(current()/@facs, '#','')"/>
            </xsl:attribute>
            Scritta non decifrabile, ma riferibile ad una seconda mano.
        </span>
        <xsl:apply-templates/> 
    </xsl:template>

    <xsl:template match = "tei:ab[@n='ab_03']//tei:add">
        <span class = "annot">
            <xsl:attribute name ="id">
                <xsl:value-of select = "translate(current()/@facs, '#','')"/>
            </xsl:attribute>
            [Annotazione difficilmente leggibile al margine sinistro.]
        </span>
    </xsl:template>
    <xsl:template match = "tei:ab[@n='ab_03']//tei:unclear">
        <span class = "annot">
            <xsl:attribute name ="id">
                <xsl:value-of select = "translate(current()/@facs, '#','')"/>
            </xsl:attribute>
       [Segno grafico non decifrabile, ma riconducibile alla mano dell'autore.]
        </span>
    </xsl:template>

    <!--Template per crediti-->
    <xsl:template match = "tei:resp">
    <br/>
        <b>
            <xsl:apply-templates/>:
        </b>
    </xsl:template>
    <xsl:template match = "tei:edition">
        <br/>
        <span id = "ed">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match = "tei:edition//tei:date">
        <span id = "datEd">
            <xsl:text>: </xsl:text>
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match = "tei:edition//tei:name">
        <xsl:choose>
            <xsl:when test = "@ref ='DS'">
                <br/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>


</xsl:stylesheet>