float r=20;

PVector P[];

PVector v[];

PVector p0;

float w=600;

float h=400;

int n=1;

float nx=400;

float mv=0;

void setup(){

  size(800,600);

  background(255);

  p0= new PVector (100,100);

  rect(p0.x,p0.y,w,h);

  P=new PVector[n];

  v=new PVector[n];

 

  for(int i=0;i<n;i++){

    P[i] =new PVector (random(p0.x+r,p0.x+w-r),random(p0.y+r,p0.y+h-r));

    v[i]=PVector.random2D();

circle(P[i].x,P[i].y,2*r);

}

}

void draw(){

background(255);

rect(p0.x,p0.y,w,h);

for(int i=0;i<n;i++){

P[i].add(v[i]);

if(P[i].x+r>p0.x+w){

P[i].x=p0.x+w-r;

v[i].x=-v[i].x;

}

if(P[i].x-r<p0.x){

P[i].x=p0.x+r;

v[i].x=-v[i].x;

}

if(P[i].y+r>p0.y+h){

P[i].y=p0.y+h-r;

v[i].y=-v[i].y;

}

if(P[i].y-r<p0.y){

P[i].y=p0.y+r;

v[i].y=-v[i].y;

}

circle(P[i].x,P[i].y,2+r);

}

}
