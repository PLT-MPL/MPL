import java.io.*;
import java.util.*;
import definition.*;
import function.PublicFunction;

public class RowTheBoatRepeated
{

public static void main(String arg[]){
Music music = PublicFunction.read("RowTheBoatSingle.mid");
Melody melody1 = new Melody(music.getTrack(0).getMelody());
Melody melody2 = new Melody(music.getTrack(0).getMelody());
for(int i = 0;i < melody1.getLength();
i++)
melody1.getNote(i).setStrength(70);

music.getTrack(0).insertMelody(2400, melody1);

PublicFunction.write(music, "RowTheBoatRepeated.mid");

}


}