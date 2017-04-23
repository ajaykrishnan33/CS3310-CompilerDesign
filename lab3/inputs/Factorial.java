class Factorial{
    public static void main(String[] a){
        System.out.println((new Fac().ComputeFac(10))[0]);
    }
}

class Fac {
    int[] lump;
    public int[] ComputeFac(int num){
        // int num_aux ;
        // if ((num <= 1)&&(num != 1))
        //     num_aux = (1+0) ;
        // else
        //     num_aux = num * (this.ComputeFac(num-1)) ;
        // return num_aux ;
        A x;
        A y;
        int p;
        int[] q;
        y = new A();
        p = y.bar1(23);
        p = y.bar2(23);
        p = y.bar3(23);
        q = y.foo(100);
        lump = new int[200];
        return lump;
    }
}

class C{
    int m;
    public A goo(int p){
        A x;
        x = new A();
        return x;
    }
    public int bar1(int b){
        m = 42;
        return b+5;
    }
    public int get_m(){
        System.out.println(0);
        return m;
    }
}

class B extends C{
    public int[] foo(int a){
        int[] num;
        num = new int[a];
        num[a-1] = 1234;
        return num;
    }
    public int bar2(int b){
        m = 99-102;
        return b + 10;
    }
    // public int get_m(){
    //     System.out.println(1);
    //     return m;
    // }
}

class A extends B {
    int m;
    public int bar3(int b){
        m = 101;
        return b;
    }
    public int random(){
        return 1;
    }
    // public int get_m(){
    //     System.out.println(2);
    //     return m;
    // }
}