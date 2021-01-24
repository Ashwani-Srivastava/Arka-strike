import processing.serial.*;
PImage back,fore;
Serial myPort;
PImage img,bate;
int val;
int counter=0;
void setup()
{
  size  (500,707);
  img=loadImage("800501.jpg");
  bate=loadImage("oie_oie_trim_image.png");
  back=loadImage("minions-backdrop-yellow-cartoon-photo-photography-background-7x5ft-animation-decoration-birthday-cel__51b7GnTDtDL.jpg");
  fore=loadImage("oie_7dzz62NQEzZ1.png");
 // myPort=new Serial(this,"/dev/ttyUSB0",9600);
}
float vel=1,y=45,x,key=1,velx=0;
int score=0,speed=5;
void draw()
{
  
  //if(myPort.available()>0)
    //  val =20* myPort.read();
    val=mouseX;
  stroke(255,0,0);
  
  background(255);
  
  image(back,0,150);
  image(fore,0,15,2.02*fore.width,fore.height);
  fill(255,255,0);
  textSize(30);
   {text("Score :   ",100,100);
  text(score ,250,100);}
   y=y + vel;
   x=x+velx;
   
   if(key==1)
   {x=random(30,width-30);
   key=0;}
  image(bate,x,y,0.33*bate.width,0.48*bate.height);
  fill(100,100,255);
  if(val>=450) 
  rect(400,600,100,25);
  else if(val<=50)
  rect(0,600,100,25);
  //image(img,468,675,img.width/2.7,img.height*25/300);
  else
  rect(val-50,600,100,25);
  //image(img,val+50,612,img.width/2.7,img.height*25/300);
  if((y==575&&val-50<x&&(val+50)>x)) {score+=10+speed;speed+=10;vel+=0.05;}
  if((y==575&&val-50<x&&(val+50)>x)){
    
    vel=-vel;
  velx=random(-10,20)/10.0;
  
   }
   if(y<=34) vel=-vel;
   
  if(x<=13||x>=483) velx=-velx;
  if(y>=700) {y=45;velx=0;x=random(30,width-30);score=0;speed=5;vel=1;}
  frameRate(250+speed);
  counter++;
} 
