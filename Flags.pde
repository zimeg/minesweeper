public class Flags
{
  private ArrayList<Integer> gridX=new ArrayList<Integer>();
  private ArrayList<Integer> gridY=new ArrayList<Integer>();
  
  //If the user right clicks, a flag is put into place.
  void flagDraw()
  {
    for(int x=0;x<gridX.size();x++)
    {  //The +5 and +2 offset is put into place so the grid is not overlapped.
      image(flag,gridX.get(x)+5,gridY.get(x)+2,40,46);
    }
  }
  
  void addFlagArray()
  {
      //If no click, then run.
      if(!click.flagTest(flags.gridX.size())&&totalFlags>0)
      {
        //This adds the previously clicked boxes to an ArrayList
        //of all the right clicks
        gridX.add(click.boxClicked()[0]*50);
        gridY.add(click.boxClicked()[1]*50+200);
        totalFlags--;
      }
  }
  
  void removeFlagArray()
  {
    for(int x=0;x<gridX.size();x++)
    {
      if(click.boxClicked()[0]*50==gridX.get(x)&&(click.boxClicked()[1]*50+200==gridY.get(x)))
      {
        gridX.remove(x);
        gridY.remove(x);
        totalFlags++;
      }
    }
  }
  
  void displayFlagNum()
  {
    fill(255,0,0);
    textSize(15);
    text("Flags remaining: "+totalFlags,440,790);
  }
  
  //These methods allow the location of where the flags are to
  //be known globally.
  ArrayList<Integer> flagXArray()
  {
    return gridX;
  }
  
  ArrayList<Integer> flagYArray()
  {
    return gridY;
  }
}