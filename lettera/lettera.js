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
    nodoFoto.setAttribute("src", galleria[indiceFoto]);
    nodoFoto.setAttribute("usemap","#"+galleria[indiceFoto]);
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

