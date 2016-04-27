public class Reveal
{
  private ArrayList<Integer> clickedX=new ArrayList<Integer>();
  private ArrayList<Integer> clickedY=new ArrayList<Integer>();
  
  void addClicks(int xBox, int yBox)
  {
    clickedX.add(xBox-1);
    clickedY.add(yBox-1);
    
  //  if(boxNum.boxCounter[(yBox*10)+xBox]==0)
  //    zero.left(xBox,yBox);
  }

  int clickedXValues(int val)
  {
    return clickedX.get(val);
  }
  
  int clickedYValues(int val)
  {
    return clickedY.get(val);
  }
  
  int totalClicks()
  {
    return clickedX.size();
  }
}