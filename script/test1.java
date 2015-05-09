import java.io.*;
import java.util.*;
import definition.*;
import function.PublicFunction;

public class test1
{

public static Melody addChords1(Melody melody){
Melody newMelody = new Melody();
for(int i = 0;i < melody.getLength();
i++)
{
  Note note = melody.getNote(i);
int pitch = note.getPitch() - 12;
int duration = note.getDuration();
int starttime = note.getStartTime();
int strength = note.getStrength();
Note chord = new Note(pitch, duration, starttime, strength);
newMelody.addNote(chord);

}
return newMelody;
}

public static Melody addChords2(Melody melody){
Melody newMelody = new Melody();
int i = 0;
while(true){
  Note note = melody.getNote(i);
int pitch = note.getPitch() - 12;
int duration = note.getDuration();
int starttime = note.getStartTime();
int strength = note.getStrength();
Note chord = new Note(pitch, duration, starttime, strength);
newMelody.addNote(chord);

i++;

if (i >= melody.getLength())break;
}
return newMelody;
}

public static void main(String arg[]){
Music music = PublicFunction.read("twinkle_twinkle3.mid");
Melody melody = music.getTrack(0).getMelody();
Melody newMelody = addChords1(melody);
List<Track> tracks = new ArrayList<Track>(Arrays.asList(music.getTrack(0), new Track(newMelody, C.PIANO)));
Music newMusic = new Music(tracks);
PublicFunction.write(newMusic, "new_twinkle_twinkle.mid");

PublicFunction.print("Done...\n");

}


}