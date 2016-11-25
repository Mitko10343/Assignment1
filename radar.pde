class Radar
{
   int centerX;
   int centerY;
   int widthE;
   int heightE;
   int x2;
   int y2;
   float angle=10;
   boolean music;
   
  Radar(int centerX,int centerY,int widthE,int heightE,int x2,int y2)
  {
     this.centerX = centerX;
     this.centerY = centerY;
     this.widthE = widthE;
     this.heightE = heightE;
     this.x2 = x2;
     this.y2 = y2;
     this.music =music;
  }
  
  void drawRadar()
  {
     fill(0);
     stroke(76,2,152);
     strokeWeight(6);
     ellipse(centerX,centerY,widthE,heightE);
  }
  
  void rotateRadar()
  {
      if(second() %1 == 0)
      {
        angle += 0.1;
      }
      if(music == true)
      {
        angle +=.05;
      }
      pushMatrix();
      translate(centerX,centerY);
      rotate(angle);
      stroke(0,255,0);
      line(0,0,50,50);
      fill(0,255,0,100);
      noStroke();
      arc(-1,0,150,150,radians(360),radians(410));
      popMatrix();
   }
}