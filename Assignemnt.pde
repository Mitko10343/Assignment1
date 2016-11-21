Fuel fuel_meter;

void setup()
{
   size(1200,800);
   frameRate(60);
   
   fuel_meter = new Fuel();
}

//Global variable for the hud state
int game_state =0;

//global variable for the background
int back_ground = 255;
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

PImage img;
void stars()
{
  img =loadImage("stars.jpg");
  tint(255,a);
  image(img,0,0);
}

int a=0;
void drawShip()
{
  //stars();
  if(frameCount % 2 == 0 && (a !=255))
  {
    a += 5;
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
  
  //crosshair
  noFill();
  arc(width/2,height-300,300,200,radians(-180),radians(0));
  line(width/2,height-300,width/2,height-400);
  
  fuel_meter.Fuel();
}