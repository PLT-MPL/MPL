package test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import definition.*;
import function.*;


public class testMelody {
	
	private testMelody(int testcase)
	{
		
		PublicFunction.setNoteDefault(C.C4, 0, 250, 50); 
		
		List<Note> notes1 = new ArrayList<Note>(Arrays.asList(new Note(),new Note(C.G4),
				new Note(C.A4),new Note(C.G4),new Note(C.F4),new Note(C.E4),
				new Note(C.D4),new Note()));
		
		Melody melody = new Melody(notes1);
		Track track = new Track(melody,C.PIANO);
		Music music = new Music();
		music.insertTrack(track);
		PublicFunction.write(music, "test_melody_prev.mid");
		
		PublicFunction.setNoteDefault(C.C4, 0, 500, 50); 
		List<Note> notes2 = new ArrayList<Note>(Arrays.asList(new Note(),new Note(C.G4),
				new Note(C.A4),new Note(C.G4),new Note(C.F4),new Note()));
		Melody melody2 = new Melody(notes2);
		Melody newMelody = new Melody();
		
		if(testcase == 1){
			//1) test addMelody in publicFunction
			newMelody = PublicFunction.addMelody(melody, melody2);
			
			track = new Track(newMelody,C.ACCORDION);
			music = new Music();
			music.insertTrack(track);
			PublicFunction.write(music, "test_addMelody.mid");
		}
		else if(testcase == 2){
			//2) test multipleMelody in PublicFunction
			newMelody = PublicFunction.multipleMelody(melody, melody2);
			track = new Track(newMelody,C.PIANO);
			music = new Music();
			music.insertTrack(track);
			PublicFunction.write(music, "test_multipleMelody.mid");
		}
		else if(testcase == 3){
			//3) test addNote in PublicFunction
			newMelody = PublicFunction.addNote(newMelody, new Note(C.A7));
			track = new Track(newMelody,C.PIANO);
			music = new Music();
			music.insertTrack(track);
			PublicFunction.write(music, "test_addNote.mid");
		}
		else if(testcase == 4){
			//4) test multipleInt in PublicFunction
			newMelody = PublicFunction.multipleInt(melody2, 3);
			track = new Track(newMelody,C.PIANO);
			music = new Music();
			music.insertTrack(track);
			PublicFunction.write(music, "test_multipleInt.mid");
		}
		else if(testcase == 5){
			//5) test subMelody
			newMelody = melody2.subMelody(0,melody2.getLength()-3);
			track = new Track(newMelody,C.PIANO);
			music = new Music();
			music.insertTrack(track);
			PublicFunction.write(music, "test_subMelody.mid");	
		
		}
		else if(testcase == 6){
			//5) test deletNote
			newMelody.deleteNote(melody2.getNoteList().size()-1);
			track = new Track(newMelody,C.PIANO);
			music = new Music();
			music.insertTrack(track);
			PublicFunction.write(music, "test_deleteNote.mid");
		}
	}
	
	public static void main(String[] args){
		
		testMelody test = new testMelody(3);
	}
}