//
// Generated by JTB 1.3.2
//

package visitor;
import syntaxtree.*;
import java.util.*;

/**
 * Provides default methods which visit each node in the tree in depth-first
 * order.  Your visitors may extend this class.
 */

class SymTab 
{
    HashMap<String, String> variables = new HashMap<String,String>();
    String block_name;
    String parent;

    public boolean contains_variable(String id)
    {
        return variables.containsKey(id);
    }

    public void put_variable(String id, String type)
    {
        variables.put(id, type);
    }

    public boolean variableExists(String id, GlobalSymTab g)
    {
        if(variables.containsKey(id))
        {
            return true;
        }
        else
        if(parent!=null)
        {
            if(g.contains_class(parent))
            {
                return g.get_class(parent).variableExists(id, g);
            }
        }
        return false;
    }

    public String getVariableType(String id, GlobalSymTab g)
    {
        if(variables.containsKey(id))
        {
            return variables.get(id);
        }
        else
        if(parent!=null)
        {
            if(g.contains_class(parent))
            {
                return g.get_class(parent).getVariableType(id, g);
            }  
        }
        return null;
    }

    public boolean checkVariableIdentifiers(GlobalSymTab g)
    {
        for(Map.Entry<String, String> entry : variables.entrySet())
        {
            String type = entry.getValue();
            if(type.equals("int[]")||type.equals("int")||type.equals("boolean"))
              continue;
            if(!g.contains_class(type))
              return false;
        }
        return true;
    }
}

class MethodSymTab extends SymTab
{
    String return_type;
    ArrayList<String> parameter_list = new ArrayList<String>();

    public MethodSymTab(String block_name, String return_type, GlobalSymTab g)
    {
        this.block_name = block_name;
        this.return_type = return_type;
        this.parent = g.current_scope.block_name;
    }

    public boolean contains_method(String id, GlobalSymTab g)
    {
        if(g.contains_class(parent))
        {
            return g.get_class(parent).contains_method(id, g);
        }
        return false;
    }

    public MethodSymTab get_method(String id, GlobalSymTab g)
    {
        if(g.contains_class(parent))
        {
            return g.get_class(parent).get_method(id, g);
        }
        return null;
    }

    // public boolean checkReturnIdentifier(GlobalSymTab g)
    // {
    //     if(return_type.equals("int[]")||return_type.equals("int")||return_type.equals("boolean"))
    //       return true;

    //     return g.contains_class(return_type);
    // }

    public boolean checkMethodSignature(GlobalSymTab g)
    {
        if(g.contains_class(parent))
        {
            ClassSymTab par = g.get_class(parent);
            if(par.parent!=null)
            {
                if(g.contains_class(par.parent))
                {
                    ClassSymTab sup = g.get_class(par.parent);
                    if(sup.contains_method(block_name, g))
                    {
                        MethodSymTab methd = sup.get_method(block_name, g);
                        if(methd.parameter_list.size()!=parameter_list.size())
                            return false;
                        for(int i=0;i<parameter_list.size();i++)
                        {
                          if(!parameter_list.get(i).equals(methd.parameter_list.get(i)))
                              return false;
                        }
                    }
                }
            } 
        }

        if(return_type.equals("int[]")||return_type.equals("int")||return_type.equals("boolean"))
          return true;

        return g.contains_class(return_type);
    }

}

class ClassSymTab extends SymTab
{
    HashMap<String, MethodSymTab> methods = new HashMap<String, MethodSymTab>();
    boolean verified = false;

    public ClassSymTab(String block_name)
    {
        this.block_name = block_name;
    }

    public ClassSymTab(String block_name, String parent)
    {
        this.block_name = block_name;
        this.parent = parent;
    }

    public void put_method(String id, String return_type, GlobalSymTab g)
    {
        MethodSymTab mst = new MethodSymTab(id, return_type, g);
        g.current_scope = mst;
        methods.put(id, mst);
    }

