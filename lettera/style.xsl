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
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                <script>
                    $(document).ready(function(){
                        $("div#dS").find("p").hide();
                        $("#descFis").click(function(){
                           $(this).next().toggle();
                        });
                        $("div#bib").find("p").hide();
                        $("#sarza").click(function(){
                            $("#pBib").toggle();
                        });
                    
                        $(".orig, .abbr").click(function(){
                            $(this).hide();
                            $(this).next().show();
                        });
                         $(".reg, .expan").click(function(){
                            $(this).hide();
                            $(this).prev().show();
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
                <div id = "leg">
                        <h2 id = "TitLeg">Legenda</h2>
                        <p id = "blu">LUOGHI</p>
                        <p id = "arancio">PERSONE</p>
                        <p id = "maroon">CORREZIONE</p>
                        <p id = "verde">ABBREVIAZIONI</p>
                        <p id = "rosso">EDIFICI</p>
                </div>

                <div id = "corpo">
                    
                    <div id = "imgLettera" >
                        <img src = "sinistra.png" id = "indietro"/>
                        <!--<img id="LL1.29_000"/>-->  
                        <!--Mappe interattive-->
                         
                        <div id = "mappa1" class = "mappe" style = "display:none">
                            <img src = "LL1.29_0001.png" id = "f1" />
                            <xsl:for-each select = "//tei:surface[@n='1']//tei:zone">
                                <xsl:variable name = "x">
                                    <xsl:value-of select = "@ulx"/>
                                </xsl:variable>
                                <xsl:variable name = "wi">
                                    <xsl:value-of select = "translate(..//tei:graphic/@width,'px','')"/>
                                </xsl:variable>
                                 <xsl:variable name = "he">
                                    <xsl:value-of select = "translate(..//tei:graphic/@height,'px','')"/>
                                </xsl:variable>
                                <xsl:variable name = "y">
                                    <xsl:value-of select = "@uly"/>
                                </xsl:variable>
                                <xsl:variable name = "ly">
                                    <xsl:value-of select = "@lry"/>
                                </xsl:variable>
                                 <xsl:variable name = "lx">
                                    <xsl:value-of select = "@lrx"/>
                                </xsl:variable>
                                <a class = "zona">
                                    <xsl:attribute name = "href">
                                        #<xsl:value-of select = "@xml:id"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="style">
                                        position:absolute; left:<xsl:value-of select ="$x * 100 div $wi"/>%;
                                        top:<xsl:value-of select ="$y * 100 div $he"/>%;
                                        width:<xsl:value-of select = "($lx - $x) * 100 div $wi"/>%;
                                        height:<xsl:value-of select = "($ly - $y) * 100 div $he"/>%;
                                    </xsl:attribute>
                                </a>
                            </xsl:for-each>
                        </div>

                        <div id = "mappa2" class = "mappe" style = "display:none">
                            <img src = "LL1.29_0002.png" id = "f2" />
                            <xsl:for-each select = "//tei:surface[@n='2']//tei:zone">
                                <xsl:variable name = "x">
                                    <xsl:value-of select = "@ulx"/>
                                </xsl:variable>
                                <xsl:variable name = "wi">
                                    <xsl:value-of select = "translate(..//tei:graphic/@width,'px','')"/>
                                </xsl:variable>
                                 <xsl:variable name = "he">
                                    <xsl:value-of select = "translate(..//tei:graphic/@height,'px','')"/>
                                </xsl:variable>
                                <xsl:variable name = "y">
                                    <xsl:value-of select = "@uly"/>
                                </xsl:variable>
                                <xsl:variable name = "ly">
                                    <xsl:value-of select = "@lry"/>
                                </xsl:variable>
                                 <xsl:variable name = "lx">
                                    <xsl:value-of select = "@lrx"/>
                                </xsl:variable>
                                <a class = "zona">
                                    <xsl:attribute name = "href">
                                        #<xsl:value-of select = "@xml:id"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="style">
                                        position:absolute; left:<xsl:value-of select ="$x * 100 div $wi"/>%;
                                        top:<xsl:value-of select ="$y * 100 div $he"/>%;
                                        width:<xsl:value-of select = "($lx - $x) * 100 div $wi"/>%;
                                        height:<xsl:value-of select = "($ly - $y) * 100 div $he"/>%;
                                    </xsl:attribute>
                                </a>
                            </xsl:for-each>
                        </div>   

                        <div id = "mappa3"  class = "mappe" style = "display:none">
                            <img src = "LL1.29_0003.png" id = "f3" />
                            <xsl:for-each select = "//tei:surface[@n='3']//tei:zone">
                                <xsl:variable name = "x">
                                    <xsl:value-of select = "@ulx"/>
                                </xsl:variable>
                                <xsl:variable name = "wi">
                                    <xsl:value-of select = "translate(..//tei:graphic/@width,'px','')"/>
                                </xsl:variable>
                                 <xsl:variable name = "he">
                                    <xsl:value-of select = "translate(..//tei:graphic/@height,'px','')"/>
                                </xsl:variable>
                                <xsl:variable name = "y">
                                    <xsl:value-of select = "@uly"/>
                                </xsl:variable>
                                <xsl:variable name = "ly">
                                    <xsl:value-of select = "@lry"/>
                                </xsl:variable>
                                 <xsl:variable name = "lx">
                                    <xsl:value-of select = "@lrx"/>
                                </xsl:variable>
                                <a class = "zona">
                                    <xsl:attribute name = "href">
                                        #<xsl:value-of select = "@xml:id"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="style">
                                        position:absolute; left:<xsl:value-of select ="$x * 100 div $wi"/>%;
                                        top:<xsl:value-of select ="$y * 100 div $he"/>%;
                                        width:<xsl:value-of select = "($lx - $x) * 100 div $wi"/>%;
                                        height:<xsl:value-of select = "($ly - $y) * 100 div $he"/>%;
                                    </xsl:attribute>
                                </a>
                            </xsl:for-each>
                        </div>

                        <div id = "mappa4" class = "mappe" style = "display:none">
                            <img src = "LL1.29_0004.png" id = "f4" />
                            <xsl:for-each select = "//tei:surface[@n='4']//tei:zone">
                                <xsl:variable name = "x">
                                    <xsl:value-of select = "@ulx"/>
                                </xsl:variable>
                                <xsl:variable name = "wi">
                                    <xsl:value-of select = "translate(..//tei:graphic/@width,'px','')"/>
                                </xsl:variable>
                                 <xsl:variable name = "he">
                                    <xsl:value-of select = "translate(..//tei:graphic/@height,'px','')"/>
                                </xsl:variable>
                                <xsl:variable name = "y">
                                    <xsl:value-of select = "@uly"/>
                                </xsl:variable>
                                <xsl:variable name = "ly">
                                    <xsl:value-of select = "@lry"/>
                                </xsl:variable>
                                 <xsl:variable name = "lx">
                                    <xsl:value-of select = "@lrx"/>
                                </xsl:variable>
                                <a class = "zona">
                                    <xsl:attribute name = "href">
                                        #<xsl:value-of select = "@xml:id"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="style">
                                        position:absolute; left:<xsl:value-of select ="$x * 100 div $wi"/>%;
                                        top:<xsl:value-of select ="$y * 100 div $he"/>%;
                                        width:<xsl:value-of select = "($lx - $x) * 100 div $wi"/>%;
                                        height:<xsl:value-of select = "($ly - $y) * 100 div $he"/>%;
                                    </xsl:attribute>
                                </a>
                            </xsl:for-each>
                        </div>             
                        <img src = "destra.png" id = "avanti"/>       
                    </div>

                    <div id = "testoLettera">
                       <xsl:apply-templates select = "//tei:ab[@n = 'ab_01']"/>
                        <xsl:apply-templates select = "//tei:salute[@n = 'ab_02']"/>
                        <xsl:apply-templates select = "//tei:ab[@n = 'ab_03']"/>
                        <xsl:apply-templates select = "//tei:ab[@n = 'ab_04']"/>
                        <xsl:apply-templates select = "//tei:ab[@n = 'ab_05']"/>
                        <xsl:apply-templates select = "//tei:ab[@n = 'ab_06']"/>
                        <a href = "#leg" id = "legenda">Legenda</a>
                    </div>  

                    <div id = "persone">
                        <xsl:apply-templates select= "//tei:listPerson"/>
                    </div>
                    <div id = "luoghi">
                        <xsl:apply-templates select = "//tei:listPlace"/>
                    </div>
                    <div id = "edifici">
                        <xsl:apply-templates select = "//tei:listOrg"/>
                    </div>

                    <div id = "bib">
                        <xsl:apply-templates select = "//tei:listBibl"/>
                    </div>

                </div>

                <footer>
                    <xsl:apply-templates select = "//tei:titleStmt//tei:respStmt"/>
                    <xsl:apply-templates select = "//tei:editionStmt//tei:edition"/>
                    <xsl:apply-templates select = "//tei:editionStmt//tei:respStmt"/><br/>
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

    <xsl:template match = "tei:teiHeader//tei:msContents//tei:placeName">
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
    <xsl:template match = "//tei:listPerson">
        <h2>Persone</h2>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match = "//tei:sourceDesc//tei:person">
        <div>
            <xsl:attribute name = "id">
                <xsl:value-of select = "current()/@xml:id"/>
            </xsl:attribute>
            <xsl:attribute name = "class">
                <xsl:text>persona</xsl:text>
            </xsl:attribute>
            <p>
                <b><xsl:value-of select = "current()//tei:forename"/> 
                <xsl:text> </xsl:text>
                <xsl:value-of select = "current()//tei:surname"/></b> <br/>
                <xsl:choose>
                    <xsl:when test = "@xml:id = 'VB'">
                        Alias: <xsl:value-of select = "current()//tei:addName"/> <br/>
                        Onoreficenze: <xsl:value-of select = "current()//tei:roleName"/><br/>
                        Data di nascita: <xsl:value-of select = "current()//tei:birth//tei:date"/> 
                        Luogo: <xsl:value-of select = "current()//tei:birth//tei:placeName//tei:settlement[@type='municipality']"/>
                        (<xsl:value-of select = "current()//tei:birth//tei:placeName//tei:settlement[@type='provincia']"/>, <xsl:value-of select = "current()//tei:birth//tei:placeName//tei:country"/>).
                        <br/>
                        Data di morte: <xsl:value-of select = "current()//tei:death//tei:date"/> 
                        Luogo: <xsl:value-of select = "current()//tei:death//tei:placeName//tei:settlement[@type='municipality']"/>
                        (<xsl:value-of select = "current()//tei:death//tei:placeName//tei:settlement[@type='department']"/>, <xsl:value-of select = "current()//tei:birth//tei:placeName//tei:country"/>).
                    </xsl:when>
                    <xsl:otherwise>
                        Data di nascita: <xsl:value-of select = "current()//tei:birth//tei:date"/>
                        Data di morte: <xsl:value-of select = "current()//tei:death//tei:date"/> 
                    </xsl:otherwise>
                </xsl:choose>
            </p>
        </div> 
    </xsl:template>

    <xsl:template match = "tei:listPlace">
        <h2>Luoghi</h2>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match = "tei:listPlace//tei:place">
        <div>
            <xsl:attribute name = "id">
                <xsl:value-of select = "current()/@xml:id"/>
            </xsl:attribute>
             <xsl:attribute name = "class">
                <xsl:text>luogo</xsl:text>
            </xsl:attribute>
            <xsl:choose>
                <xsl:when test = "@xml:id = 'NSS'">
                    <b><xsl:value-of select = "current()//tei:placeName"/></b>, <xsl:value-of select = "current()//tei:district"/>, <xsl:value-of select = "current()//tei:settlement"/>, <xsl:value-of select = "current()//tei:country"/>.  <br/>
                </xsl:when>
                <xsl:when test = "@xml:id = 'Put'">
                    <b><xsl:value-of select = "current()//tei:placeName"/></b>, <xsl:value-of select = "current()//tei:district"/>, <xsl:value-of select = "current()//tei:settlement"/>, <xsl:value-of select = "current()//tei:country"/>. 
                    <b>Descrizione</b>:<xsl:text> </xsl:text><xsl:value-of select = "current()//tei:note//tei:p"/>.<br/>
                </xsl:when>
                <xsl:otherwise>
                   <b> <xsl:value-of select = "current()//tei:placeName"/></b>, <xsl:value-of select = "current()//tei:country"/><br/>
                </xsl:otherwise>
            </xsl:choose>
        </div>
    </xsl:template>
    
    <xsl:template match = "tei:listOrg">
        <h2>Edifici</h2>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match = "tei:listOrg//tei:org">
        <div>
            <xsl:attribute name = "id">
                <xsl:value-of select = "current()/@xml:id"/>
            </xsl:attribute>
             <xsl:attribute name = "class">
                <xsl:text>edificio</xsl:text>
            </xsl:attribute>
            <b><xsl:value-of select = "current()//tei:orgName"/></b>, <xsl:value-of select = "current()//tei:placeName"/>.
        </div>
    </xsl:template>

    <xsl:template match = "tei:ab">
        <xsl:choose>
                <xsl:when test = "@n = 'ab_01'">
                <h2>Codifica</h2>
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
    
    <xsl:template match = "tei:s">
        <span>
            <xsl:attribute name = "id">
                <xsl:value-of select = "current()/@n"/>
            </xsl:attribute>
            <xsl:attribute name = "class">
                sentence
            </xsl:attribute>
            <xsl:apply-templates/>
        </span>
        <xsl:choose>  
            <xsl:when test = "@n='s_01'">
                <a> 
                    <xsl:attribute name = "class">
                        frase
                    </xsl:attribute>
                    <xsl:attribute name = "href">
                        #<xsl:value-of select = "current()/@n"/>
                    </xsl:attribute>
                    1: Luogo
                </a>   
            </xsl:when>
            <xsl:when test = "@n='s_02a'">
                <a> 
                    <xsl:attribute name = "class">
                        frase
                    </xsl:attribute>
                    <xsl:attribute name = "href">
                        #<xsl:value-of select = "current()/@n"/>
                    </xsl:attribute>
                    1: Saluto
                </a>   
            </xsl:when>
            <xsl:when test = "@n='s_02b'">
                <a> 
                    <xsl:attribute name = "class">
                        frase
                    </xsl:attribute>
                    <xsl:attribute name = "href">
                        #<xsl:value-of select = "current()/@n"/>
                    </xsl:attribute>
                    Frase 2
                </a>   
            </xsl:when>
            <xsl:when test = "@n='s_05a'">
                <a> 
                    <xsl:attribute name = "class">
                        frase
                    </xsl:attribute>
                    <xsl:attribute name = "href">
                        #<xsl:value-of select = "current()/@n"/>
                    </xsl:attribute>
                    Frase 5
                </a>   
            </xsl:when>
             <xsl:when test = "@n='s_05b'">
                <a> 
                    <xsl:attribute name = "class">
                        frase
                    </xsl:attribute>
                    <xsl:attribute name = "href">
                        #<xsl:value-of select = "current()/@n"/>
                    </xsl:attribute>
                    Frase 5
                </a>   
            </xsl:when>
            <xsl:otherwise>
                <a> 
                    <xsl:attribute name = "class">
                        frase
                    </xsl:attribute>
                    <xsl:attribute name = "href">
                        #<xsl:value-of select = "current()/@n"/>
                    </xsl:attribute>
                    Frase <xsl:value-of select = "translate(current()/@n,'s_02','')"/>
                </a>   
            </xsl:otherwise>
        </xsl:choose> 
    </xsl:template>

    <xsl:template match = "tei:lb">
        <xsl:if test="@rend='double stroke'">
            <span class="aCapo">
                <xsl:text>=</xsl:text>
            </span>
        </xsl:if>
        <xsl:choose>
            <xsl:when test = "@n ='01' or @n='4' or @n='3' or @n='1'">
            </xsl:when>
            <xsl:otherwise>
            <br/>
            </xsl:otherwise>
        </xsl:choose>
        <span>
            <xsl:attribute name = "class">
                <xsl:text>riga</xsl:text>
            </xsl:attribute>
            <xsl:choose>
                <xsl:when test = "@n='24'">
                    <xsl:attribute name ="id">
                        <xsl:value-of select = "translate(current()/@facs, '#','')"/>
                    </xsl:attribute>
                    <xsl:attribute name = "class">
                        riga24
                    </xsl:attribute>
                </xsl:when>
                <xsl:otherwise> 
                    <xsl:attribute name ="id">
                        <xsl:value-of select = "translate(current()/@facs, '#','')"/>
                    </xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
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

    <xsl:template match = "tei:abbr">
        <span class = 'abbr'>
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match = "tei:expan">
        <span class = "expan" hidden = 'hidden'>
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match = "tei:orig">
        <span class = "orig">
        <xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match = "tei:reg">
        <span class = "reg" hidden = "hidden">
            <xsl:apply-templates/>
        </span>
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
            [Annotazione difficilmente leggibile.]
        </span>
    </xsl:template>

    <xsl:template match = "tei:ab[@n='ab_03']//tei:unclear">
        <span class = "annot">
            <xsl:attribute name ="id">
                <xsl:value-of select = "translate(current()/@facs, '#','')"/>
            </xsl:attribute><br/>
            [Segno grafico non decifrabile].
        </span>
    </xsl:template>

    <xsl:template match = "tei:placeName">
        <a class = "place">
        <xsl:attribute name = "href">
            <xsl:value-of select = "@ref"/>
        </xsl:attribute>
        <xsl:apply-templates/></a>
    </xsl:template>

    <xsl:template match = "tei:persName">
        <a class = "person"> <xsl:attribute name = "href">
            <xsl:value-of select = "@ref"/>
        </xsl:attribute><xsl:apply-templates/></a>
    </xsl:template>

    <xsl:template match = "tei:orgName">
        <a class = "org"> <xsl:attribute name = "href">
            <xsl:value-of select = "@ref"/>
        </xsl:attribute><xsl:apply-templates/></a>
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

    <xsl:template match = "tei:listBibl">
        <h2 id = "sarza">Bibliografia</h2> 
        <p id = "pBib"><xsl:apply-templates/></p>
    </xsl:template>

    <xsl:template match = "tei:bibl">
        <xsl:choose>
            <xsl:when test = "@xml:id='Seminara2001'">
                <b>Titolo: </b><xsl:value-of select = "current()//tei:title[@level='a']"/>.
                <b> Sottotitolo: </b><xsl:value-of select = "current()//tei:title[@level='m']"/>.
                <b> Volume: </b><xsl:value-of select = "current()//tei:biblScope[@unit='volume']"/>.
                <b> Pagine: </b><xsl:value-of select = "current()//tei:biblScope[@unit='page']"/>.
                <b> Data: </b><xsl:value-of select = "current()//tei:date"/>.
            </xsl:when>
            <xsl:otherwise>
                <b>Autore: </b><xsl:value-of select = "current()//tei:author"/>
                <b> Data: </b><xsl:value-of select = "current()//tei:date"/>
                <b> Pagine: </b><xsl:value-of select = "current()//tei:citedRange"/><br/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>