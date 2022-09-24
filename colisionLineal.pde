float reboteancho = 80;
float rebotealtura = 80;
float reboteX = 100;
float reboteY = 500;
float rv = 8;
float centroX = 900;
float centroY = 500;
float centroancho = 100;
float centroaltura = 80;
float cv=-5;

void setup() {  
   size(1000, 1000);
 
}

void draw() {
 
  background(255);

  line(0, 580, 1040, 580);
  rect(centroX, centroY, centroancho, centroaltura);
  //cuadro 1
    if (reboteX + reboteancho + rv > centroX && 
      reboteX + rv < centroX + centroancho && 
      reboteY + rebotealtura > centroY && 
      reboteY < centroY + centroaltura) {
        rv *= -.5;
  }
  //cuadro 2
   if (centroX + centroancho + cv > reboteX && 
      centroX + cv < reboteX + reboteancho && 
      centroY + centroaltura > reboteY && 
      centroY < reboteY + rebotealtura) {
        cv *= -0.2; 
  }

  

      reboteX += rv;
      centroX += cv;
  
      rect(reboteX, reboteY, reboteancho, rebotealtura);
  
 
}
