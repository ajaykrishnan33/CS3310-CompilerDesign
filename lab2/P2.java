import syntaxtree.*;
import visitor.*;

public class P2 {
   public static void main(String [] args) {
      try {
         // Node root = new MiniJavaParser(System.in).Goal();
         MiniJavaParser mjp = new MiniJavaParser(System.in);
         Node root = MiniJavaParser.Goal();
         // System.out.println("Program parsed successfully");
         root.accept(new GJDepthFirst<String, String>(), null); // Your assignment part is invoked here.
      }
      catch (ParseException e) {
         System.out.println(e.toString());
      }
   }
} 


