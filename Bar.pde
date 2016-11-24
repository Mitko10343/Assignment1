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
    noStroke();
    fill(0);
    rect(x,y,Width,Height);
    fill(0,255,0);
    rect(x,y,load,Height);
    text("Speed is" + speed, x,y);
  }
  
  
  void loadingBar()
  {
    if(keyPressed)
    {
      if(key == 'w' || key == 'W')
      {
         if(load <Width)
         {
           load++;
           speed++;
         }
      }
      else
      {
        if(load>0)
        {
          load--;
          speed--;
        }
      }
    }
  }
}