package test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import definition.*;
import function.*;

public class testNote {
	
	public static void main(String[] args) {
		//createMidi("out.mid");
		//modifyMidi("out.mid");
		PublicFunction.setNoteDefault(C.C4, 0, 500, 50); 
		List<Note> notes1 = new ArrayList<Note>(Arrays.asList(new Note(),new Note(C.G4),
				new Note(C.A4),new Note(C.G4),new Note(C.F4),new Note(C.E4),
				new Note(C.D4),new Note()));
		
		Note note = new Note(C.F1);
		// n = n + 1
		note = PublicFunction.plus(note,1);
		// n = n - 2
		note = PublicFunction.minus(note,2);
		
		Melody melody = new Melody(new ArrayList<Note>(Arrays.asList(note)));
		Track track = new Track(melody);
		
		
		Music music = new Music(new ArrayList<Track>(Arrays.asList(track)));
		
		PublicFunction.write(music, "test_note.mid");
	}

}
