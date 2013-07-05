package mvc.controller;

/**
 * Created with IntelliJ IDEA.
 * User: jack
 * Date: 3/07/13
 * Time: 10:32 PM
 */
public class IkmTest {
    private static int count;
    static{
        System.out.println("int block 1");
        count=10;
    }

    private int[] data;
    {
        System.out.println("in block 2");
        data=new int[count];
        for(int i=0;i<count;i++){
            data[i]=1;
        }
    }

    public static void main(String arg[]){
        System.out.println("Count="+count);
        System.out.println("before 1st");
        IkmTest t1=new IkmTest();
        System.out.println("before 2nd");
        IkmTest t2=new IkmTest();
    }
}
