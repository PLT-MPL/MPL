package test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import definition.C;
import definition.Melody;
import definition.Music;
import definition.Note;
import definition.Track;
import function.PublicFunction;

public class testMusic {
	
	public testMusic(int testcase){
		
		// 1 1 5 5 | 6 6 5 - | 4 4 3 3 | 2 2 1 - ||
		PublicFunction.setNoteDefault(C.C4, 0, 250, 200); 
		List<Note> notes0 = new ArrayList<Note>(Arrays.asList(new Note(), new Note(),
				new Note(C.G4),new Note(C.G4),new Note(C.A4),new Note(C.A4),new Note(C.G4,500),
				new Note(C.F4),new Note(C.F4),new Note(C.E4),new Note(C.E4),new Note(C.D4),new Note(C.D4),
				new Note(C.C4,500)));

		// 1 - 5 - | 6 - 5 - | 4 - 3 - | 2 - 1 - ||
		PublicFunction.setNoteDefault(C.C4, 0, 500, 50); 
		List<Note> notes1 = new ArrayList<Note>(Arrays.asList(new Note(),new Note(C.G4),
				new Note(C.A4),new Note(C.G4),new Note(C.F4),new Note(C.E4),
				new Note(C.D4),new Note()));
		
		// Create melody
		Melody melody0 =  new Melody(notes0);
		Melody melody1 = new Melody(notes1);
		
		// Put into track list
		List<Track> tracks = new ArrayList<Track>(Arrays.asList(new Track(melody0,C.PIANO),
				new Track(melody1, C.VIOLIN)));

		// Create music_1
		Music music_1 = new Music(tracks);
		
		// 1 1 5 5 | 6 6 5 - | 4 4 3 3 | 2 2 1 - ||
		PublicFunction.setNoteDefault(C.C4, 0, 250, 200); 
		List<Note> notes2 = new ArrayList<Note>(Arrays.asList(new Note(), new Note(),
				new Note(C.C4),new Note(C.A4),new Note(C.A4),new Note(C.A4),new Note(C.E4,500),
				new Note(C.C4),new Note(C.A4),new Note(C.E4),new Note(C.E4),new Note(C.D4),new Note(C.D4),
				new Note(C.C4,500)));

		// 1 - 5 - | 6 - 5 - | 4 - 3 - | 2 - 1 - ||
		PublicFunction.setNoteDefault(C.C4, 0, 500, 50); 
		List<Note> notes3 = new ArrayList<Note>(Arrays.asList(new Note(C.A4),new Note(C.G4),
				new Note(C.C4),new Note(C.F4),new Note(C.F4),new Note(C.A4),
				new Note(C.C4),new Note()));
		
		// Create melody
		Melody melody2 =  new Melody(notes2);
		Melody melody3 = new Melody(notes3);
		
		// Put into track list
		List<Track> tracks_2 = new ArrayList<Track>(Arrays.asList(new Track(melody2,C.ACCORDION),
				new Track(melody3, C.FLUTE)));

		// Create music_2
		Music music_2 = new Music(tracks_2);
		
		
		if(testcase == 1){
			//test addMusic in PublicFunction
			Music newMusic = PublicFunction.addMusic(music_1, music_2);
			PublicFunction.write(newMusic, "test_addMusic_public.mid");
		}
		else if(testcase == 2){
			//test addMusic
			music_1.addMusic(music_2);
			PublicFunction.write(music_1, "test_addMusic.mid");
		}
		else if(testcase == 3){
			//test multiplyMusic n PublicFunction
			Music newMusic = PublicFunction.multiplyMusic(music_1, music_2);
			PublicFunction.write(newMusic, "test_multipleMusic_public.mid");
		}
		else if(testcase == 4){
			// test multiplyMusic 
			music_1.multiplyMusic(music_2);
			PublicFunction.write(music_1, "test_multipleMusic.mid");
		}
	}
	
	public static void main(String[] args){
			
		testMusic test = new testMusic(4);
	}

}
