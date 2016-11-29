//Class for the fuel meter
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
  
  //Drawing the fuels meter as a rectangle with a line going across it to indicate fuel levels
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
  
  //When W is pressed then the  Y coordinates of the gauge line are decremented
  //when fuel levels hit 0 a warning message is displayed telling the user that he is out of fuel
  void fuelMeter()
  {
      if(keyPressed)
      {
          if(key =='w' || key=='W' )
          {
             if(meterY < y+Height)
             {
               if(frameCount % 5 == 0)
               {
                 meterY ++;
               }
             }
             else
             {
               meterzero = true;//when there is fuel this global variable is true telling other classes and methods
             }
          }
     
      }
      else
      {
         if(meterY > y+7)
         {
           meterY --;
           meterzero = false;//if the fuel levels are empty this variable tells other classes and methods
         }
      }
  }
}