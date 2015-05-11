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
melody1.changeStrength(70);

melody2.changeStrength(40);

music.getTrack(0).insertMelody(2400, melody1);

music.getTrack(0).insertMelody(4800, melody2);

PublicFunction.write(music, "RowTheBoatRepeated.mid");

}


}