import ddf.minim.*;

Minim minim;
AudioPlayer ambiente,chime,canto,drum;

Particula Espiral,Espiral2,Espiral3;
 
PImage referencia;
PImage fondo;
PImage arbol;
PImage cabello;
PImage monte;
PImage mujer;
PImage nube1;
PImage nube2;
PImage nube3;
PImage niebla;
PImage luna;

float radio;
float radio2;
float angulo;
float angulo2;
float angulo3;
float angulo4;
float xp[] = new float[50];
float yp[] = new float[50];
float xp2[] = new float[100];
float yp2[] = new float[100];
float part_posx;
float part_posy;
int w=600;


int numSegments = 46;
float[] x = new float[numSegments];
float[] y = new float[numSegments];
float[] angle = new float[numSegments];
float segLength = 21;
float targetX, targetY;

float a2 = 0.0;
float inc = TWO_PI/25.0;
float prev_x = 0, prev_y = 50, x3, y3;

float x2, y2;
float easing=0.05;

float lunaY=224;
float cabelloX=1076;
float cabelloY=359;
float cX=1076;
float cY=359;
float nube1X=651;
float nube2X=1105;
float nube3X=748;
float mY=224;

int trigger=0;
int zone=0;
int zone2=0;
int f,f2;

float cabello_estX=1076;
float cabello_estY=359;

void setup() {
  size(1400, 800);
  strokeWeight(10.0);
  stroke(26,24,19, 255);
  
  referencia = loadImage("woman.png");
  fondo = loadImage("fondo.jpg");
  arbol= loadImage("arbol.png");
  cabello= loadImage("cabello.png");
  monte= loadImage("monte.png");
  mujer= loadImage("mujer.png");
  nube1= loadImage("nube1.png");
  nube2= loadImage("nube2.png");
  nube3= loadImage("nube3.png");
  niebla= loadImage("niebla.png");
  luna= loadImage("luna.png");
  
 minim = new Minim(this); 
  ambiente= minim.loadFile("wind.mp3");
  chime= minim.loadFile("chime.mp3");
  canto= minim.loadFile("canto.mp3");
  drum= minim.loadFile("drum.mp3");
  
  
  //x4[x4.length-1] = 400;     // Set base x-coordinate
  //y4[x4.length-1] = 200;  // Set base y-coordinate
}

void draw() {
  ambiente.play();
  
  
  x[x.length-1] = cabelloX+19;     // Set base x-coordinate
  y[x.length-1] = cabelloY+51;  // Set base y-coordinate
  
  if(keyPressed){
    if(key=='r'){
      lunaY=224;
      w=255;
      drum.rewind();
      drum.play();
    }
  
  }
  
  if(mouseX>=458-zone && mouseX<=539+zone && mouseY>=lunaY-zone && mouseY<=lunaY+79+zone){
    if(mousePressed){  
    zone=2000;
    zone2=0;
    cabelloX=1076;
    cabelloY=359;
    lunaY = mouseY-mY;
  }
  }
  
    if(mouseX>=cabelloX+104-zone2 && mouseX<=cabelloX+154+zone2 && mouseY>=cabelloY+75-zone2 && mouseY<=cabelloY+110+zone2){
    if(mousePressed){
      zone2=2000;
      zone=0;
    cabelloX = mouseX-cX;
    cabelloY = mouseY-cY;
  }
  }
  
  image(fondo,0,0);
  
  if(mouseX>=80 && mouseX<=198 && mouseY>=396 && mouseY<=495){
    if(mousePressed){
      
  }
  }
  
  texto();
  
  strokeWeight(10.0);
  stroke(26,24,19, 255);
  
  image(luna, 458, lunaY);
  image(nube1,nube1X,252);
  image(arbol,42,375);
  image(nube2,nube2X,380);
  image(monte,0,379);
  image(niebla,0,554);
  image(nube3,nube3X,608);
  image(mujer,782,398);
  image(cabello,cabelloX,cabelloY);
  
  nube1X+=0.8;
  nube2X++;
  nube3X+=0.3;
  
  if(nube1X>width){
    nube1X=-454;
  }
  
  if(nube2X>width){
    nube2X=-312;
  }
  
   if(nube3X>width){
   nube3X=-416;
  }
  
 float tx= mouseX;
  float fx = tx - x2;
  x2 += fx * easing;
  
  float ty= mouseY;
  float fy = ty - y2;
  y2 += fy * easing;
  
  reachSegment(0, x2, y2);
  for(int i=1; i<numSegments; i++) {
    reachSegment(i, targetX, targetY);
  }
  for(int i=x.length-1; i>=1; i--) {
    positionSegment(i, i-1);  
  } 
  for(int i=0; i<x.length; i++) {
    segment(x[i], y[i], angle[i], (i+1)*0.5); 
  }
  
  drum.play();
  
  w--;
  
  noStroke();
  fill(255,w);
  rect(0,0,width,height);
  fill(0,w);
  text("百人一首",width/2,height/2);
  text("Representación a través de una Pintura Interactiva",width/2-120,height/2+20);
    text("Instrucciones: Interactua con la luna y el árbol por medio del mouse, dando click y arrastrando. Hay un elemento secreto con el cual también puedes interactuar. Presiona R para volver al inicio.                                                      Creado por Abraham Alba.",20,780);

}

