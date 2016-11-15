void setup()
{
   size(1000,800); 
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
      text_color ++;
    }
    if(back_ground == 0)
    {
      clear();
      text("Systems are now operational",(width/2)-100,height/2);
      if(frameCount % (60*3) == 0)
      {
        game_state = 1;
        println(game_state);
      }
    }
}

void drawShip()
{
  fill(0,0,255,100);
   beginShape();
     vertex(0,0);
     vertex(150,0);
     vertex(100,50);
     vertex(50,50);
     vertex(50,150);
     vertex(0,200);
   endShape();
   
   beginShape();
     vertex(width,0);
     vertex(width-150,0);
     vertex(width-100,50);
     vertex(width-50,50);
     vertex(width-50,150);
     vertex(width,200);
   endShape();
   
   beginShape();
     vertex((width/2)-200,0);
     vertex((width/2)-200,150);
     vertex((width/2)+200,150);
     vertex((width/2)+200,0);
   endShape();
   
   fill(255,0,0);
   beginShape();
     vertex((width/2)-150,25);
     vertex((width/2)-150,125);
     vertex((width/2)+150,125);
     vertex((width/2)+150,25);
   endShape();
}