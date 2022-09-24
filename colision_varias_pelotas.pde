int numBolas=int(random(5,25));//numero de bolas random de 5 a 25 bolas
float resorte =random(0.03,0.07);//suponiendo que la bola actua como resorte, donde existe una constante de resorte para que rebote
float gravedad=random(0.02,0.05);
float friccion =random(-0.6,-0.9);//coeficiente de friccion de las bolas
Bola[] bolas=new Bola[numBolas];//arreglo para crear instancias de las boolas
void setup(){
 size(556,493);//tamaño de la ventana
 for(int i=0;i<numBolas;i++){//diameto aleatorio
 bolas[i]=new Bola(random(width),random(height),random(30,80),i,bolas);
 }
 fill(38,132,248,194); //color de la bola
}
void draw(){
background(255);
for(Bola bola:bolas){
  //dinamica de las colisoones a traves de chocar , mover y mostrar
bola.chocar();
bola.mover();
bola.mostrar();
}
}
class Bola{
  //bola con 6 propiedades
  float x,y;
  float diametro;
  float vx=0;
  float vy=0;
  int id;
  Bola[] otros;
  Bola (float xin,float yin,float din,int idin,Bola[] oin){
    //parametros de la bola
    x=xin;
    y=yin;
    diametro=din;
    id=idin;
    otros=oin;
  }
  void chocar(){
    //se repite el proceso con caa bola
  for(int i=id+1;i<numBolas;i++){
  float dx=otros[i].x-x;//desplazamiento en x y en y
  float dy=otros[i].y-y;
  float distancia=sqrt(dx*dx+dy*dy);//la distancia es la hipotenusa de las coordenadas xy y del desplazamiento
  float minDist=otros[i].diametro/2+diametro/2;//distancia minima de la colison
  if(distancia<minDist){
    float angulo =atan2(dy,dx);//se calcula en radiantes a partir de las coordenadas de desplazamiento de la bola
    float objetivoX=x+cos(angulo)*minDist;//se define un objetivo en x
    float objetivoY=y+sin(angulo)*minDist;//se define un objetivo en y
    float ax = (objetivoX -otros[i].x)*resorte;//velocidad de colison
    float ay = (objetivoY -otros[i].y)*resorte;
    vx-=ax;//se disminuye la velociodad de colison en x
    vy-=ay;//se disminuye la velociodad de colison en y
    otros[i].vx+=ax;
    otros[i].vy+=ay;
  }
  }
  }
  void mover(){
    vy+=gravedad;//la velocidad en y es afectada por la gravedad
    x+=vx;//la posicionn en x se incrementa por el factor de vx
    y+=vy;//la posicionn en y se incrementa por el factor de vy
    if(x+diametro/2>width){
    x=width-diametro/2;
    vx+=friccion;
    }
    else if(x-diametro/2<0){
    x=diametro/2;
    vx+=friccion;
    }
     if(y+diametro/2>height){
    y=height-diametro/2;
    vy+=friccion;
    }
    else if(y-diametro/2<0){
    y=diametro/2;
    vy+=friccion;
    }
}
void mostrar(){
ellipse(x,y,diametro,diametro);//se dibuja la pelota
}
}
