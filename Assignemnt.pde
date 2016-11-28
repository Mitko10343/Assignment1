  //Import the lbrary for sound
import ddf.minim.*;

//Declare objects for the audio file to be ready into and to be played by
Minim minim;
AudioPlayer file;

//Declaring all object names
Fuel fuel_meter;
Radar radar;
Guns gun1;
Guns gun2;
Crosshair crosshair;
Button button;
Bar speedBar;
Rpm rpmBar;

void setup()
{
   //Creating screen size
   size(1200,800);
   smooth();
   
   //Creating the actuall objects that will play the file
   minim = new Minim(this);
   file = minim.loadFile("music.mp3",512);//File that is being loaded into object 'file'
   //Creating other objects that will be used in the program
   fuel_meter = new Fuel(100,height-170,30,120,height-164);//Fuel Meter object
   radar =new Radar(width-140,height-110,150,150,width-105,height-160);//Radar object
   gun1 =new Guns(400,height-300,50,100);//I used some polymorphism to create two objects of
   gun2 = new Guns(800,height-300,50,100);//the same class
   speedBar = new Bar(450,600,300,50);//Object for the speed bar
   crosshair = new Crosshair();//object for the crosshair
   button = new Button(100,100,70,50);//Object for the hyperjump button
   rpmBar = new Rpm(width/2,height,50,50);
}


//Global variable that will tell classes when the fuel has finished
Boolean meterzero = false;
//Global variable for the hud state , this will allow a transitoon between the loading screen into the actuall hud
int game_state =0;
//global variable for the background
int back_ground =255;
void draw()
{
  background(back_ground);
  //Case statement  for transition between loading screen and HUD
  switch(game_state)
  {
    case 0: // if case is 0 that means the hud hasnt loaded and the loading screen is run
    {
      loadingScreen();
      break;
    }
    case 1://When case = 1 then the loading screen must have finished executing and now the HUD is being drawn and executed
    {
      if(music == true)//If music is turned on call function hyperJump which prints more stars and creates the effect of increased speed
      {
        hyperJump();
      }
      else
      {
         stars();//Prints stars on the screen when the music is not on
      }
      drawShip();//Draws the ship dashboard
      equaliser();//Draws the Equaliser 
      radar.drawRadar();//draws the radar
      radar.rotateRadar();//rotates the radar
      fuel_meter.drawFuel();//Draws the fuel meter
      gun1.drawGuns();//Draws both guns
      gun2.drawGuns();
      button.drawButton();//Draws the hyperjump button
      speedBar.drawBar();//Draws the speed bar
      speedBar.loadingBar();//Changes the speed of the speed bar when the acceleration button is pressed
      rpmBar.rpmRender();
      rpmBar.drawRpm();
      crosshair.crosshair();//draws the crosshair
      break;
    }
  }
}






int text_color=0;
float theta;
boolean loadComplete =false;
void loadingScreen()
{
   fill(text_color);
   text("Hold E",(width/2)-18,(height/2)+5);
   noFill();
   strokeWeight(4);
   arc(width/2,height/2,100,100,0,radians(theta));
    if(keyPressed)
    {
       if(key == 'e' || key == 'E');
       {

          theta += 5;
          println(theta);

  
          if(theta == 360)
          {
             loadComplete = true;
          }
       }
    }
    else
    {
       if(frameCount % 2 == 0 && (loadComplete != true && theta >0))
       {
          theta -= 5;
       }
    }
     
    if((loadComplete == true) && (back_ground !=0))
    {
      back_ground -- ;
    }
    if(back_ground == 0)
    {
      clear();
      text_color=255;
      text("Systems are now operational",(width/2)-100,height/2);
      if(frameCount % (60*3) == 0)
      {
        game_state = 1;
        println(game_state);
      }
    }
}





void stars()
{
  if(frameCount % 10 == 0)
  {
    strokeWeight(6);
    stroke(random(255),random(255),random(255));
    point(random(width),random(height/3,height-300));
    point(random(width),random(height/3,height-300));
    point(random(width),random(height/3,height-300));
    point(random(width),random(height/3,height-300));
    point(random(width),random(height/3,height-300));
    point(random(width),random(height/3,height-300));
    point(random(width),random(height/3,height-300));
  }
}





int a=0;
void drawShip()
{
  stars();
  if(frameCount % 2 == 0 && (a !=255))
  {
    a += 20;
  }
  
  strokeWeight(4);
  if(music == true)
  {
    stroke(random(255),random(255),random(255));
    fill(0);
  }
  else
  {    
    stroke(255,0,0,a);
    fill(140,a);
  }
  
  //Dashboard
  beginShape();
    vertex(0,height);
    vertex(0,height-200);
    vertex(100,height-250);
    vertex(300,height-300);
    vertex(900,height-300);
    vertex(1100,height-250);
    vertex(width,height-200);
    vertex(width,height);
  endShape();
  
  arc(width/2,0,width*2,400,0,180);
  
}

float c = 0 ;
boolean music = false;
void mousePressed()
{
    if((( mouseX > 100) && (mouseX <200)) && ((mouseY>100)&& (mouseY < 200)) && (game_state == 1))
    {
      if(mouseButton == LEFT)
      {
        c = random (0,255);
        file.rewind();
        file.play();
        music = true;
      }
      if(mouseButton == RIGHT)
      {
        c =0;
        file.pause();
        music = false;
      }
    }
    
}

void hyperJump()
{
  stroke(random(0,255),random(0,255),random(0,255));
  strokeWeight(6);
  point(random(width),random(height));
  point(random(width),random(height));
  point(random(width),random(height));
  point(random(width),random(height));
  point(random(width),random(height));
  point(random(width),random(height));
  point(random(width),random(height));
  point(random(width),random(height));
  point(random(width),random(height));
  point(random(width),random(height));
  point(random(width),random(height));
  point(random(width),random(height));  
}

int fade=0;
void equaliser()
{
  if(music == true)
  {
     fade++;
     stroke(random(255),random(255),random(255),fade);
     strokeWeight(2);
  }
  else
  {
    noStroke();
    fade=0;
  }
  
  for (int i = 0; i < file.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, file.bufferSize(), 400, width - 400);
    float x2 = map(i+1, 0, file.bufferSize(),400, width - 400);
    line(x1, 70 - file.mix.get(i)*100, x2, 70 - file.mix.get(i+1)*100);
    line(x1, 120 - file.mix.get(i)*100, x2, 120 - file.mix.get(i+1)*100);
    println(file.mix.get(i+1)*100);
  }
  outline();
}

void outline()
{
    line(400,20,800,20);
    line(400,170,800,170);
    line(400,20,400,170);
    line(800,20,800,170);
}