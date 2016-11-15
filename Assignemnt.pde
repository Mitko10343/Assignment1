void setup()
{
   size(1000,800); 
}

//global variable for the background
int back_ground = 255;
void draw()
{
  background(back_ground);
  switch(game_state)
  {
    case 0:
    loadingScreen();
    
    case 1:
    
  }
}

int text_color=0;
float theta;
int game_state =0;
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
       if(frameCount % 2 == 0 && theta != 7)
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
      game_state = 1;
      println(game_state);
    }
}