package test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import definition.*;
import function.*;

public class testMelody {
	
	public static void main(String[] args){
	
		PublicFunction.setNoteDefault(C.C4, 0, 250, 50); 
		
		List<Note> notes1 = new ArrayList<Note>(Arrays.asList(new Note(),new Note(C.G4),
				new Note(C.A4),new Note(C.G4),new Note(C.F4),new Note(C.E4),
				new Note(C.D4),new Note()));
		
		Melody melody = new Melody(notes1);
		Track track = new Track(melody,C.PIANO);
		Music music = new Music();
		music.insertTrack(track);
		//PublicFunction.write(music, "test_melody_prev.mid");
		
		PublicFunction.setNoteDefault(C.C4, 0, 500, 50); 
		List<Note> notes2 = new ArrayList<Note>(Arrays.asList(new Note(),new Note(C.G4),
				new Note(C.A4),new Note(C.G4),new Note(C.F4),new Note()));
		
		Melody melody2 = new Melody(notes2);
		
		//1) test addMelody in publicFunction
		Melody newMelody = PublicFunction.addMelody(melody, melody2);
		
		track = new Track(newMelody,C.ACCORDION);
		music = new Music();
		music.insertTrack(track);
		PublicFunction.write(music, "test_addMelody.mid");
		
		
		//2) test multipleMelody in PublicFunction
		newMelody = PublicFunction.multipleMelody(melody, melody2);
		track = new Track(newMelody,C.PIANO);
		music = new Music();
		music.insertTrack(track);
		PublicFunction.write(music, "test_multipleMelody.mid");
		System.out.println("finish");
		
	}

}
