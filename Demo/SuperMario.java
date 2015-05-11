import java.io.*;
import java.util.*;
import definition.*;
import function.PublicFunction;

public class SuperMario
{

public static void main(String arg[]){
PublicFunction.setNoteDefault(C.C4, 300, 0, 200);

List<Note> notes0r = new ArrayList<Note>(Arrays.asList(new Note(C.E5, 150), new Note(C.E5), new Note(C.E5, 150), new Note(0, 150), new Note(C.C5, 150), new Note(C.E5), new Note(C.G5), new Note(0), new Note(C.G4), new Note(0)));
PublicFunction.setNoteDefault(C.C4, 300, 0, 200);

List<Note> notes1r = new ArrayList<Note>(Arrays.asList(new Note(C.C5), new Note(0, 150), new Note(C.G4, 150), new Note(0), new Note(C.E4), new Note(0, 150), new Note(C.A4), new Note(C.B4, 150), new Note(0, 150), new Note(C.B4 - 1, 150), new Note(C.A4)));
PublicFunction.setNoteDefault(C.C4, 300, 0, 200);

List<Note> notes2r = new ArrayList<Note>(Arrays.asList(new Note(C.G4, 200), new Note(C.E5, 200), new Note(C.G5, 200), new Note(C.A5), new Note(C.F5, 150), new Note(C.G5, 150), new Note(0, 150), new Note(C.E5), new Note(C.C5, 150), new Note(C.D5, 150), new Note(C.B4, 150), new Note(0, 150)));
PublicFunction.setNoteDefault(C.C4, 300, 0, 200);

List<Note> notes3r = new ArrayList<Note>(Arrays.asList(new Note(0), new Note(C.G5, 150), new Note(C.F5 + 1, 150), new Note(C.F5, 150), new Note(C.D5 + 1), new Note(C.E5, 150), new Note(0, 150), new Note(C.G4, 150), new Note(C.A4, 150), new Note(C.C5, 150), new Note(0, 150), new Note(C.A4, 150), new Note(C.C5, 150), new Note(C.D5, 150)));
PublicFunction.setNoteDefault(C.C4, 300, 0, 200);

List<Note> notes4r = new ArrayList<Note>(Arrays.asList(new Note(0), new Note(C.G5, 150), new Note(C.F5 + 1, 150), new Note(C.F5, 150), new Note(C.D5 + 1), new Note(C.E5, 150), new Note(0, 150), new Note(C.C6), new Note(C.C6, 150), new Note(C.C6), new Note(0)));
PublicFunction.setNoteDefault(C.C4, 300, 0, 200);

List<Note> notes5r = new ArrayList<Note>(Arrays.asList(new Note(0), new Note(C.E5 - 1), new Note(0, 150), new Note(C.D5), new Note(0, 150), new Note(C.C5), new Note(0), new Note(0), new Note(0)));
PublicFunction.setNoteDefault(C.C4, 300, 0, 200);

List<Note> notes0l = new ArrayList<Note>(Arrays.asList(new Note(C.D3, 150), new Note(C.D3), new Note(C.D3, 150), new Note(0, 150), new Note(C.D3, 150), new Note(C.D3), new Note(0, 600), new Note(C.G3), new Note(0)));
PublicFunction.setNoteDefault(C.C4, 300, 0, 200);

List<Note> notes1l = new ArrayList<Note>(Arrays.asList(new Note(C.G3), new Note(0, 150), new Note(C.E3, 150), new Note(0), new Note(C.C3), new Note(0, 150), new Note(C.F3), new Note(C.G3, 150), new Note(0, 150), new Note(C.F3 + 1, 150), new Note(C.F3)));
PublicFunction.setNoteDefault(C.C4, 300, 0, 200);

List<Note> notes2l = new ArrayList<Note>(Arrays.asList(new Note(C.E3, 200), new Note(C.C4, 200), new Note(C.E4, 200), new Note(C.F4), new Note(C.D4, 150), new Note(C.E4, 150), new Note(0, 150), new Note(C.C4), new Note(C.A3, 150), new Note(C.B3, 150), new Note(C.G3, 150), new Note(0, 150)));
PublicFunction.setNoteDefault(C.C4, 300, 0, 200);

List<Note> notes3l = new ArrayList<Note>(Arrays.asList(new Note(C.C3), new Note(0, 150), new Note(C.G3, 150), new Note(0), new Note(C.C4), new Note(C.F3), new Note(0, 150), new Note(C.C4, 150), new Note(C.C4), new Note(C.F3)));
PublicFunction.setNoteDefault(C.C4, 300, 0, 200);

List<Note> notes4l = new ArrayList<Note>(Arrays.asList(new Note(C.C3), new Note(0, 150), new Note(C.E3, 150), new Note(0), new Note(C.G3, 150), new Note(C.C4, 150), new Note(0, 600), new Note(0), new Note(C.G3)));
PublicFunction.setNoteDefault(C.C4, 300, 0, 200);

List<Note> notes5l = new ArrayList<Note>(Arrays.asList(new Note(C.C3), new Note(C.G3 + 1), new Note(0, 150), new Note(C.B3 - 1), new Note(0, 150), new Note(C.C4), new Note(0, 150), new Note(C.G3, 150), new Note(C.G3), new Note(C.C3)));
Melody melody0r = new Melody(notes0r), melody1r = new Melody(notes1r), melody2r = new Melody(notes2r), melody3r = new Melody(notes3r), melody4r = new Melody(notes4r), melody5r = new Melody(notes5r);
Melody melody0l = new Melody(notes0l), melody1l = new Melody(notes1l), melody2l = new Melody(notes2l), melody3l = new Melody(notes3l), melody4l = new Melody(notes4l), melody5l = new Melody(notes5l);
Melody melodyr = PublicFunction.addMelody(PublicFunction.addMelody(PublicFunction.addMelody(PublicFunction.addMelody(PublicFunction.addMelody(melody0r, PublicFunction.multiplyInt(PublicFunction.addMelody(melody1r, melody2r), 2)), melody3r), melody4r), melody3r), melody5r);
Melody melodyl = PublicFunction.addMelody(PublicFunction.addMelody(PublicFunction.addMelody(PublicFunction.addMelody(PublicFunction.addMelody(melody0l, PublicFunction.multiplyInt(PublicFunction.addMelody(melody1l, melody2l), 2)), melody3l), melody4l), melody3l), melody5l);
List<Track> tracks = new ArrayList<Track>(Arrays.asList(new Track(melodyl, C.PIANO), new Track(melodyr, C.PIANO)));
Music music = new Music(tracks);
PublicFunction.write(music, "Super_Mario.mid");

PublicFunction.print("Done...\n");

}


}