//Class for the Rpm barr
class Rpm
{
  int centerX,centerY;
  int Width,Height;
  int theta =180;
  int i=0;
  
  Rpm(int centerX,int centerY,int Width, int Height)
  {
    this.centerX = centerX;
    this.centerY = centerY;
    this. Width = Width;
    this.Height =Height;
  }
  
  //draws the speed bar of 3 differen arcs
  void drawRpm()
  {
    noFill();
    arc(centerX,centerY ,Width+100,Height+100,radians(180),radians(360));
    noStroke();
    fill(255,0,0);
    arc(centerX,centerY,Width+100,Height+100,radians(180),radians(theta));
    if(music == true)
    {
      
      fill(0);
      arc(centerX,centerY,Width,Height,radians(180),radians(360));
      fill(0,255,0);
    }
    else
    {
      fill(255);
      arc(centerX,centerY,Width,Height,radians(180),radians(360));
      fill(0);   
    }
    text(i,width/2,height);
  }
  
  //Increments the size of one arc so it appears as the RPMs increase as speed is increased
  //when it gets to certain RPMs the gear is changed and the RPMs drop.
  //if the RPms are falling then the gear is decreased and the RPMs rise
  void rpmRender()
  {
    //RPMs increase when the W key is pressed
    if(keyPressed)
    {
      if(key == 'w' || key == 'W' && theta<360)
      {
        if(theta <360)
        {
          theta++;
          if(theta == 250 && i <1)
          {
            theta =220;
            i ++;
          }
          if(theta == 290 && i <2)
          {
            theta =250;
            i ++;
          }
           if(theta == 320 && i <3)
          {
            theta = 290;
            i ++;
          }
           if(theta ==360  && i <4)
          {
            theta =320;
            i ++;
          }
        }
      }
    }
    //Rpms decrease as w key is released
    else
    {
      if(theta >180)
      {
        theta -- ;
        if(theta == 320 && i ==4)
        {
          theta =360;
          i--;
        }
        if(theta == 290 && i ==3)
        {
          theta =320;
          i--;
        }
         if(theta == 250 && i ==2)
        {
          theta = 290;
          i--;
        }
         if(theta ==220  && i ==1)
        {
          theta =250;
          i--;
        }
      }
    }
  }
}