import java.io.*;
import java.util.*;
import definition.*;
import function.PublicFunction;

public class test1
{

public static void main(String arg[]){
String path0 = "twinkle_twinkle0.mid";
String path1 = "twinkle_twinkle1.mid";
Music music0 = PublicFunction.read(path0);
Music music1 = PublicFunction.read(path1);
Music music = PublicFunction.addMusic(music0, music1);
PublicFunction.write(music, "new_twinkle_twinkle.mid");

PublicFunction.print("Done...\n");

}


}