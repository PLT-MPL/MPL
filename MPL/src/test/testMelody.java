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
			PublicFunction.write(music, "test_addMelody_public.mid");
		}
		else if(testcase == 2){
			//2) test multiplyMelody in PublicFunction
			newMelody = PublicFunction.multiplyMelody(melody, melody2);
			track = new Track(newMelody,C.PIANO);
			music = new Music();
			music.insertTrack(track);
			PublicFunction.write(music, "test_multiplyMelody_public.mid");
		}
		else if(testcase == 3){
			//3) test addNote in PublicFunction
			newMelody = PublicFunction.addNote(newMelody, new Note(C.A7));
			track = new Track(newMelody,C.PIANO);
			music = new Music();
			music.insertTrack(track);
			PublicFunction.write(music, "test_addNote_public.mid");
		}
		else if(testcase == 4){
			//4) test multiplyInt in PublicFunction
			newMelody = PublicFunction.multiplyInt(melody2, 3);
			track = new Track(newMelody,C.PIANO);
			music = new Music();
			music.insertTrack(track);
			PublicFunction.write(music, "test_multiplyInt_public.mid");
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
			//6) test deletNote
			melody.deleteNote(melody.getNoteList().size()-1);
			track = new Track(melody,C.PIANO);
			music = new Music();
			music.insertTrack(track);
			PublicFunction.write(music, "test_deleteNote.mid");
		}
		else if(testcase == 7){
			//7) test addMelody
			melody.addMelody(melody2);
			track = new Track(melody,C.ACCORDION);
			music = new Music();
			music.insertTrack(track);
			PublicFunction.write(music, "test_addMelody.mid");
		}
		else if(testcase == 8){
			//8) test multiplyInt
			melody.multiplyInt(3);
			track = new Track(melody,C.PIANO);
			music = new Music();
			music.insertTrack(track);
			PublicFunction.write(music, "test_multiplyInt.mid");
		}
		else if(testcase == 9){
			//9) test addMelody
			melody.multiplyMelody(melody2);
			track = new Track(melody,C.PIANO);
			music = new Music();
			music.insertTrack(track);
			PublicFunction.write(music, "test_multiplyMelody.mid");
		}
		else if(testcase == 10){
			//10) test addMelody
			newMelody.addNote(new Note(C.A7));
			track = new Track(newMelody,C.PIANO);
			music = new Music();
			music.insertTrack(track);
			PublicFunction.write(music, "test_addNote.mid");
		}
	}
	
	public static void main(String[] args){
		
		testMelody test = new testMelody(4);
	}
}
