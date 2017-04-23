package helpers;
import java.util.*;

public class GlobalSymTab
{
    HashMap<String, FuncSymTab> functions = new HashMap<String, FuncSymTab>();
    public FuncSymTab curr_func;

    public boolean v0_used = false;
    public boolean v1_used = false;

    public void add_function(String name, int num_args, int lineno)
    {
        FuncSymTab f = new FuncSymTab(name, num_args, lineno);
        functions.put(name, f);
        curr_func = f;
    }

    public void switch_function(String name)
    {
        curr_func = functions.get(name);
    }

    public FuncSymTab get_function(String name)
    {
        return functions.get(name);
    }

    public void build_live_ranges()
    {
        for(Map.Entry<String, FuncSymTab> entry : functions.entrySet())
        {
            FuncSymTab f = entry.getValue();
            f.build_live_ranges();
        }   
    }

    public void print_live_ranges()
    {
        for(Map.Entry<String, FuncSymTab> entry : functions.entrySet())
        {
            FuncSymTab f = entry.getValue();
            System.out.println("\n"+f.name + ":\n");
            f.print_live_ranges();
        }   
    }

    public void register_alloc()
    {
        for(Map.Entry<String, FuncSymTab> entry : functions.entrySet())
        {
            FuncSymTab f = entry.getValue();
            f.linear_scan();
            // f.print_alloc();
        }
    }

    public void fill_params()
    {
        for(Map.Entry<String, FuncSymTab> entry : functions.entrySet())
        {
            FuncSymTab f = entry.getValue();
            f.fill_params();
        }   
    }


    public void print_alloc()
    {
        for(Map.Entry<String, FuncSymTab> entry : functions.entrySet())
        {
            FuncSymTab f = entry.getValue();
            f.print_alloc();
        }
    }

    public void print_params()
    {
        for(Map.Entry<String, FuncSymTab> entry : functions.entrySet())
        {
            FuncSymTab f = entry.getValue();
            f.print_params();
        }   
    }
}