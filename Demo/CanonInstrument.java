import java.io.*;
import java.util.*;
import definition.*;
import function.PublicFunction;

public class CanonInstrument
{

public static void main(String arg[]){
List<Note> notes0 = new ArrayList<Note>(Arrays.asList(new Note(C.G5, 400), new Note(C.E5, 200), new Note(C.F5, 200), new Note(C.G5, 400), new Note(C.E5, 200), new Note(C.F5, 200), new Note(C.G5, 200), new Note(C.G4, 200), new Note(C.A4, 200), new Note(C.B4, 200), new Note(C.C5, 200), new Note(C.D5, 200), new Note(C.E5, 200), new Note(C.F5, 200), new Note(C.E5, 400), new Note(C.C5, 200), new Note(C.D5, 200), new Note(C.E5, 400), new Note(C.E4, 200), new Note(C.F4, 200), new Note(C.G4, 200), new Note(C.A4, 200), new Note(C.G4, 200), new Note(C.F4, 200), new Note(C.G4, 200), new Note(C.C5, 200), new Note(C.B4, 200), new Note(C.C5, 200), new Note(C.A4, 400), new Note(C.C5, 200), new Note(C.B4, 200), new Note(C.A4, 400), new Note(C.G4, 200), new Note(C.F4, 200), new Note(C.G4, 200), new Note(C.F4, 200), new Note(C.E4, 200), new Note(C.F4, 200), new Note(C.G4, 200), new Note(C.A4, 200), new Note(C.B4, 200), new Note(C.C5, 200), new Note(C.A4, 400), new Note(C.C5, 200), new Note(C.B4, 200), new Note(C.C5, 400), new Note(C.B4, 200), new Note(C.C5, 200), new Note(C.B4, 200), new Note(C.C5, 200), new Note(C.D5, 200), new Note(C.C5, 200), new Note(C.B4, 200), new Note(C.C5, 200), new Note(C.A4, 200), new Note(C.B4, 200), new Note(C.C5, 800)));
PublicFunction.setNoteDefault(C.C4, 400, 0, 70);

List<Note> notes1 = new ArrayList<Note>(Arrays.asList(new Note(C.C3, 400), new Note(C.G3, 400), new Note(C.C4, 400), new Note(C.E4, 400), new Note(C.G2, 400), new Note(C.G3, 400), new Note(C.B3, 400), new Note(C.D4, 400), new Note(C.A2, 400), new Note(C.E3, 400), new Note(C.A3, 400), new Note(C.C4, 400), new Note(C.E2, 400), new Note(C.E3, 400), new Note(C.G3, 400), new Note(C.B3, 400), new Note(C.F2, 400), new Note(C.F3, 400), new Note(C.A3, 400), new Note(C.C4, 400), new Note(C.C3, 400), new Note(C.E3, 400), new Note(C.G3, 400), new Note(C.C4, 400), new Note(C.F2, 400), new Note(C.F3, 400), new Note(C.A3, 400), new Note(C.C4, 400), new Note(C.G2, 400), new Note(C.G3, 400), new Note(C.B3, 400), new Note(C.D4, 400), new Note(C.C4, 800)));
Melody melody0 = new Melody(notes0);
Melody melody1 = new Melody(notes1);
List<Track> tracks0 = new ArrayList<Track>(Arrays.asList(new Track(melody0, C.VIOLIN)));
List<Track> tracks1 = new ArrayList<Track>(Arrays.asList(new Track(melody1, C.PIANO)));
Music music0 = new Music(tracks0);
Music music1 = new Music(tracks1);
Music music = PublicFunction.multiplyMusic(music0, music1);
Music music2 = new Music(music);
music.addMusic(music2);

PublicFunction.write(music, "canon.mid");

}


}