import java.io.*;
import java.util.*;
import definition.*;
import function.PublicFunction;

public class RaiseTone
{

public static void main(String arg[]){
Music music = PublicFunction.read("ChromaticScale.mid");
for(int i = 0;i < music.getTrack(0).getMelody().getLength();
i++)
{
  music.getTrack(0).getMelody().getNote(i).plus(12);

}
PublicFunction.write(music, "RaiseTone.mid");

}


}