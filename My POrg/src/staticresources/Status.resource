      
        function searchFunc(){
                showDlg('Loading..Please wait.');
        }
        function hideDlg() {
            document.getElementById("dlgCont").style.display  = "none";
            document.getElementById("backFr").style.display   = "none";  
            document.getElementById("divUnder").style.display = "none";
        }
        function showDlg(msg) {
          window.scrollTo(0, 0);
          resizeCustomLoadingDlg();
          if (msg != null) {
            document.getElementById("waitMsg").innerHTML = msg;
          }   
          if (!isFirefox) { 
            document.getElementById("backFr").style.display = "";  
          }
          document.getElementById("dlgCont").style.display  = "";
          document.getElementById("divUnder").style.display = ""; 
        }
        function resizeCustomLoadingDlg() {
              var dlgWin = this;
              var dlgDoc = this.document;
              var w = 0;
              var h = 0;

              if (isFirefox) {
                w = dlgDoc.documentElement.clientWidth;
                h = dlgWin.innerHeight;
              } 
              else {
                if (!isOpera && dlgWin.innerWidth) {
                  w = dlgWin.innerWidth;
                  h = dlgWin.innerHeight;
                } 
                else {
                  if (!isOpera && (dlgDoc.documentElement.clientWidth)) {
                    var w2 = dlgDoc.documentElement.clientWidth;
                    if (!w || w2&&w2<w) {
                          w = w2;
                    }
                    h = dlgDoc.documentElement.clientHeight;
                  } 
                  else {
                    if (document.body.clientWidth) {
                       w = document.body.clientWidth;
                       h = document.body.clientHeight;
                    }
                  }
               }
             }
             var d = document.getElementById("divUnder");
             d.style.height = h + "px";
             d.style.width = w + "px";
    
             var c = document.getElementById("dlgCont");
             var offLeft = Math.round((Math.round((w - c.offsetWidth) / 2))*.32);
             var offRght = Math.round((Math.round((h - c.offsetHeight) / 2))*.35);
             c.style.left = Math.round((w - c.offsetWidth) / 2)-offLeft + "px";
             c.style.top = Math.round((h - c.offsetHeight) / 2)-offRght + "px";
    
             var f = document.getElementById("backFr");
             f.style.height = h + "px";
             f.style.width = w + "px";   
         }