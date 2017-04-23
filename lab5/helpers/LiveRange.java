package helpers;
import java.util.*;

public class LiveRange implements Comparable<LiveRange>
{
    public int start;
    public int end;
    public int num;

    public boolean spilled = false;
    public String reg;
    public int loc;

    public boolean is_stack_arg = false;

@Override
    public int compareTo(LiveRange lr)
    {
        return this.start - lr.start;
    }
}