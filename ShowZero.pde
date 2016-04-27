public class ShowZero
{
  void surround(int xBox, int yBox)
  {
  //  if(boxNum.boxNumber()==0)
  //  {
      if(xBox>0&&yBox>0&&xBox<9&&yBox<9)
      {
        for(int y=0;y<3;y++)
        {
          for(int x=0;x<3;x++)
          {
            show.addClicks((xBox+(x-1)),(yBox+(y-1)));
          }
        }
      }
  //  }
  }
}