import syntaxtree.*;
import visitor.*;

public class Micro {
   public static void main(String [] args) {
      try {
         microIRParser mjp = new microIRParser(System.in);
         Node root = microIRParser.Goal();
         root.accept(new GJNoArguDepthFirst<String>());
         System.out.println("Successfully parsed");
         // System.out.println("TEMP COUNT " + GJNoArguDepthFirst.temp_count);
         // root.accept(new GJDepthFirst<Integer, Integer>(), new Integer(GJNoArguDepthFirst.temp_count)); // Your assignment part is invoked here.
      }
      catch (ParseException e) {
         System.out.println(e.toString());
      }
   }
} 


