public class Bombs
{
  private int size;
  private int dummy;
  
  private int[] bombLocationX;
  private int[] bombLocationY;
  
  private int bombClickedX;
  private int bombClickedY;
  private boolean clickedBomb;
  
  Bombs(int size)
  {
    this.size=size;
    bombLocationX=new int[size];
    bombLocationY=new int[size];
  }
  
  void choosePositions()
  {
   for(int x=0;x<size;x++)
   {
     bombLocationX[x]=(int)random(10);
     bombLocationY[x]=(int)random(10);
      
     dummy=0;
     while(true)
     {
       if(bombLocationX[x]==bombLocationX[dummy]&&bombLocationY[x]==bombLocationY[dummy])
       {
         bombLocationX[x]=(int)random(10);
         bombLocationY[x]=(int)random(10);
       }
       else
         break;
          
       dummy++;
     }
   }
   alignToGrid();
  }
  
  void alignToGrid()
  {
    for(int x=0;x<size;x++)
    {
      bombLocationX[x]=bombLocationX[x]*50+50;
      bombLocationY[x]=bombLocationY[x]*50+250;
    }
  }

  void drawBombs()
  {
    for(int x=0;x<size;x++)
    {
      image(bomb,bombLocationX[x]+2,bombLocationY[x]+2,44,46);
    }
  }
  
  int bombXCoords(int value)
  {
    return bombLocationX[value];
  }
  
  int bombYCoords(int value)
  {
    return bombLocationY[value];
  }
  
  void bombClicked(int x,int y)
  {
    if(!clickedBomb)
    {
      bombClickedX=x+10;
      bombClickedY=y+42;
      clickedBomb=true;
    }
  }
  
  void xOnBomb()
  {
    fill(255,0,0);
    stroke(0);
    textSize(45);
    text("X",bombClickedX,bombClickedY);
  }
}