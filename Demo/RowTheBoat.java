import java.io.*;
import java.util.*;
import definition.*;
import function.PublicFunction;

public class RowTheBoat
{

public static void main(String arg[]){
List<Note> notes = new ArrayList<Note>(Arrays.asList(new Note(C.C4, 600), new Note(C.C4, 600), new Note(C.C4, 450), new Note(C.D4, 150), new Note(C.E4, 600), new Note(C.E4, 450), new Note(C.D4, 150), new Note(C.E4, 450), new Note(C.F4, 150), new Note(C.G4, 1200), new Note(C.C5, 200), new Note(C.C5, 200), new Note(C.C5, 200), new Note(C.G4, 200), new Note(C.G4, 200), new Note(C.G4, 200), new Note(C.E4, 200), new Note(C.E4, 200), new Note(C.E4, 200), new Note(C.C4, 200), new Note(C.C4, 200), new Note(C.C4, 200), new Note(C.G4, 450), new Note(C.F4, 150), new Note(C.E4, 450), new Note(C.D4, 150), new Note(C.C4, 600)));
Melody melody = new Melody(notes);
List<Track> tracks = new ArrayList<Track>(Arrays.asList(new Track(melody)));
Music music = new Music(tracks);
PublicFunction.write(music, "RowTheBoatSingle.mid");

}


}