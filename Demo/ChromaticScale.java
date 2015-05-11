import java.io.*;
import java.util.*;
import definition.*;
import function.PublicFunction;

public class ChromaticScale
{

public static void main(String arg[]){
PublicFunction.setNoteDefault(C.C4, 250, 0, 200);

Melody melody = new Melody();
for(int i = 0;i < 13;
i++)
{
  Note note = new Note(C.C4 + i);
melody.addNote(note);

}
Track track = new Track(melody, C.PIANO);
Music music = new Music();
music.insertTrack(track);

PublicFunction.write(music, "ChromaticScale.mid");

}


}