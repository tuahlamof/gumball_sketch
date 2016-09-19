public class Buttons {

  boolean insertButtonOver = false;
  boolean turnButtonOver = false;
  boolean insertClicked = false;
  boolean turnClicked = false;
  int insertButtonX = 175;
  int insertButtonY = 500;
  int turnButtonX = 350;
  int turnButtonY = 500;
  int buttonWidth = 100;
  int buttonHeight = 30;
  color buttonColor = color(255);
  color hoverColor = color(200);
  color clickColor = color(0);
  String str;
  GumballMachine gumballMachine;

  
  public Buttons(GumballMachine gumballMachine) {
    this.gumballMachine = gumballMachine;
  }
  
  void drawButtons() {
    update();
    
    if (insertButtonOver) {
      fill(hoverColor);
    } else {
      fill(buttonColor);
    }
    stroke(0);
    rect(insertButtonX, insertButtonY, buttonWidth, buttonHeight);
    
    if (turnButtonOver) {
      fill(hoverColor);
    } else {
      fill(buttonColor);
    }
    stroke(0);
    rect(turnButtonX, turnButtonY, buttonWidth, buttonHeight);
    
    textSize(14);
    fill(0);
    text("Insert quarter", insertButtonX + 11, insertButtonY + 7, buttonWidth, buttonHeight);
    text("Turn crank", turnButtonX + 12, turnButtonY + 7, buttonWidth, buttonHeight);
    
    doFunction();
    str = gumballMachine.toString();
    fill(255);
    stroke(255);
    rect(150, 60, 250, 100);
    fill(0);
    text(str, 150, 60);
  }
  
  private void drawClick() {
    if (overInsertButton()) {
      fill(clickColor);
      stroke(0);
      rect(insertButtonX, insertButtonY, buttonWidth, buttonHeight);
    }
    if (overTurnButton()) {
      fill(clickColor);
      stroke(0);
      rect(turnButtonX, turnButtonY, buttonWidth, buttonHeight);
    }
  }
  
  private void update() {
    if (overInsertButton()) {
      insertButtonOver = true;
      turnButtonOver = false;
      insertClicked = !insertClicked;
    } else if (overTurnButton()) {
      turnButtonOver = true;
      insertButtonOver = false;
      turnClicked = !turnClicked;
    } else {
      turnButtonOver = false;
      insertButtonOver = false;
    }
  }
  
  private boolean overInsertButton() {
    if (mouseX >= insertButtonX && mouseX <= insertButtonX + buttonWidth && mouseY >= insertButtonY && mouseY <= insertButtonY + buttonHeight) {
      return true;
    } else {
      return false;
    }
  }
  
  private boolean overTurnButton() {
    if (mouseX >= turnButtonX && mouseX <= turnButtonX + buttonWidth && mouseY >= turnButtonY && mouseY <= turnButtonY + buttonHeight) {
      return true;
    } else {
      return false;
    }
  }
  
  private void doFunction() {
    if (overInsertButton() && mousePressed) {
      drawClick();
      gumballMachine.insertQuarter();     
    }
    if (overTurnButton() && mousePressed) {
      drawClick();
      gumballMachine.turnCrank();
    }
  }
}