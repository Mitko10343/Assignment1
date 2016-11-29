//Just a class for the crosshair
class Crosshair
{
  //Draws the crosshair
  void crosshair()
  {
    //crosshair
    noFill();
    noCursor();
    stroke(255,0,0);
    strokeWeight(1);
    ellipse(mouseX,mouseY,20,20);
    ellipse(mouseX,mouseY,20,40);
    line(mouseX,mouseY,mouseX+10,mouseY);
    line(mouseX,mouseY,mouseX-10,mouseY);
    line(mouseX,mouseY,mouseX,mouseY+10);
    line(mouseX,mouseY,mouseX,mouseY-10);
  }
}