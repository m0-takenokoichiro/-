float x0,x1,x2,x3,x4,x5,y0,y1,y2,y3,y4,y5,z0,z1,z2,z3,z4,z5;
float xb,yb,vxb,vyb,radius;
float rotX,rotY;

void setup(){
  size(1280,720,P3D);
  strokeWeight(10);
  
  x0=width/2;
  y0=height/2;
  z0=0;
  x1=0;
  y1=0;
  z1=100;
  z2=100;
  z3=200;
  z4=200;
  x5=0;
  y5=-sqrt(pow(300,2)-pow(100,2));
  z5=0;
  
  pushMatrix();
  translate(0,300,0);
  translate(x0,y0,z0);
  scale(0.5);
  xb=random(-350+radius,350-radius);
  yb=random(-sqrt(pow(300,2)-pow(100,2))-800+radius,-sqrt(pow(300,2)-pow(100,2))-400);
  vxb=10;
  vyb=-10;
  radius=5;
  scale(2.0);
  popMatrix();
}

void draw(){
  background(200);
  lights();
  
  translate(0,300,0);
  translate(x0,y0,z0);
  rotateX(rotX);
  rotateY(-rotY); 
  scale(0.5);
  xb+=vxb;
  yb+=vyb;
  if(xb-radius<=-350||xb+radius>=350){
    vxb*=-1;
  }
  if(yb<=-sqrt(pow(300,2)-pow(100,2))-800){
    vyb*=-1;
  }
  if(yb>=-sqrt(pow(300,2)-pow(100,2))&&((x5-50<=xb)&&(xb<=x5+50))){
    vyb*=-1;
  }
  ellipse(xb,yb,2*radius,2*radius);
  line(350,-sqrt(pow(300,2)-pow(100,2)),0,350,-sqrt(pow(300,2)-pow(100,2))-800,0);
  line(-350,-sqrt(pow(300,2)-pow(100,2)),0,-350,-sqrt(pow(300,2)-pow(100,2))-800,0);
  line(350,-sqrt(pow(300,2)-pow(100,2))-800,0,-350,-sqrt(pow(300,2)-pow(100,2))-800,0);
  
  if(keyPressed){
    if(keyCode==LEFT&&(x5>=-250)){
      x5-=10;
    }
    else if(keyCode==RIGHT&&(x5<=250)){
      x5+=10;
    }
  }
  x4=x5;
  y4=y5;
  if(x5>=0){
  x3=cos(atan(y5/x5)-acos((pow(300,2)-pow(100,2)+pow(x5,2)+pow(y5,2))/(2*300*sqrt(pow(x5,2)+pow(y5,2)))))*300;
  y3=sin(atan(y5/x5)-acos((pow(300,2)-pow(100,2)+pow(x5,2)+pow(y5,2))/(2*300*sqrt(pow(x5,2)+pow(y5,2)))))*300;
  }
  else if(x5<=0){
    x3=cos(PI+atan(y5/x5)-acos((pow(300,2)-pow(100,2)+pow(x5,2)+pow(y5,2))/(2*300*sqrt(pow(x5,2)+pow(y5,2)))))*300;
    y3=sin(PI+atan(y5/x5)-acos((pow(300,2)-pow(100,2)+pow(x5,2)+pow(y5,2))/(2*300*sqrt(pow(x5,2)+pow(y5,2)))))*300;
  }
  else if (x5==0) {
    x3=100;
    y3=y5;
  }
  x2=x3;
  y2=y3;
    
  stroke(#FF0000);
  line(0,0,0,x1,y1,z1);
  stroke(0);
  line(x1,y1,z1,x2,y2,z2);
  stroke(#FF0000);
  line(x2,y2,z2,x3,y3,z3);
  stroke(0);
  line(x3,y3,z3,x4,y4,z4);
  stroke(#FF0000);
  line(x4,y4,z4,x5,y5,z5);
  translate(x5,y5,z5);
  stroke(0);
  box(100,20,100);
}

void mouseDragged(){
    rotY-=(mouseX-pmouseX)*0.01;
    rotX-=(mouseY-pmouseY)*0.01;
}
