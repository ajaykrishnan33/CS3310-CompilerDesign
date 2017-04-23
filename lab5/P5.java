import syntaxtree.*;
import visitor.*;

public class P5 {
   public static void main(String [] args) {
      try {
         microIRParser mjp = new microIRParser(System.in);
         Node root = microIRParser.Goal();
         // root.accept(new GJNoArguDepthFirst<String>());
         PreliminaryScan ps = new PreliminaryScan<String, String>();
         root.accept(ps, null);
         RegisterAlloc ra =  new RegisterAlloc<String, String>(ps.g);
         root.accept(ra, null);
         root.accept(new CodeGenerate<String, String>(ra.g), null);
      }
      catch (ParseException e) {
         System.out.println(e.toString());
      }
   }
} 


