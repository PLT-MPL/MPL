package test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import definition.*;
import function.PublicFunction;

public class complexTest {
	
	public static void main(String[] args){
		// 1 C4
		// 2 D4   3:E4 4:F4 5:G4 
		// 1 C4 1 12D4 3 | 32 34 5 | 1 5 3 1 | 54 32 1 |
		List<Note> notes0 = new ArrayList<Note>(Arrays.asList(new Note(C.C4,400),
				new Note(C.C4,400),new Note(C.C4,300),new Note(C.D4,100),new Note(C.E4,400)
		,new Note(C.E4,300),new Note(C.D4,100),new Note(C.E4,300), new Note(C.F4,100), new Note(C.G4,800)
		,new Note(C.C5,400), new Note(C.G4,400), new Note(C.E4,400), new Note(C.C4,400), 
		new Note(C.G4,300), new Note(C.F4,100), new Note(C.E4,300), new Note(C.D4,100), new Note(C.C4,400)
		)
		);
		
		Melody melody0 =  new Melody(notes0);
		List<Track> tracks = new ArrayList<Track>();
		
		Track track = new Track(melody0);
		tracks.add(track);
		System.out.println(track.getMelody().getNote(0).getStartTime());
		int time = 1600;
		for(int i=0;i< 2;i++){
			Track newTrack = new Track();
			Melody melody = new Melody(notes0);
			newTrack.insertMelody(time, melody);
			time = (int) (time + 1600);
			tracks.add(newTrack);
			
		}
		
		//List<Track> tracks = new ArrayList<Track>(Arrays.asList(new Track(melody0,C.PIANO)));
		
		Music music = new Music(tracks);
		// Write to File
		PublicFunction.write(music, "rollball.mid");
		
		
		
				
				
	}

}
