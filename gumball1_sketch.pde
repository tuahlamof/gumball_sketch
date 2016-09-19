GumballMachine gumballMachine;

void setup() 
{
  size(600, 600) ;
  background(255) ;
  smooth() ;
  strokeWeight(3);
  strokeCap(ROUND);
  
  gumballMachine = new GumballMachine(5);
  
  // load font
  PFont font;
  font = loadFont("BookAntiqua-48.vlw");
  textFont(font, 32);

  // Only draw once
  //noLoop();
}

void draw() {
  textSize(32);
  fill(0); 
  text("The Gumball Machine", 150, 60);
  PImage image = loadImage("gumball.jpg");
  image(image, width / 4, height / 4, width / 2, height / 2);
  Buttons button = new Buttons(gumballMachine);
  button.drawButtons();
}