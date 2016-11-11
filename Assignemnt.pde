void setup()
{
   size(1000,800); 
}

//global variable for the background
int back_ground = 255;
void draw()
{
  background(back_ground);
  loadingScreen();
}

int text_color=0;
int theta;
int game_state =0;

void loadingScreen()
{
   fill(text_color);
   text("Hold E",(width/2)-18,(height/2)+5);
   noFill();
   strokeWeight(3);
   arc(width/2,height/2,100,100,0,theta);
    if(keyPressed)
    {
     if((key == 'e' || key == 'E') && (game_state == 0));
     {
       if(frameCount % 30 == 0)
       {
          theta++;
          println(theta);
       }
      if(theta == 7)
      {
          game_state = 1;
          println("gamestate");
      }
     }
    }
    
    if(game_state == 1)
    {
       if(frameCount % 2 ==0 )
       {
         back_ground--;
         text_color++;
       }
     }
}