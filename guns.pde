class Guns
{
    int centerX;
    int centerY;
    int Width;
    int Height;
    
    Guns(int centerX,int centerY,int Width,int Height)
    {
      this.centerX = centerX;
      this.centerY = centerY;
      this.Width = Width;
      this.Height = Height;
    }
    
    void drawGuns()
    {  
       noFill();
       stroke(195,9,216);
       strokeWeight(1);
       arc(centerX,centerY,Width,Height,radians(-180),radians(0));
       line(centerX,centerY,centerX,centerY-20);
    }
}