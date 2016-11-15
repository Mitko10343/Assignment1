void setup()
{
   size(1000,800);
   frameRate(60);
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
  stars();
  if(frameCount % 2 == 0 && (a !=255))
  {
    a += 5;
  }
  
  stroke(0,255,255,a);
  fill(0,0,255,a);
  //top left bar
   beginShape();
     vertex(0,0);
     vertex(300,0);
     vertex(100,50);
     vertex(50,50);
     vertex(50,150);
     vertex(0,300);
   endShape();
   
   //top right bar
   beginShape();
     vertex(width,0);
     vertex(width-300,0);
     vertex(width-100,50);
     vertex(width-50,50);
     vertex(width-50,150);
     vertex(width,300);
   endShape();
   
   //middle bar-outter shape
   beginShape();
     vertex((width/2)-200,0);
     vertex((width/2)-150,150);
     vertex((width/2)+150,150);
     vertex((width/2)+200,0);
   endShape();
   
   fill(0,0,140,a);
   //dashboard
   beginShape();
     vertex(0,(height/2)+100);
     vertex((width/2)-150,(height/2)+250);
     vertex((width/2)-150,height);
     vertex(0,height);
   endShape();
   
   beginShape();
     vertex((width/2)+150,(height/2)+250);
     vertex(width,(height/2)+100);
     vertex(width,height);
     vertex((width/2)+150,height);
   endShape();
   
   fill(0,0,160,a-100);
   beginShape();
     vertex(0,(height/2)+100);
     vertex(width/2,height/2);
     vertex(width,(height/2)+100);
     vertex((width/2)+150,(height/2)+250);
     vertex((width/2)+150,height);
     vertex((width/2)-150,height);
     vertex((width/2)-150,(height/2)+250);    
   endShape();
   
   
   fill(255,0,0,a);
   //middle bar-inner shape
   beginShape();
     vertex((width/2)-150,25);
     vertex((width/2)-100,125);
     vertex((width/2)+100,125);
     vertex((width/2)+150,25);
   endShape();
}