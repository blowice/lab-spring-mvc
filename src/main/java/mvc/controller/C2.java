package mvc.controller;

/**
 * Created with IntelliJ IDEA.
 * User: jack
 * Date: 3/07/13
 * Time: 10:43 PM
 */
interface I1{
    String name="N1" ;
    String s1="S1";
}

interface I2 extends I1{
    String name="N2";
}
public class C2 implements I2{
    public static void main(String arg[]){
        System.out.println(I2.name+","+I2.s1+","+((I1)new C2()).name);
    }
}
