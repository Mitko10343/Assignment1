# Assignment1
Year 2 - OOP Assignemnt 1

Written by:Dimiter Dinkov
Student Number : C15334276
Video Link:


Part 1(Loadin Screen):
----------------------
Part one of my Object Oriented Programming(OOP) Assignemnt is the loading screen.
The assignment begins with a screen that asks the user to hold the button 'E'.
As the user presses down on the button E an animation of a circular loading bar 
begins to loop into a circle. If the button is release before the circle is complete
the loading process reverses and the size of the arc that creates the animation begins
decreasing until the loading progress reaches 0%.
If the loading circle is complete a variable is set to true and signals the program that 
the loading process is complete.
From there the transition between the loading screen and the actuall HUD begins.

Part 2(Transition):
----------------------
The transition creats a fade effect.When the program is signaled that the loading 
has completed the background color begins slowly changing into black.When the whole 
screen is black then a message notifying the user that all systems of the 'ship' are
now operational(sticking to the sci fi theme of the project).When the message is display 
another variable is set to 1 to tell the game that now the animation of the loading screen has 
been completed and therefore the program should now proceed to displaying the actuall HUD(The game 
state is now equal to 1).
For displaying the ship I follow a similar slow fade transition that slowly fills in the
color to all the spaceship components which creates an effect as if the user has just
went into the ship and has now turned on all the light in the ship.