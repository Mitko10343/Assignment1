class Crosshair
{
  void crosshair()
  {
    //crosshair
    noFill();
    noCursor();
    strokeWeight(1);
    ellipse(mouseX,mouseY,20,20);
    ellipse(mouseX,mouseY,20,40);
    line(mouseX,mouseY,mouseX+10,mouseY);
    line(mouseX,mouseY,mouseX-10,mouseY);
    line(mouseX,mouseY,mouseX,mouseY+10);
    line(mouseX,mouseY,mouseX,mouseY-10);
  }
}