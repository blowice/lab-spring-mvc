package mvc.controller;

import java.io.File;

/**
 * Created with IntelliJ IDEA.
 * User: jack
 * Date: 3/07/13
 * Time: 10:49 PM
 */
public class FileClass {
    public static void main(String arg){
        File file=new File("test.txt");
        File backup=new File("test.txt.bak");
        backup.delete();
        file.renameTo(backup);
    }
}
