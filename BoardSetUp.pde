public class BoardSetUp
{
  private int testFlags;
  private boolean gameWon;
  
  void boardSetup()
  {
    background(255);
    fill(0);
    for(int x=1;x<=11;x++)
    {
      line(x*50,250,x*50,750);
    }
    
    for(int y=1;y<=11;y++)
    {
      line(50,y*50+200,550,y*50+200);
    }
    
    flags.displayFlagNum();
    
    noFill();
    rect(200,150,200,75);
    
    fill(0);
    textSize(25);
    text("New Game",235,200);
    
    textSize(65);
    text("Minesweeper",100,110);
  }
  
  void resetGame()
  {
    bombs.choosePositions();
    boxNum.setNumbers();
    
    show.clickedX.clear();
    show.clickedY.clear();
    
    flags.gridX.clear();
    flags.gridY.clear();
    
    showBombs=false;
    totalFlags=10;
    
    for(int x=0;x<boxNum.boxCounter.length;x++)
    {
      boxNum.boxCounter[x]=0;
    }
    boxNum.setNumbers();
    gameWon=false;
    bombs.clickedBomb=false;
  }
  
  void allFlags()
  {
    testFlags=0;
    for(int x=0;x<size;x++)
    {
      for(int y=0;y<flags.flagXArray().size();y++)
      {
        if(flags.flagXArray().get(y)==bombs.bombXCoords(x)&&flags.flagYArray().get(y)==bombs.bombYCoords(x))
          testFlags++;
      }
    }
    if(testFlags==10)
    {
      gameWon=true;
      gameWon();
    }
  }
  
  void allNumbers()
  {
    if(show.totalClicks()==90)
    {
      gameWon=true;
      gameWon();
    }
  }
  
  void gameWon()
  {
    fill(255);
    stroke(0);
    rect(151,351,298,98);
    
    fill(0);
    textSize(65);
    text("You win!",165,425);
  }
  
  void gameLost()
  {
    fill(255);
    stroke(0);
    rect(151,351,298,98);
    
    fill(0);
    textSize(60);
    text("You lost!",165,425);
  }
}