    public boolean contains_method(String id, GlobalSymTab g)
    {
        if(methods.containsKey(id))
        {
            return true;
        }   
        else
        if(parent!=null)
        {
            if(g.contains_class(parent))
            {
                return g.get_class(parent).contains_method(id, g);
            }  
        }
        return false;  
    }

    public MethodSymTab get_method(String id, GlobalSymTab g)
    {
        if(methods.containsKey(id))
        {
            return methods.get(id);
        }   
        else
        if(parent!=null)
        {
            if(g.contains_class(parent))
            {
                return g.get_class(parent).get_method(id, g);
            }  
        }  
        return null;
    }

    public boolean checkMethodSignatures(GlobalSymTab g)
    {
        for(Map.Entry<String, MethodSymTab> entry : methods.entrySet())
        {
            MethodSymTab func = entry.getValue();

            if(!func.checkMethodSignature(g))
              return false;
        }
        return true;
    }

    public boolean checkMethodVariableIdentifiers(GlobalSymTab g)
    {
        for(Map.Entry<String, MethodSymTab> entry : methods.entrySet())
        {
            MethodSymTab func = entry.getValue();

            if(!func.checkVariableIdentifiers(g))
              return false;
        }
        return true;   
    }

    public boolean checkMethodValidity(GlobalSymTab g)
    {
        if(!this.checkMethodSignatures(g))
            return false;
        if(!this.checkMethodVariableIdentifiers(g))
            return false;
        return true;
    }

    public boolean isAncestor(String class_name, GlobalSymTab g)
    {
        if(block_name == class_name)
          return true;

        if(parent!=null){
            return g.get_class(parent).isAncestor(class_name, g);
        }
        return false;
    }

}

class GlobalSymTab
{
    HashMap<String, ClassSymTab> classes = new HashMap<String, ClassSymTab>();   

    SymTab current_scope; 

    public boolean contains_class(String key)
    {
        return classes.containsKey(key);
    }

    public ClassSymTab get_class(String key)
    {
        return classes.get(key);
    }

    public void put_class(String class_name)
    {
        ClassSymTab st = new ClassSymTab(class_name);
        this.current_scope = st;
        classes.put(class_name, st);
    }

    public void put_class(String class_name, String extends_class)
    {
        ClassSymTab st = new ClassSymTab(class_name, extends_class);
        this.current_scope = st;
        classes.put(class_name, st);
    }

    public boolean checkIfNoLocalCycle(ClassSymTab base)
    {
        ClassSymTab ct;
        if(base.parent==null)
        {
            base.verified = true;
            return true;
        }

        ct = classes.get(base.parent);
        while(ct.parent!=null)
        {
            if(ct.block_name == base.block_name)
                return false;
            ct.verified = true;
            ct = classes.get(ct.parent);
        }
        return true;
    }

    public boolean checkIfNoCycle()
    {
        for(Map.Entry<String, ClassSymTab> entry : classes.entrySet())
        {
            ClassSymTab cst = entry.getValue();
            if(cst.verified)
                continue;
            if(!this.checkIfNoLocalCycle(cst))
                return false;
        }
        return true;
    }

    public boolean checkIfAllPresent()
    {
        for(Map.Entry<String, ClassSymTab> entry : classes.entrySet())
        {
            ClassSymTab cst = entry.getValue();
            if(cst.parent!=null)
            {
                if(!classes.containsKey(cst.parent))
                    return false;  
            }
        }
        return true;
    }

    public boolean checkValidity()
    {
        if(!this.checkIfAllPresent())
            return false;
        if(!this.checkIfNoCycle())
            return false;
        for(Map.Entry<String, ClassSymTab> entry : classes.entrySet())
        {
            ClassSymTab cst = entry.getValue();
            if(!cst.checkMethodValidity(this))
                return false;
            if(!cst.checkVariableIdentifiers(this))
                return false;
        }
        return true;   
    }

}

public class GJDepthFirst<R,A> implements GJVisitor<R,A> {
   //
   // Auto class visitors--probably don't need to be overridden.
   //

   GlobalSymTab g = new GlobalSymTab();

   public void error(int x){
      System.out.println("Type error");
      // System.out.println("Type error "+x);
      System.exit(0);
   }

