class Fuel
{
  int x,y;
  int Width,Height;
  int meterY;
  
  
  Fuel(int x,int y,int Width, int Height,int meterY)
  {
     this.x = x;
     this.y = y;
     this.Width = Width;
     this.Height = Height;
     this.meterY = meterY;
     
  }
  
  void drawFuel()
  {
     fuelMeter();
     fill(0);
     stroke(76,2,152);
     strokeWeight(1);
     rect(x,y,Width,Height);
     line(x,meterY,x+Width,meterY);
     fill(76,2,152);
     textSize(15);
     text("FUEL" ,x,height-30);
    
  }
  
  void fuelMeter()
  {
      if(keyPressed)
      {
          if(key =='w' || key=='W' )
          {
             if(meterY < y+Height)
             {
               meterY ++;
             }
             else
             {
               meterzero = true;
             }
          }
     
      }
      else
      {
         if(meterY > y+7)
         {
           meterY --;
           meterzero = false;
         }
      }
  }
}