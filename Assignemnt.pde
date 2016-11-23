Fuel fuel_meter;
Radar radar;

void setup()
{
   size(1200,800);
   frameRate(60);
   
   fuel_meter = new Fuel(100,height-170,30,120,height-164);
   radar =new Radar(width-180,height-160,150,150,width-105,height-160);
}




//Global variable for the hud state
int game_state =0;
//global variable for the background
int back_ground =255;
void draw()
{
  background(back_ground);
  switch(game_state)
  {
    case 0:
    {
      loadingScreen();
      break;
    }
    case 1:
    {
      drawShip();
      radar.drawRadar();
      radar.rotateRadar();
      fuel_meter.drawFuel();
      break;
    }
  }
}






int text_color=0;
float theta;
boolean loadComplete =false;
void loadingScreen()
{
   fill(text_color);
   text("Hold E",(width/2)-18,(height/2)+5);
   noFill();
   strokeWeight(4);
   arc(width/2,height/2,100,100,0,theta);
    if(keyPressed)
    {
       if(key == 'e' || key == 'E');
       {
           if(frameCount % 2 == 0)
           {
              theta ++;
              println(theta);
           }
  
          if(theta == 7)
          {
            loadComplete = true;
          }
       }
    }
    else
    {
       if(frameCount % 2 == 0 && (theta != 7 && theta >0))
       {
          theta --;
       }
    }
     
    if((loadComplete == true) && (back_ground !=0))
    {
      back_ground -- ;
    }
    if(back_ground == 0)
    {
      clear();
      text_color=255;
      text("Systems are now operational",(width/2)-100,height/2);
      if(frameCount % (60*3) == 0)
      {
        game_state = 1;
        println(game_state);
      }
    }
}




/* int angle=0;
void stars()
{
  PImage img;
 
  
  img =loadImage("stars.jpg");
  tint(255,a);
  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  translate(-img.width/2, -img.height/2);
  image(img,0,0,width*2,height*2);
  popMatrix();
  if(keyPressed)
  {
    if(key == 'd' || key =='D')
    {
       angle ++; 
    }
    if( key == 'a' || key =='A')
    {
      angle --;
    }
  }
}*/





int a=0;
void drawShip()
{
  //stars();
  if(frameCount % 2 == 0 && (a !=255))
  {
    a += 20;
  }
  
  stroke(0,100,255,a);
  fill(115,113,147,a);
  
  //Dashboard
  beginShape();
    vertex(0,height);
    vertex(0,height-200);
    vertex(100,height-250);
    vertex(300,height-300);
    vertex(900,height-300);
    vertex(1100,height-250);
    vertex(width,height-200);
    vertex(width,height);
  endShape();
  
  arc(width/2,0,width*2,400,0,180);
  //crosshair
  noFill();
  arc(width/2,height-300,300,200,radians(-180),radians(0));
  line(width/2,height-300,width/2,height-400);
}