   public R visit(NodeList n, A argu) {
      R _ret=null;
      int _count=0;
      for ( Enumeration<Node> e = n.elements(); e.hasMoreElements(); ) {
         e.nextElement().accept(this,argu);
         _count++;
      }
      return _ret;
   }

   public R visit(NodeListOptional n, A argu) {
      if ( n.present() ) {
         R _ret=null;
         int _count=0;
         for ( Enumeration<Node> e = n.elements(); e.hasMoreElements(); ) {
            e.nextElement().accept(this,argu);
            _count++;
         }
         return _ret;
      }
      else
         return null;
   }

   public R visit(NodeOptional n, A argu) {
      if ( n.present() )
         return n.node.accept(this,argu);
      else
         return null;
   }

   public R visit(NodeSequence n, A argu) {
      R _ret=null;
      int _count=0;
      for ( Enumeration<Node> e = n.elements(); e.hasMoreElements(); ) {
         e.nextElement().accept(this,argu);
         _count++;
      }
      return _ret;
   }

   public R visit(NodeToken n, A argu) { return null; }

   //
   // User-generated visitor methods below
   //

   /**
    * f0 -> MainClass()
    * f1 -> ( TypeDeclaration() )*
    * f2 -> <EOF>
    */
   public R visit(Goal n, A argu) {
      R _ret=null;

      n.f0.accept(this, (A)"first");
      n.f1.accept(this, (A)"first");
      n.f2.accept(this, (A)"first");
    
      if(!g.checkValidity())
          this.error(0);

      // System.out.println("Preliminary checks passed");

      n.f0.accept(this, (A)"second");
      n.f1.accept(this, (A)"second");
      n.f2.accept(this, (A)"second");

      System.out.println("Program type checked successfully");

      return _ret;
   }

