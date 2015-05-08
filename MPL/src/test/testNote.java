package test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import definition.*;
import function.*;

public class testNote {
	
	public static void main(String[] args) {
		PublicFunction.setNoteDefault(C.C4, 0, 5, 50); 
		List<Note> notes1 = new ArrayList<Note>(Arrays.asList(new Note(),new Note(C.G4),
				new Note(C.A4),new Note(C.G4),new Note(C.F4),new Note(C.E4),
				new Note(C.D4),new Note()));
		
		Note note = new Note(C.F1);
		Melody melody = new Melody(new ArrayList<Note>(Arrays.asList(note)));
		Track track = new Track(melody);
		
		
		Music music = new Music(new ArrayList<Track>(Arrays.asList(track)));
		PublicFunction.write(music, "test_note_prev.mid");
		
		
		//1) test plus :note = note + 1, raise pitch
		note = PublicFunction.plus(10,note);
		//2) test minus: note = note - 2, decrease pitch
		note = PublicFunction.minus(note,2);
		
		melody = new Melody(new ArrayList<Note>(Arrays.asList(note)));
		track = new Track(melody);
		music = new Music(new ArrayList<Track>(Arrays.asList(track)));
		
		PublicFunction.write(music, "test_plusNote.mid");
		System.out.println("finish");
	}

}
