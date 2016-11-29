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





//Gloabal variables for the transition of the loading screen so they are not reset to 0 every time the
//draw function updates
int text_color=0;
float theta;
boolean loadComplete =false;
void loadingScreen()
{
  //Begin the loading screen with a message telling the user to hold E
   fill(text_color);
   text("Hold E",(width/2)-18,(height/2)+5);
   noFill();
   strokeWeight(4);
   //Arc that will represent a loading bar
   arc(width/2,height/2,100,100,0,radians(theta));
   //If uses presses E then the arc begins loping into a cricle
    if(keyPressed)
    {
       if(key == 'e' || key == 'E');
       {
        
          theta += 5;
          println(theta);

          //If the arc makes a full circle the load is complete and loadComplete signals the program
          //to begin transition into next screen
          if(theta == 360)
          {
             loadComplete = true;
          }
       }
    }
    else
    {
       //if the user stop holding e before the arc creates a full circle then the arc retracts 
       if(frameCount % 2 == 0 && (loadComplete != true && theta >0))
       {
          theta -= 5;
       }
    }
     
    //if loadComplete is set to true the fade into the next screen begins
    if((loadComplete == true) && (back_ground !=0))
    {
      back_ground -- ;//background turns to black
    }
    //if background is black ,the screen is cleared and a message is displayed to user
    if(back_ground == 0)
    {
      clear();
      text_color=255;
      text("Systems are now operational",(width/2)-100,height/2);
      //after the message sticks for 3 seconds the game_state is set to one signaling the program to go into the next stage
      //and begin drawing the HUD. this is done in the switch statement in the draw() function
      if(frameCount % (60*3) == 0)
      {
        game_state = 1;
        println(game_state);
      }
    }
}




//This function draws stars on the screen.
//A bunch of pixels are drawn on random positions on the screen
void stars()
{
  if(frameCount % 10 == 0)
  {
    strokeWeight(6);//make the pixels bigger so they are visible
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




//Variable that controls the opacity of the shapes of drawing the ship so it creates a smooth transition between screens
int a=0;
//draws the ship with a smooth transition
void drawShip()
{
  //calls for stars to be drawn
  stars();
  //Every 2 frames the opacity of the shapes that create the ship is increased
  if(frameCount % 2 == 0 && (a !=255))
  {
    a += 20;
  }
  
  //If the music is playing then it gives the shapes random outlines and
  //colors the inside black to create and effect of turned off lights in the ship
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
  
  //Uper dashboard layout
  arc(width/2,0,width*2,400,0,180);
  
}

//When the mouse is pressed on the button it opens a music file,rewind it and plays it
//If the same button is right clicked it will stop playing the music
float c = 0 ;
boolean music = false;//Global variable to tell the program if the music is on or off
void mousePressed()
{
    if((( mouseX > 100) && (mouseX <200)) && ((mouseY>100)&& (mouseY < 200)) && (game_state == 1))
    {
      if(mouseButton == LEFT)
      {
        c = random (0,255);
        file.rewind();
        file.play();
        music = true;//sets music to true when the music is playing
      }
      if(mouseButton == RIGHT)
      {
        c =0;
        file.pause();
        music = false;//If music is paused it sets music to false to tell program music has stopped playing
      }
    }
    
}

//The hyper jump function displays a lot of pixes as if the spaceship has begun moving through way more stars faster.
//creates a warp effect in a way
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

//thats is the method for the sound waves
//a variable so the sound wave sceen fades in as the music is turned on
int fade=0;
void equaliser()
{
  //if the music is true it begins displaying the sound waves
  if(music == true)
  {
     fade++;
     stroke(random(255),random(255),random(255),fade);
     strokeWeight(2);
  }
  else//if music is not playing then the fade is set to 0 aka the opacity of the lines is set to 0 and the music screen doesnt show
  {
    noStroke();
    fade=0;
  }
  
  //Maps a load of different lines according to the size of the music file
  //Using the music files buffer size it creates a wavy effect as different parts of the 
  //song are playing
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

//otlines for the sound wave display
void outline()
{
    line(400,20,800,20);
    line(400,170,800,170);
    line(400,20,400,170);
    line(800,20,800,170);
}