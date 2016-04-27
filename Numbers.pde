public class Numbers
{
  private int[] xCoords;
  private int[] yCoords;
  private int[] boxCounter;
  
  Numbers(int size)
  {
    xCoords=new int[size];
    yCoords=new int[size];
    boxCounter=new int[size*size];
    
    for(int x=0;x<size;x++)
    {
      xCoords[x]=x*50+50;
      yCoords[x]=x*50+300;
    }
  }
  
  void setNumbers()
  {
    for(int y=0;y<size;y++)
    {
      for(int x=0;x<size;x++)
      {
        if(checkOn(x,y))
          boxCounter[(y*10)+x]++;
          
        if(checkNorth(x,y))
          boxCounter[(y*10)+x]++;
          
        if(checkNorthEast(x,y))
          boxCounter[(y*10)+x]++;
          
        if(checkEast(x,y))
          boxCounter[(y*10)+x]++;
          
        if(checkSouthEast(x,y))
          boxCounter[(y*10)+x]++;
          
        if(checkSouth(x,y))
          boxCounter[(y*10)+x]++;
          
        if(checkSouthWest(x,y))
          boxCounter[(y*10)+x]++;
          
        if(checkWest(x,y))
          boxCounter[(y*10)+x]++;
          
        if(checkNorthWest(x,y))
          boxCounter[(y*10)+x]++;
      }
    }
  }

  void drawNumber(int x, int y)
  {
    fill(70,70,70);
    textSize(20);

    if(!containsBomb(x,y))
    {
      fill(235);
      rect(xCoords[x],yCoords[y],50,-50);
      numberColor(x,y);
      if(boxCounter[y*10+x]>0)
        text(boxCounter[y*10+x],xCoords[x]+17,yCoords[y]-15);
    }
  }
  
  boolean containsBomb(int xVal, int yVal)
  {
    for(int x=0;x<10;x++)
    {
      if(xVal*50+50==bombs.bombXCoords(x)&&yVal*50+250==bombs.bombYCoords(x))
        return true;
    }
    return false;
  }
  
  int boxNumber()
  {
    click.whichSquare();
    return boxCounter[click.boxClicked[1]*10+click.boxClicked[0]];
  }
  
  void numberColor(int x, int y)
  {
    if(boxCounter[y*10+x]==0)
      fill(175);
      
    if(boxCounter[y*10+x]==1)
      fill(102,204,0);
    
    if(boxCounter[y*10+x]==2)
      fill(255,128,0);
      
    if(boxCounter[y*10+x]==3)
      fill(255,51,51);
      
    if(boxCounter[y*10+x]==4)
      fill(153,153,255);
      
    if(boxCounter[y*10+x]==5)
      fill(255,102,255);
      
    if(boxCounter[y*10+x]==6)
      fill(204,0,102);
      
    if(boxCounter[y*10+x]==7)
      fill(51,51,255);
      
    if(boxCounter[y*10+x]==8)
      fill(153,0,0);
  }
  
  //Check on method was to test my checking skills. They are on point.
  //in order to see it in action, remove if(!containsBomb(x,y))
  boolean checkOn(int xVal, int yVal)
  {
    for(int x=0;x<10;x++)
    {
      if(xVal*50+50==bombs.bombXCoords(x)&&yVal*50+250==bombs.bombYCoords(x))
        return true;
    }
    return false;
  }
  
  boolean checkNorth(int xVal, int yVal)
  {
    for(int x=0;x<10;x++)
    {
      if(xVal*50+50==bombs.bombXCoords(x)&&yVal*50+200==bombs.bombYCoords(x))
        return true;
    }
    return false;
  }
  
  boolean checkNorthEast(int xVal, int yVal)
  {
    for(int x=0;x<10;x++)
    {
      if(xVal*50+100==bombs.bombXCoords(x)&&yVal*50+200==bombs.bombYCoords(x))
        return true;
    }
    return false;
  }
  
  boolean checkEast(int xVal, int yVal)
  {
    for(int x=0;x<10;x++)
    {
      if(xVal*50+100==bombs.bombXCoords(x)&&yVal*50+250==bombs.bombYCoords(x))
        return true;
    }
    return false;
  }
  
  boolean checkSouthEast(int xVal, int yVal)
  {
    for(int x=0;x<10;x++)
    {
      if(xVal*50+100==bombs.bombXCoords(x)&&yVal*50+300==bombs.bombYCoords(x))
        return true;
    }
    return false;
  }
  
  boolean checkSouth(int xVal, int yVal)
  {
    for(int x=0;x<10;x++)
    {
      if(xVal*50+50==bombs.bombXCoords(x)&&yVal*50+300==bombs.bombYCoords(x))
        return true;
    }
    return false;
  }
  
  boolean checkSouthWest(int xVal, int yVal)
  {
    for(int x=0;x<10;x++)
    {
      if(xVal*50+0==bombs.bombXCoords(x)&&yVal*50+300==bombs.bombYCoords(x))
        return true;
    }
    return false;
  }
  
  boolean checkWest(int xVal, int yVal)
  {
    for(int x=0;x<10;x++)
    {
      if(xVal*50+0==bombs.bombXCoords(x)&&yVal*50+250==bombs.bombYCoords(x))
        return true;
    }
    return false;
  }
  
  boolean checkNorthWest(int xVal, int yVal)
  {
    for(int x=0;x<10;x++)
    {
      if(xVal*50+0==bombs.bombXCoords(x)&&yVal*50+200==bombs.bombYCoords(x))
        return true;
    }
    return false;
  }
}