class Factorial{
    public static void main(String[] a){
        System.out.println(new Fac().ComputeFac((10+0)));
    }
}

class Fac extends B
{
    public int ComputeFac(int num){
        int num_aux ;
        if ((num <= 1)&&(num != 1))
            num_aux = (1+0) ;
        else
            num_aux = num * (this.ComputeFac(num-1)) ;
        return num_aux ;
    }
}

class B extends C
{
    public int ComputeFac(int num){
        int num_aux ;
        if ((num <= 1)&&(num != 1))
            num_aux = (1+0) ;
        else
            num_aux = num * (this.ComputeFac(num-1)) ;
        return num_aux ;
    }   
}

class D {
    public int fixer(){
        C x;
        B y;
        x = new B();
        y = new B();
        return 4;
    }
}

class C{ 
    public int ComputeFac(int num){
        int num_aux ;
        if ((num <= 1)&&(num != 1))
            num_aux = (1+0) ;
        else
            num_aux = num * (this.ComputeFac(num-1)) ;
        return num_aux ;
    }   
}
