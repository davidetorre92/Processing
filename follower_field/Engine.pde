public class Engine
{
   Engine()
   {
     
   }
   public void run()
   {
      for(int i = 0; i < nf*df; i++)
      {
      f[i].show();
      f[i].followField();
      }
   }
}