   /**
    * f0 -> "class"
    * f1 -> Identifier()
    * f2 -> "{"
    * f3 -> "public"
    * f4 -> "static"
    * f5 -> "void"
    * f6 -> "main"
    * f7 -> "("
    * f8 -> "String"
    * f9 -> "["
    * f10 -> "]"
    * f11 -> Identifier()
    * f12 -> ")"
    * f13 -> "{"
    * f14 -> PrintStatement()
    * f15 -> "}"
    * f16 -> "}"
    */
   public R visit(MainClass n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      n.f2.accept(this, argu);
      n.f3.accept(this, argu);
      n.f4.accept(this, argu);
      n.f5.accept(this, argu);
      n.f6.accept(this, argu);
      n.f7.accept(this, argu);
      n.f8.accept(this, argu);
      n.f9.accept(this, argu);
      n.f10.accept(this, argu);
      n.f11.accept(this, argu);
      n.f12.accept(this, argu);
      n.f13.accept(this, argu);
      n.f14.accept(this, argu);
      n.f15.accept(this, argu);
      n.f16.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> ClassDeclaration()
    *       | ClassExtendsDeclaration()
    */
   public R visit(TypeDeclaration n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> "class"
    * f1 -> Identifier()
    * f2 -> "{"
    * f3 -> ( VarDeclaration() )*
    * f4 -> ( MethodDeclaration() )*
    * f5 -> "}"
    */
   public R visit(ClassDeclaration n, A argu) {
      R _ret=null;

      n.f0.accept(this, argu);
      String class_name = n.f1.accept(this, argu).toString();
      
      if(argu.toString().equals("first"))
      {
          if(g.contains_class(class_name))
              this.error(1);
          g.put_class(class_name);   
      }
      else
      {
          g.current_scope = g.get_class(class_name);
      }

      n.f2.accept(this, argu);
      n.f3.accept(this, argu);
      n.f4.accept(this, argu);
      n.f5.accept(this, argu);  
        
      g.current_scope = null;

      return _ret;
   }

   /**
    * f0 -> "class"
    * f1 -> Identifier()
    * f2 -> "extends"
    * f3 -> Identifier()
    * f4 -> "{"
    * f5 -> ( VarDeclaration() )*
    * f6 -> ( MethodDeclaration() )*
    * f7 -> "}"
    */
   public R visit(ClassExtendsDeclaration n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      String class_name = n.f1.accept(this, argu).toString();
      n.f2.accept(this, argu);
      String extends_class = n.f3.accept(this, argu).toString();

      if(argu.toString().equals("first"))
      {
          if(g.contains_class(class_name))
              this.error(2);
          g.put_class(class_name, extends_class);   

      }
      else
      {
          g.current_scope = g.get_class(class_name);
      }

      n.f4.accept(this, argu);
      n.f5.accept(this, argu);
      n.f6.accept(this, argu);
      n.f7.accept(this, argu);      

      g.current_scope = null;

      return _ret;
   }

   /**
    * f0 -> Type()
    * f1 -> Identifier()
    * f2 -> ";"
    */
   public R visit(VarDeclaration n, A argu) {
      R _ret=null;
      String type = n.f0.accept(this, argu).toString();
      String id = n.f1.accept(this, argu).toString();
      n.f2.accept(this, argu);

      if(argu.toString().equals("first"))
      {
          if(g.current_scope.contains_variable(id))
              this.error(3);
          
          g.current_scope.put_variable(id, type);
      }
      return _ret;
   }

   /**
    * f0 -> "public"
    * f1 -> Type()
    * f2 -> Identifier()
    * f3 -> "("
    * f4 -> ( FormalParameterList() )?
    * f5 -> ")"
    * f6 -> "{"
    * f7 -> ( VarDeclaration() )*
    * f8 -> ( Statement() )*
    * f9 -> "return"
    * f10 -> Expression()
    * f11 -> ";"
    * f12 -> "}"
    */
   public R visit(MethodDeclaration n, A argu) {
      R _ret=null;

      n.f0.accept(this, argu);
      
      String return_type = n.f1.accept(this, argu).toString();
      String method_name = n.f2.accept(this, argu).toString();
      if(argu.toString().equals("first"))
      {
          if(((ClassSymTab)g.current_scope).methods.containsKey(method_name))
              this.error(4);
          ((ClassSymTab)g.current_scope).put_method(method_name, return_type, g);  // current scope changes to this method  
      }      
      else
      {
          g.current_scope = ((ClassSymTab)g.current_scope).get_method(method_name, g);
      }

      n.f3.accept(this, argu);
      n.f4.accept(this, argu);
      n.f5.accept(this, argu);
      n.f6.accept(this, argu);
      n.f7.accept(this, argu);
      n.f8.accept(this, argu);
      n.f9.accept(this, argu);
      n.f10.accept(this, argu);
      n.f11.accept(this, argu);
      n.f12.accept(this, argu);  

      g.current_scope = g.get_class(g.current_scope.parent);
      
      return _ret;
   }

   /**
    * f0 -> FormalParameter()
    * f1 -> ( FormalParameterRest() )*
    */
   public R visit(FormalParameterList n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> Type()
    * f1 -> Identifier()
    */
   public R visit(FormalParameter n, A argu) {
      R _ret=null;
      String type = n.f0.accept(this, argu).toString();
      String id = n.f1.accept(this, argu).toString();
      if(argu.toString().equals("first"))
      {
          if(g.current_scope.contains_variable(id))
              this.error(5);

          g.current_scope.put_variable(id, type);

          ((MethodSymTab)g.current_scope).parameter_list.add(type); // current scope = current method
      }
      return _ret;
   }

   /**
    * f0 -> ","
    * f1 -> FormalParameter()
    */
   public R visit(FormalParameterRest n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> ArrayType()
    *       | BooleanType()
    *       | IntegerType()
    *       | Identifier()
    */
   public R visit(Type n, A argu) {
      R _ret=null;
      _ret = n.f0.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> "int"
    * f1 -> "["
    * f2 -> "]"
    */
   public R visit(ArrayType n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      n.f2.accept(this, argu);
      _ret = (R) "int[]";
      return _ret;
   }

   /**
    * f0 -> "boolean"
    */
   public R visit(BooleanType n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      _ret = (R) "boolean";
      return _ret;
   }

   /**
    * f0 -> "int"
    */
   public R visit(IntegerType n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      _ret = (R) "int";
      return _ret;
   }

   /**
    * f0 -> Block()
    *       | AssignmentStatement()
    *       | ArrayAssignmentStatement()
    *       | IfStatement()
    *       | WhileStatement()
    *       | PrintStatement()
    */
   public R visit(Statement n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> "{"
    * f1 -> ( Statement() )*
    * f2 -> "}"
    */
   public R visit(Block n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      n.f2.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> Identifier()
    * f1 -> "="
    * f2 -> Expression()
    * f3 -> ";"
    */
   public R visit(AssignmentStatement n, A argu) {
      R _ret=null;
      R id = n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      R val_type = n.f2.accept(this, argu);
      n.f3.accept(this, argu);

      if(argu.toString().equals("second")){        
        if(!g.current_scope.variableExists(id.toString(), g))
            this.error(55);
        String var_type = g.current_scope.getVariableType(id.toString(), g);
        if(var_type.equals("int")||var_type.equals("boolean")||var_type.equals("int[]")){
          if(!var_type.equals(val_type.toString()))
            this.error(56);
        }
        else
        {
          if(!g.contains_class(var_type) || !g.contains_class(val_type.toString()))
            this.error(57);
          ClassSymTab class_name = g.get_class(val_type.toString());
          if(!class_name.isAncestor(var_type, g)){
            this.error(58);
          }
        }
      }

      return _ret;
   }

   /**
    * f0 -> Identifier()
    * f1 -> "["
    * f2 -> Expression()
    * f3 -> "]"
    * f4 -> "="
    * f5 -> Expression()
    * f6 -> ";"
    */
   public R visit(ArrayAssignmentStatement n, A argu) {
      R _ret=null;
      R id = n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      R index_type = n.f2.accept(this, argu);
      n.f3.accept(this, argu);
      n.f4.accept(this, argu);
      R val_type = n.f5.accept(this, argu);
      n.f6.accept(this, argu);

      if(argu.toString().equals("second")){
        if(!val_type.toString().equals("int"))
        {
            this.error(47);
        }
        if(!index_type.toString().equals("int"))
        {
            this.error(46);
        }
        if(!g.current_scope.variableExists(id.toString(), g))
            this.error(53);
        String var_type = g.current_scope.getVariableType(id.toString(), g);
        if(!var_type.equals("int[]")){
          this.error(54);
        }
      }

      return _ret;
   }

   /**
    * f0 -> IfthenElseStatement()
    *       | IfthenStatement()
    */
   public R visit(IfStatement n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> "if"
    * f1 -> "("
    * f2 -> Expression()
    * f3 -> ")"
    * f4 -> Statement()
    */
   public R visit(IfthenStatement n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      R val_type = n.f2.accept(this, argu);
      n.f3.accept(this, argu);
      n.f4.accept(this, argu);

      if(argu.toString().equals("second")){
        if(!val_type.toString().equals("boolean"))
        {
            this.error(48);
        }
      }
      return _ret;
   }

   /**
    * f0 -> "if"
    * f1 -> "("
    * f2 -> Expression()
    * f3 -> ")"
    * f4 -> Statement()
    * f5 -> "else"
    * f6 -> Statement()
    */
   public R visit(IfthenElseStatement n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      R val_type = n.f2.accept(this, argu);
      n.f3.accept(this, argu);
      n.f4.accept(this, argu);
      n.f5.accept(this, argu);
      n.f6.accept(this, argu);

      if(argu.toString().equals("second")){
        if(!val_type.toString().equals("boolean"))
        {
            this.error(49);
        }
      }
      return _ret;
   }

   /**
    * f0 -> "while"
    * f1 -> "("
    * f2 -> Expression()
    * f3 -> ")"
    * f4 -> Statement()
    */
   public R visit(WhileStatement n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      R val_type = n.f2.accept(this, argu);
      n.f3.accept(this, argu);
      n.f4.accept(this, argu);
      if(argu.toString().equals("second")){
        if(!val_type.toString().equals("boolean"))
        {
            this.error(50);
        }
      }
      return _ret;
   }

   /**
    * f0 -> "System.out.println"
    * f1 -> "("
    * f2 -> Expression()
    * f3 -> ")"
    * f4 -> ";"
    */
   public R visit(PrintStatement n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      R val_type = n.f2.accept(this, argu);
      n.f3.accept(this, argu);
      n.f4.accept(this, argu);
      if(argu.toString().equals("second")){
        if(!val_type.toString().equals("int")){
          this.error(45);
        }
      }
      return _ret;
   }

   /**
    * f0 -> OrExpression()
    *       | AndExpression()
    *       | CompareExpression()
    *       | neqExpression()
    *       | PlusExpression()
    *       | MinusExpression()
    *       | TimesExpression()
    *       | DivExpression()
    *       | ArrayLookup()
    *       | ArrayLength()
    *       | MessageSend()
    *       | PrimaryExpression()
    */
   public R visit(Expression n, A argu) {
      R _ret=null;
      _ret = n.f0.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> PrimaryExpression()
    * f1 -> "&&"
    * f2 -> PrimaryExpression()
    */
   public R visit(AndExpression n, A argu) {
      R _ret=null;
      R a1 = n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      R a2 = n.f2.accept(this, argu);
      if(argu.toString().equals("second")) 
      {
          if(!a1.toString().equals("boolean") || !a2.toString().equals("boolean"))
              this.error(23);
      }
      _ret = (R) "boolean";
      return _ret;
   }

   /**
    * f0 -> PrimaryExpression()
    * f1 -> "||"
    * f2 -> PrimaryExpression()
    */
   public R visit(OrExpression n, A argu) {
      R _ret=null;
      R a1 = n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      R a2 = n.f2.accept(this, argu);
      if(argu.toString().equals("second")) 
      {
          if(!a1.toString().equals("boolean") || !a2.toString().equals("boolean"))
              this.error(22);
      }
      _ret = (R) "boolean";
      return _ret;
   }

   /**
    * f0 -> PrimaryExpression()
    * f1 -> "<="
    * f2 -> PrimaryExpression()
    */
   public R visit(CompareExpression n, A argu) {
      R _ret=null;
      R a1 = n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      R a2 = n.f2.accept(this, argu);
      if(argu.toString().equals("second")) 
      {
          if(!a1.toString().equals("int") || !a2.toString().equals("int"))
              this.error(21);
      }
      _ret = (R) "boolean";
      return _ret;
   }

   /**
    * f0 -> PrimaryExpression()
    * f1 -> "!="
    * f2 -> PrimaryExpression()
    */
   public R visit(neqExpression n, A argu) {
      R _ret=null;
      R b1 = n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      R b2 = n.f2.accept(this, argu);
      if(argu.toString().equals("second")) 
      {
          String a1 = b1.toString();
          String a2 = b2.toString();
          if(!a1.equals(a2))
          {
              if(a1.equals("int")||a1.equals("int[]")||a1.equals("boolean")||a2.equals("int")||a2.equals("int[]")||a2.equals("boolean"))
                  this.error(17);
              ClassSymTab class1 = null, class2 = null;
              
              if(g.contains_class(a1))
                class1 = g.get_class(a1);
              else
                this.error(19);

              if(g.contains_class(a2))
                class2 = g.get_class(a2);
              else
                this.error(20);

              if(!class1.isAncestor(a2, g) && !class2.isAncestor(a1, g))
                this.error(18);
          }
      }    
      _ret = (R) "boolean";
      return _ret;
   }

   /**
    * f0 -> PrimaryExpression()
    * f1 -> "+"
    * f2 -> PrimaryExpression()
    */
   public R visit(PlusExpression n, A argu) {
      R _ret=null;
      R a1 = n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      R a2 = n.f2.accept(this, argu);
      if(argu.toString().equals("second")) 
      {
          if(!a1.toString().equals("int") || !a2.toString().equals("int"))
              this.error(16);
      }
      _ret = (R) "int";
      return _ret;
   }

   /**
    * f0 -> PrimaryExpression()
    * f1 -> "-"
    * f2 -> PrimaryExpression()
    */
   public R visit(MinusExpression n, A argu) {
      R _ret=null;
      R a1 = n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      R a2 = n.f2.accept(this, argu);
      if(argu.toString().equals("second")) 
      {
          if(!a1.toString().equals("int") || !a2.toString().equals("int"))
              this.error(16);
      }
      _ret = (R) "int";
      return _ret;
   }

   /**
    * f0 -> PrimaryExpression()
    * f1 -> "*"
    * f2 -> PrimaryExpression()
    */
   public R visit(TimesExpression n, A argu) {
      R _ret=null;
      R a1 = n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      R a2 = n.f2.accept(this, argu);
      if(argu.toString().equals("second")) 
      {
          if(!a1.toString().equals("int") || !a2.toString().equals("int"))
              this.error(15);
      }
      _ret = (R) "int";
      return _ret;
   }

   /**
    * f0 -> PrimaryExpression()
    * f1 -> "/"
    * f2 -> PrimaryExpression()
    */
   public R visit(DivExpression n, A argu) {
      R _ret=null;
      R dividend = n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      R divisor = n.f2.accept(this, argu);
      if(argu.toString().equals("second"))
      { 
          if(!dividend.toString().equals("int") || !divisor.toString().equals("int"))
              this.error(14);
      }
      _ret = (R) "int";
      return _ret;
   }

   /**
    * f0 -> PrimaryExpression()
    * f1 -> "["
    * f2 -> PrimaryExpression()
    * f3 -> "]"
    */
   public R visit(ArrayLookup n, A argu) {
      R _ret=null;
      R outer_type = n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      R inner_type = n.f2.accept(this, argu);
      n.f3.accept(this, argu);
      if(argu.toString().equals("second"))
      {
          if(!outer_type.toString().equals("int[]"))
              this.error(12);
          if(!inner_type.toString().equals("int"))
              this.error(13);
      }
      _ret = (R) "int";
      return _ret;
   }

   /**
    * f0 -> PrimaryExpression()
    * f1 -> "."
    * f2 -> "length"
    */
   public R visit(ArrayLength n, A argu) {
      R _ret=null;
      R exp_type = n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      n.f2.accept(this, argu);
      if(argu.toString().equals("second")) 
      {
          if(!exp_type.toString().equals("int[]"))
            this.error(11);   
      }
      
      _ret = (R) "int";
      return _ret;
   }

   /**
    * f0 -> PrimaryExpression()
    * f1 -> "."
    * f2 -> Identifier()
    * f3 -> "("
    * f4 -> ( ExpressionList() )?
    * f5 -> ")"
    */
   public R visit(MessageSend n, A argu) {
      R _ret=null;
      R class_name = n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      R func_name = n.f2.accept(this, argu);
      n.f3.accept(this, argu);
      R expr_str = n.f4.accept(this, argu);
      n.f5.accept(this, argu);

      ArrayList<String> expr_list = new ArrayList<String>();
      if(argu.toString().equals("second")) 
      {
          if(!g.contains_class(class_name.toString()))
            this.error(22);

          if(!g.get_class(class_name.toString()).contains_method(func_name.toString(), g))
            this.error(23);

          MethodSymTab func = g.get_class(class_name.toString()).get_method(func_name.toString(), g);
          _ret = (R) func.return_type;

          if(n.f4.present())
          {
            StringTokenizer strtok = new StringTokenizer(expr_str.toString(), ",");
            while(strtok.hasMoreElements())
            {
                expr_list.add(strtok.nextToken());
            }    
          }

          if(expr_list.size() != func.parameter_list.size())
            this.error(30);

          int i;
          for(i=0;i<expr_list.size();i++)
          {
              if(!expr_list.get(i).equals(func.parameter_list.get(i))){
                if(g.contains_class(expr_list.get(i)) && g.contains_class(func.parameter_list.get(i))){
                    ClassSymTab class_type = g.get_class(expr_list.get(i));
                    if(!class_type.isAncestor(func.parameter_list.get(i), g)){
                        this.error(64);
                    }
                }
                else
                  this.error(10);
              }
          }
      }
      return _ret;
   }

   /**
    * f0 -> Expression()
    * f1 -> ( ExpressionRest() )*
    */
   public R visit(ExpressionList n, A argu) {
      R _ret = n.f0.accept(this, argu);
      if(argu.toString().equals("second")) 
      {
          if(n.f1.present())
          {
              int i;
              for(i=0;i<n.f1.size();i++)
              {
                  _ret += "," + n.f1.elementAt(i).accept(this, argu).toString();
              }
          }  
      }
      
      return _ret;
   }

   /**
    * f0 -> ","
    * f1 -> Expression()
    */
   public R visit(ExpressionRest n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      _ret = n.f1.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> IntegerLiteral()
    *       | TrueLiteral()
    *       | FalseLiteral()
    *       | Identifier()
    *       | ThisExpression()
    *       | ArrayAllocationExpression()
    *       | AllocationExpression()
    *       | NotExpression()
    *       | BracketExpression()
    */
   public R visit(PrimaryExpression n, A argu) {
      R _ret=null;
      _ret = n.f0.accept(this, argu);
      if(n.f0.which==3)
      {
          if(!g.current_scope.variableExists(_ret.toString(), g))
            this.error(24);
          _ret = (R)g.current_scope.getVariableType(_ret.toString(), g);
      }
      return _ret;
   }

   /**
    * f0 -> <INTEGER_LITERAL>
    */
   public R visit(IntegerLiteral n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      _ret = (R)"int";
      return _ret;
   }

   /**
    * f0 -> "true"
    */
   public R visit(TrueLiteral n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      _ret = (R)"boolean";
      return _ret;
   }

   /**
    * f0 -> "false"
    */
   public R visit(FalseLiteral n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      _ret = (R)"boolean";
      return _ret;
   }

   /**
    * f0 -> <IDENTIFIER>
    */
   public R visit(Identifier n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      _ret = (R) n.f0.toString();
      return _ret;
   }

   /**
    * f0 -> "this"
    */
   public R visit(ThisExpression n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      if(argu.toString().equals("second"))
      {
          if(g.current_scope instanceof MethodSymTab)
              _ret = (R) g.current_scope.parent;  
          else
              _ret = (R) g.current_scope.block_name;
      }
      
      return _ret;
   }

   /**
    * f0 -> "new"
    * f1 -> "int"
    * f2 -> "["
    * f3 -> Expression()
    * f4 -> "]"
    */
   public R visit(ArrayAllocationExpression n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      n.f2.accept(this, argu);
      String index_type = n.f3.accept(this, argu).toString();
      n.f4.accept(this, argu);
      if(argu.toString().equals("second"))
      {
          if(!index_type.equals("int"))
              this.error(8);  
      }      
      _ret = (R) "int[]";
      return _ret;
   }

   /**
    * f0 -> "new"
    * f1 -> Identifier()
    * f2 -> "("
    * f3 -> ")"
    */
   public R visit(AllocationExpression n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      _ret = n.f1.accept(this, argu);
      n.f2.accept(this, argu);
      n.f3.accept(this, argu);
      if(argu.toString().equals("second"))
      {
          if(!g.contains_class(_ret.toString()))
              this.error(6);  
      }
      return _ret;
   }

   /**
    * f0 -> "!"
    * f1 -> Expression()
    */
   public R visit(NotExpression n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      _ret = n.f1.accept(this, argu);
      if(argu.toString().equals("second"))
      {
          if(!_ret.toString().equals("boolean"))
              this.error(7);
      }
      return _ret;
   }

   /**
    * f0 -> "("
    * f1 -> Expression()
    * f2 -> ")"
    */
   public R visit(BracketExpression n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      _ret = n.f1.accept(this, argu);
      n.f2.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> Identifier()
    * f1 -> ( IdentifierRest() )*
    */
   public R visit(IdentifierList n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> ","
    * f1 -> Identifier()
    */
   public R visit(IdentifierRest n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      return _ret;
   }

}