void positionSegment(int a, int b) {
  x[b] = x[a] + cos(angle[a]) * segLength;
  y[b] = y[a] + sin(angle[a]) * segLength; 
  
}

void reachSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  angle[i] = atan2(dy, dx);  
  targetX = xin - cos(angle[i]) * segLength;
  targetY = yin - sin(angle[i]) * segLength;
}

void segment(float x, float y, float a, float sw) {
  strokeWeight(sw);
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}

void mousePressed(){
mY = mouseY-lunaY;

cX = mouseX-cabelloX;
cY = mouseY-cabelloY;
}

void mouseReleased(){
  zone=0;
  zone2=0;
  if(cabelloX<=cabello_estX || cabelloX>=cabello_estX){
    cabelloX=cabello_estX;
  }
  
      if(cabelloY<=cabello_estY || cabelloY>=cabello_estY){
    cabelloY=cabello_estY;
    trigger=1;
  }
}

void texto(){
  fill(255);
  
  fill(255,f);
    
  text("夏の夜は",600,lunaY+y2-200);
  text("まだ宵ながら",600,lunaY+20+y2-200);
  text("明けぬるを",600,lunaY+40+y2-200);
  text("雲のいづくに",600,lunaY+60+y2-200);
  text("月やどるらむ",600,lunaY+80+y2-200);
  
  noStroke();
  fill(255,f);
  Espiral = new Particula(xp[49],yp[49],3,3,0.02,0.02,5);
          trazo1(); 
    
    
    if(mouseX>=458-zone && mouseX<=539+zone && mouseY>=lunaY-zone && mouseY<=lunaY+79+zone){
    if(mousePressed){
      trigger=0;
      f=f+2;
      canto.rewind();
      canto.play();
    }
    }
    
    
    fill(255,f2);
    text("高砂の",180,300);
    text("尾の上の桜",180,320);
    text("咲きにけり",180,340);
    text("外山の霞",180,360);
    text("たたずもあらなん",180,380);
    
    noStroke();
    fill(255,f2);
    Espiral2 = new Particula(xp2[99],yp2[99],3,3,0.01,0.01,5);
    trazo2();
    
    if(mouseX>=80 && mouseX<=198 && mouseY>=396 && mouseY<=495){
    if(mousePressed){
      chime.rewind();
      chime.play();
      trigger=2;
      f2=f2+2;
  }
  }
    
    if(trigger==1){
    f=f-2;
    f2=f2-2;
    }
    
    if(trigger==0 && f>=255){
      f=255;      
    }
    
    if(trigger==0 && f2>=255){
      f2=255;      
    }
    
    if(trigger == 1 && f<=0){
    f=0;
    }
    
    if(trigger == 2 && f2<=0){
    f2=0;
    }

}