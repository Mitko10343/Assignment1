class Bar
{
  int x,y;
  int Width,Height;
  int load=0;
  int speed =0;
  
  Bar(int x, int y, int Width, int Height)
  {
    this.x = x;
    this.y = y;
    this.Width = Width;
    this.Height = Height;
  }
  
  void drawBar()
  {
    
    fill(0);
    rect(x,y,Width,Height);
    if(music == true)
    {
      fill(0,255,0);
      stroke(0,255,0);  
    }
    else
    {
      stroke(255,0,0);
      fill(255,0,0);
    }
    rect(x,y,load,Height);
    textSize(15);
    text("Speed is" + speed, x+100,y);;
  }
  
  
  void loadingBar()
  {
    if(keyPressed)
    {
      if(key == 'w' || key == 'W')
      {
         if(load <Width && meterzero == false)
         {
           load++;
           speed++;
         }
         if(load >0 && meterzero == true)
        {
          if(frameCount % 3 == 0)
          {
            load--;
            speed--; 
          }
            fill(255,0,0);
            textSize(25);
            text("NO FUEL!!!!",550,250);      
        }
      }
     
    }
    else
      {
        if(load>0)
        {
          if(frameCount % 3 == 0)
          {
            load--;
            speed--;
          }
        }
      }
  }
}