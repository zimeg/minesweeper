//BoxClicked is a class to find out which box was clicked, and then
//determine what to do from there.

public class BoxClicked
{
  private int[] boxClicked=new int[2];
  private int[] alignedClick=new int[2];
  
  //whichSquare() is a method to find which square the user clicked
  //and to define the click by the top left point of the box, regardless
  //of where the actually click occured
  void whichSquare()
  {
    //These loops will cycle through all 100 squares
    for(int x=1;x<size+1;x++)
    {
      for(int y=1;y<size+1;y++)
      {
        //Detect which square the click occured in
        if((mouseX>x*50)&&(mouseX<x*50+50)&&(mouseY>y*50+200)&&(mouseY<y*50+250))
        {
          alignToGrid(x,y);
          boxClicked[0]=x;
          boxClicked[1]=y;
        }
      }
    }
  }

  boolean flagTest(int size)
  {
    for(int x=0;x<size;x++)
    {
      whichSquare();
      if(alignedClick[0]==flags.flagXArray().get(x)&&alignedClick[1]==flags.flagYArray().get(x))
        return true;  //return true if already been clicked
    }
    return false;
  }
  
  boolean numTest(int size)
  {
    for(int x=0;x<size;x++)
    {
      whichSquare();
      if(boxClicked[0]-1==show.clickedXValues(x)&&boxClicked[1]-1==show.clickedYValues(x))
        return true;
    }
    return false;
  }
  
  int[] boxClicked()
  {
    return boxClicked;
  }
  
  void alignToGrid(int x, int y)
  {
    alignedClick[0]=x*50;
    alignedClick[1]=y*50+200;
  }
}