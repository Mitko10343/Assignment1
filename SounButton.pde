class Button
{
    int x,y;
    int Width,Height;
    float c;
    
    Button(int x,int y,int Width,int Height, float c)
    {
      this.x = x;
      this.y = y;
      this.Width = Width;
      this.Height = Height;
      this.c = c;
    }
    
    void drawButton()
    {
      noStroke();
      fill(random(c),random(c),random(c));
      rect(x,y,Width,Height);
      fill(255);
      text("TUNES",x+20,y+30);      
    }
    
}