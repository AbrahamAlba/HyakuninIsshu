class Particula{
float mx;
float my;
float tx;
float ty;
float vx;
float vy;
float r;

Particula(float mx_, float my_, float tx_, float ty_, float vx_, float vy_, float r_){
mx = mx_;
my = my_;
tx = tx_;
ty = ty_;
vx = vx_;
vy = vy_;
r = r_;
}
}


void trazo1(){
  
  xp[49] = (458+(81/2) +cos(angulo)*radio);
  yp[49] = (lunaY+(79/2) + sin(angulo2)*radio);
  radio=Espiral.r+50;
  angulo=angulo + Espiral.vx;
  angulo2=angulo2 + Espiral.vy;
  
  
ellipse(Espiral.mx, Espiral.my, Espiral.tx, Espiral.ty);

}

void trazo2(){

  xp2[99] = ((80+198)/2 +cos(angulo3)*radio2);
  yp2[99] = ((396+495)/2 + sin(angulo4)*radio2);
  radio2=Espiral2.r+70;
  angulo3=angulo3 + Espiral2.vx;
  angulo4=angulo4 + Espiral2.vy;

ellipse(Espiral2.mx, Espiral2.my, Espiral2.tx, Espiral2.ty);

}