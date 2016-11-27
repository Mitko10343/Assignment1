class Button
{
    int x,y;
    int Width,Height;
    float c;
    
    Button(int x,int y,int Width,int Height)
    {
      this.x = x;
      this.y = y;
      this.Width = Width;
      this.Height = Height;
    }
    
    void drawButton()
    {
      if(music == true)
      {
        stroke(0,255,0);
        fill(random(255),random(255),random(255));
        rect(x,y,Width,Height);
        fill(255);
        textSize(15);
        text("Stop",x+10,y+30); 
      }
      else
      {
        stroke(255,0,0);
        fill(255);
        rect(x,y,Width,Height);
        fill(255,0,0);
        textSize(10);
        text("Hyper Jump",x+10,y+30); 
      }
    }
    
}