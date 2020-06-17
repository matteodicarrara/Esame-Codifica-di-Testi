function gestoreClickAvanti () {   
    try {             
        cambiaFoto(+1);       
    } catch ( e ) {      
        alert("gestoreClickAvanti " + e);   
    }
}
    
function gestoreClickIndietro () {  
     try {             
            cambiaFoto(-1);         
        } catch ( e ) {      
            alert("gestoreClickIndietro " + e);   
        }
    }

function cambiaFoto (x) {   
    indiceFoto += x;   
    if (indiceFoto == numeroFoto) {      
        indiceFoto = 0;   
    } if (indiceFoto < 0) {      
        indiceFoto = numeroFoto -1;   
    }  
    switch(indiceFoto){
        case 0:
            for (var i = 0;i<page1.length;i++){
                page1[i].removeAttribute("hidden");
            }
            for (var i = 0;i<page2.length;i++){
                page2[i].setAttribute("hidden","hidden");
            }
            for (var i = 0;i<page4.length;i++){
                page4[i].setAttribute("hidden","hidden");
            }
            map4.setAttribute("style","display:none");
            map2.setAttribute("style","display:none");
            map1.removeAttribute("style");
        break;
        case 1:
            for (var i = 0;i<page2.length;i++){
                page2[i].removeAttribute("hidden");
            }
            for (var i = 0;i<page1.length;i++){
                page1[i].setAttribute("hidden","hidden");
            }
            for (var i = 0;i<page3.length;i++){
                page3[i].setAttribute("hidden","hidden");
            }
            map1.setAttribute("style","display:none");
            map2.removeAttribute("style");
            map3.setAttribute("style","display:none");
        break;
        case 2:
            for (var i = 0;i<page3.length;i++){
                page3[i].removeAttribute("hidden");
            }
            for (var i = 0;i<page2.length;i++){
                page2[i].setAttribute("hidden","hidden");
            }  
            for (var i = 0;i<page4.length;i++){
                page4[i].setAttribute("hidden","hidden");
            } 
            map2.setAttribute("style","display:none");
            map3.removeAttribute("style");
            map4.setAttribute("style","display:none");
        break;
        case 3:
            for (var i = 0;i<page4.length;i++){
                page4[i].removeAttribute("hidden");
            }
            for (var i = 0;i<page3.length;i++){
                page3[i].setAttribute("hidden","hidden");
            } 
            for (var i = 0;i<page1.length;i++){
                page1[i].setAttribute("hidden","hidden");
            }
            map3.setAttribute("style","display:none");
            map1.setAttribute("style","display:none");
            map4.removeAttribute("style");
        break;
    }
}


var indiceFoto;
var numeroFoto;
var automatico;
var nodoAvanti;
var nodoIndietro;
var nodoStartStop;
var nodoFoto;
var page1;
var page2;
var page3;
var page4;
var map1;
var map2;
var map3;
var map4;
var testiInt;

function gestoreLoad () {   
    try {      
        nodoAvanti = document.getElementById("avanti");      
        nodoIndietro = document.getElementById("indietro");         
        nodoFoto = document.getElementById("LL1.29_000"); 
        page1 = document.getElementsByClassName("p1");
        page2 = document.getElementsByClassName("p2");
        page3 = document.getElementsByClassName("p3");
        page4 = document.getElementsByClassName("p4");
        testiInt = document.getElementsByClassName("int");
        map1=document.getElementById("mappa1");
        map2=document.getElementById("mappa2");
        map3=document.getElementById("mappa3");
        map4=document.getElementById("mappa4");
        nodoAvanti.onclick = gestoreClickAvanti;      
        nodoIndietro.onclick = gestoreClickIndietro;      
        numeroFoto = galleria.length;
        indiceFoto = 0;  
        for (var i = 0;i<page1.length;i++){
            page1[i].setAttribute("hidden","hidden");
        }
        for (var i = 0;i<page2.length;i++){
            page2[i].setAttribute("hidden","hidden");
        }   
        for (var i = 0;i<page3.length;i++){
            page3[i].setAttribute("hidden","hidden");
        }  
        for (var i = 0;i<page4.length;i++){
            page4[i].setAttribute("hidden","hidden");
        } 
  
        cambiaFoto(0);   
    } catch ( e ) {      
        alert("gestoreLoad " + e);   
    }
}
window.onload = gestoreLoad;

var galleria = [
    "LL1.29_0001.png",
    "LL1.29_0002.png",
    "LL1.29_0003.png",
    "LL1.29_0004.png"
];

