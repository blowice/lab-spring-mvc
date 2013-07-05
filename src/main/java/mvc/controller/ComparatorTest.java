package mvc.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

/**
 * Created with IntelliJ IDEA.
 * User: jack
 * Date: 3/07/13
 * Time: 10:35 PM
 */
public class ComparatorTest {
    public static void main(String arg[]){
        ArrayList<String> orig=new ArrayList<String>();
        orig.add("Two");
        orig.add("One");
        orig.add("Three");
        orig.add("Four");
        Collections.sort(orig,new Stringsort());
        System.out.println(orig);
    }
    static class Stringsort implements Comparator<String> {
        public int compare(String arg0,String arg1){
            return arg0.charAt(1)-arg1.charAt(1);
        }
    }
}
