package helpers;
import java.util.*;

public class LinearScan
{
    ArrayList<LiveRange> active;
    ArrayList<LiveRange> ranges;

    ArrayList<String> free_regs; 

    int total_regs;
    int stack_offset = 0;

    public LinearScan(ArrayList<LiveRange> ranges, ArrayList<String> free_regs)
    { 
        this.total_regs = free_regs.size();
        int i;
        this.free_regs = free_regs;
        this.ranges = ranges;
        Collections.sort(this.ranges);
        this.active = new ArrayList<LiveRange>();
        this.allocate();
    }

    private String get_next_reg()
    {
        Collections.sort(free_regs);
        String ret = this.free_regs.get(0);
        this.free_regs.remove(0);
        return ret;
    }

    private int get_next_loc()
    {
        return stack_offset++;
    }

    private void add_to_active(LiveRange lr)
    {
        this.active.add(lr);
        Collections.sort(this.active, new Comparator<LiveRange>() {
            @Override
            public int compare(LiveRange lr1, LiveRange lr2)
            {
                return  lr1.end - lr2.end;
            }
        });
    }

    private void allocate()
    {
        int i;
        for(i=0;i<ranges.size();i++)
        {
            LiveRange lr = ranges.get(i);
            expire_old(lr);
            if(active.size() == total_regs)
                spill_at(lr);
            else
            {
                lr.reg = get_next_reg();
                add_to_active(lr);
            }
        }
    }

    private void expire_old(LiveRange lr)
    {
        int i;
        Iterator itr = active.iterator();
        while(itr.hasNext())
        {
            LiveRange curr = (LiveRange)itr.next();
            if(curr.end >= lr.start)
              return;
            free_regs.add(curr.reg);
            itr.remove();
        }
    }

    private void spill_at(LiveRange lr)
    {
        LiveRange spill = active.get(active.size()-1);
        if(spill.end > lr.end)
        {
            spill.spilled = true;
            lr.reg = spill.reg;
            if(spill.is_stack_arg)          // if stack argument, then set loc to 
                spill.loc = spill.num - 4;  // original pos on stack
            else
                spill.loc = get_next_loc();
            active.remove(active.size()-1);
            add_to_active(lr);
        }
        else
        {
            lr.spilled = true;
            if(lr.is_stack_arg)       // if stack argument, then set loc to 
                lr.loc = lr.num - 4;  // original pos on stack
            else
                lr.loc = get_next_loc();
        }
    }
}