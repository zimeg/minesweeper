int size=10;
int totalFlags=size;
boolean showBombs=false;

PImage flag;
PImage bomb;

BoxClicked click=new BoxClicked();
Flags flags=new Flags();
Bombs bombs=new Bombs(size);
Numbers boxNum=new Numbers(size);
Reveal show=new Reveal();
ShowZero zero=new ShowZero();
BoardSetUp board=new BoardSetUp();

//TODO LIST:
//Auto expand all zeros when clicked

void setup()
{
  size(600,800);
  flag=loadImage("flag.png");
  bomb=loadImage("bomb.png");
  
  bombs.choosePositions();
  boxNum.setNumbers();
}

void draw()
{
  board.boardSetup();
  bombs.drawBombs();
  
  flags.flagDraw();
  
  for(int x=0;x<show.totalClicks();x++)
  {
    boxNum.drawNumber(show.clickedXValues(x),show.clickedYValues(x));
  }

  board.allFlags();
  board.allNumbers();
  
  if(showBombs)
  {
    bombs.drawBombs();
    bombs.xOnBomb();
    board.gameLost();
  }
}

void mouseReleased()
{
  click.whichSquare();
  
  if(mouseX>50&&mouseX<550&&mouseY>250&&mouseY<750)
  {
    if(mouseButton==RIGHT&!click.flagTest(flags.gridX.size())&!click.numTest(show.totalClicks())&!showBombs&!board.gameWon)
      flags.addFlagArray(); 
    else if(mouseButton==RIGHT&&click.flagTest(flags.gridX.size())&!showBombs&!board.gameWon)
      flags.removeFlagArray();
    
    if(mouseButton==LEFT&!click.numTest(show.totalClicks())&!click.flagTest(flags.gridX.size())&!board.gameWon)
    {
      for(int x=0;x<size;x++)
      {
        if(bombs.bombXCoords(x)==click.alignedClick[0]&&bombs.bombYCoords(x)==click.alignedClick[1])
        {
          showBombs=true;
          bombs.bombClicked(click.alignedClick[0],click.alignedClick[1]);
        }
      }
      if(!showBombs)
      {
        show.addClicks(click.boxClicked[0],click.boxClicked[1]);
        zero.surround(click.boxClicked[0],click.boxClicked[1]);
      }
    }
  }
  
  if(mouseX>200&&mouseX<400&&mouseY>150&&mouseY<225)
    board.resetGame();
}