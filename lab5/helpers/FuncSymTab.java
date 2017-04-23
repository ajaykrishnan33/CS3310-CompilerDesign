package helpers;
import java.util.*;

public class FuncSymTab 
{
    public String name;
    public int num_args;
    public int stack_slots;
    public int max_args_used;
    public int max_saved;
    public int max_unsaved;
    public int esp1;
    public int esp2;

    public int lineno;
    public HashMap<Integer, ArrayList<Integer>> in;
    public HashMap<Integer, ArrayList<Integer>> out;
    public HashMap<String, Integer> labels = new HashMap<String, Integer>();

    ArrayList<String> free_regs;   
    HashMap<Integer, LiveRange> ranges = new HashMap<Integer, LiveRange>();

    public FuncSymTab(String name, int num_args, int lineno)
    {
        String[] reg_list = {"s0", "s1", "s2", "s3", "s4", "s5", "s6", "s7", "t0", "t1", "t2", "t3", "t4", "t5", "t6", "t7", "t8", "t9"};

        this.name = name;
        this.num_args = num_args;
        this.stack_slots = 0;
        this.max_args_used = 0;  
        this.max_saved = -1;
        this.max_unsaved = -1;
        this.esp1 = 0;
        this.esp2 = 0;
        this.lineno = lineno;

        int i;
        this.free_regs = new ArrayList<String>();
        for(i=0;i<reg_list.length;i++)
            this.free_regs.add(reg_list[i]);
    }

    public void add_label(String lab, int ln)
    {
        labels.put(lab, ln);
    }

    public LiveRange get_range(int num)
    {
        return ranges.get(num);
    }

    public void build_live_ranges()
    {
        LiveRange lr;
        int line;
        for(Map.Entry<Integer, ArrayList<Integer>> entry : out.entrySet())
        {
            line = entry.getKey();
            for(int t : entry.getValue())
            {
                if(!ranges.containsKey(t))
                {
                    lr = new LiveRange();
                    if(t<num_args && t>3)
                        lr.is_stack_arg = true;

                    lr.num = t;
                    lr.start = line;
                    lr.end = line;
                    ranges.put(t, lr);
                }
                else
                {
                    lr = ranges.get(t);
                    if(line < lr.start)
                        lr.start = line;
                    if(line > lr.end)
                        lr.end = line;
                }
            }
        }
        for(Map.Entry<Integer, ArrayList<Integer>> entry : in.entrySet())
        {
            line = entry.getKey();
            for(int t : entry.getValue())
            {
                if(!ranges.containsKey(t))
                {
                    lr = new LiveRange();
                    if(t<num_args && t>3)
                        lr.is_stack_arg = true;

                    lr.num = t;
                    lr.start = line;
                    lr.end = line;
                    ranges.put(t, lr);
                }
                else
                {
                    lr = ranges.get(t);
                    if(line < lr.start)
                        lr.start = line;
                    if(line > lr.end)
                        lr.end = line;
                }
            }
        }
    }

    public void print_live_ranges()
    {
        LiveRange lr;
        for(Map.Entry<Integer, LiveRange> entry : ranges.entrySet())
        {
            lr = entry.getValue();
            System.out.println("TEMP " + lr.num + " : " + lr.start + " - " + lr.end + "\n");
        }
    }

    public void fill_params()
    {
        if(num_args>4)
        {
            stack_slots += num_args - 4;    // stack slots for spillover args
        }
        esp1 = stack_slots;
        int temp;

        for(Map.Entry<Integer, LiveRange> entry : ranges.entrySet())
        {
            LiveRange lr = entry.getValue();
            if(!lr.spilled)
            {
                if(lr.reg.charAt(0)=='s')
                {
                    temp = (int)lr.reg.charAt(1) - 48;
                    if(temp>max_saved)
                        max_saved = temp;
                }
                else
                {
                    temp = (int)lr.reg.charAt(1) - 48;
                    if(temp>max_unsaved)
                        max_unsaved = temp;
                }
            }
        }

        if(max_saved>=0)
            stack_slots += max_saved+1;
        esp2 = stack_slots;

        for(Map.Entry<Integer, LiveRange> entry : ranges.entrySet())
        {
            LiveRange lr = entry.getValue();
            if(lr.spilled && !lr.is_stack_arg)
            {
                lr.loc += esp2;      // index on the stack
                stack_slots++;    // each spilled register contributes an additional stack slot
            }
        }

        esp2 = stack_slots;

        if(max_args_used>0 && max_unsaved>=0)  // implies CALL used within the function body
            stack_slots += max_unsaved+1;       // for the 10 caller saved registers(t0-t9)

    }

    public void linear_scan()
    {
        ArrayList<LiveRange> lrs = new ArrayList<LiveRange>();
        for(Map.Entry<Integer, LiveRange> entry : ranges.entrySet())
        {
            lrs.add(entry.getValue());
        }        
        LinearScan ls = new LinearScan(lrs, free_regs);
    }

    public void print_alloc()
    {
        System.out.println(name + ":");
        for(Map.Entry<Integer, LiveRange> entry : ranges.entrySet())
        {
            LiveRange lr = entry.getValue();
            System.out.println("TEMP " + lr.num +"\nstart:"+lr.start+"\nend:"+lr.end+"\nspilled:"+lr.spilled+"\nis_stack_arg:"+lr.is_stack_arg);
            if(lr.spilled)
              System.out.println("loc:"+lr.loc+"\n");
            else
              System.out.println("reg:"+lr.reg+"\n");
        }
    }

    public void print_params()
    {
        System.out.println(name + " [" + num_args + "] [" + stack_slots + "] [" + max_args_used +  "]");
    }
}