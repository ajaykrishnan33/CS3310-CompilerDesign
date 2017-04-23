import syntaxtree.*;
import visitor.*;

public class P6 {
   public static void main(String [] args) {
      try {
         MiniRAParser mjp = new MiniRAParser(System.in);
         Node root = MiniRAParser.Goal();
         root.accept(new CodeGenerate<String, String>(), null);
      }
      catch (ParseException e) {
         System.out.println(e.toString());
      }
   }
} 


