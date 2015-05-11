package test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import definition.*;
import function.PublicFunction;

public class complexTest {
	
	public void testDifferentMusic(int musicNum){
		
		if(musicNum == 1){
			// 1 C4
			// 2 D4   3:E4 4:F4 5:G4 
			// 1 C4 1 12D4 3 | 32 34 5 | 1 5 3 1 | 54 32 1 |
			List<Note> notes0 = new ArrayList<Note>(Arrays.asList(new Note(C.C4,400),
					new Note(C.C4,400),new Note(C.C4,300),new Note(C.D4,100),new Note(C.E4,400)
			,new Note(C.E4,300),new Note(C.D4,100),new Note(C.E4,300), new Note(C.F4,100), new Note(C.G4,800)
			,new Note(C.C5,133), new Note(C.C5,134),new Note(C.C5,133),
			new Note(C.G4,133), new Note(C.G4,134),new Note(C.G4,133),
			new Note(C.E4,133),new Note(C.E4,134),new Note(C.E4,133), 
			new Note(C.C4,133), new Note(C.C4,134),new Note(C.C4,133),
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
		if(musicNum == 2){
			/*
			R: G5(8) E5(16) F5(16) G5(8) E5(16) F5(16)  G5(16) G4(16) A4(16) B4(16) C5(16) D5(16) E5(16) F5(16)
			
			R: E5(8) C5(16) D5(16) E5(8) E4(16) F4(16) G4(16) A4(16) G4(16) F4(16) G4(16) C5(16) B4(16) C5(16)

			R: A4(8) C5(16) B4(16) A4(8) G4(16) F4(16) 
			   G4(16) F4(16) E4(16) F4(16) G4(16) A4(16) B4(16) C5(16)
			   
			R: A4(8) C5(16) B4(16) C5(8) B4(16) C5(16) 
			   B4(16) C5(16) D5(16) C5(16) B4(16) C5(16) A4(16) B4(16)

			R: C5(1) 
			*/
			
			List<Note> notes0 = new ArrayList<Note>(Arrays.asList(
			new Note(C.G5,400),new Note(C.E5,200),new Note(C.F5,200),new Note(C.G5,400),new Note(C.E5,200),new Note(C.F5,200),
			new Note(C.G5,200),new Note(C.G4,200),new Note(C.A4,200), new Note(C.B4,200), new Note(C.C5,200), new Note(C.D5,200), new Note(C.E5,200), new Note(C.F5,200),
			new Note(C.E5,400), new Note(C.C5,200),new Note(C.D5,200),new Note(C.E5,400),new Note(C.E4,200), new Note(C.F4,200),
			new Note(C.G4,200),new Note(C.A4,200), new Note(C.G4,200),new Note(C.F4,200),new Note(C.G4,200), new Note(C.C5,200),new Note(C.B4,200), new Note(C.C5,200),
			
			new Note(C.A4,400),new Note(C.C5,200),new Note(C.B4,200),new Note(C.A4,400),new Note(C.G4,200),new Note(C.F4,200),
			new Note(C.G4,200),new Note(C.F4,200),new Note(C.E4,200), new Note(C.F4,200), new Note(C.G4,200), new Note(C.A4,200), new Note(C.B4,200), new Note(C.C5,200),
			new Note(C.A4,400), new Note(C.C5,200),new Note(C.B4,200),new Note(C.C5,400),new Note(C.B4,200), new Note(C.C5,200),
			new Note(C.B4,200),new Note(C.C5,200), new Note(C.D5,200),new Note(C.C5,200),new Note(C.B4,200), new Note(C.C5,200),new Note(C.A4,200), new Note(C.B4,200),
			
			new Note(C.C5,200)
			)
			);
			
			/*
			L: C3(8) G3(8) C4(8) E4(8) G2(8) G3(8) B3(8) D4(8)
			
			L: A2(8) E3(8) A3(8) C4(8) E2(8) E3(8) G3(8) B3(8)

			
			L: F2(8) F3(8) A3(8) C4(8) C3(8) E3(8) G3(8) C4(8)

			
			L: F2(8) F3(8) A3(8) C4(8) G2(8) G3(8) B3(8) D4(8)

			
			L: C4(1)
			*/
			
			PublicFunction.setNoteDefault(C.C4,400,0,600);
			List<Note> notes1 = new ArrayList<Note>(Arrays.asList(
			new Note(C.C3,400),new Note(C.G3,400),new Note(C.C4,400),new Note(C.E4,400),new Note(C.G2,400),new Note(C.G3,400),new Note(C.B3,400), new Note(C.D4,400),
			new Note(C.A2,400),new Note(C.E3,400),new Note(C.A3,400),new Note(C.C4,400),new Note(C.E2,400),new Note(C.E3,400),new Note(C.G3,400), new Note(C.B3,400),
			new Note(C.F2,400),new Note(C.F3,400),new Note(C.A3,400),new Note(C.C4,400),new Note(C.C3,400),new Note(C.E3,400),new Note(C.G3,400), new Note(C.C4,400),
			new Note(C.F2,400),new Note(C.F3,400),new Note(C.A3,400),new Note(C.C4,400),new Note(C.G2,400),new Note(C.G3,400),new Note(C.B3,400), new Note(C.D4,400),
			new Note(C.C4,800)
					)
					);
			
			Melody melody0 =  new Melody(notes0);
			Melody melody1 =  new Melody(notes1);
			List<Track> tracks = new ArrayList<Track>();
			
			Track track = new Track(melody0,C.PIANO);
			Track track2 = new Track(melody1,C.PIANO);
			tracks.add(track);
			tracks.add(track2);
			
			Music music = new Music(tracks);
			// Write to File
			PublicFunction.write(music, "canon.mid");
			/*
			List<Note> notes1 = new ArrayList<Note>(Arrays.asList(new Note(C.C4,400),
					new Note(C.C4,400),new Note(C.C4,300),new Note(C.D4,100),new Note(C.E4,400)
			,new Note(C.E4,300),new Note(C.D4,100),new Note(C.E4,300), new Note(C.F4,100), new Note(C.G4,800)
			,new Note(C.C5,133), new Note(C.C5,134),new Note(C.C5,133),
			new Note(C.G4,133), new Note(C.G4,134),new Note(C.G4,133),
			new Note(C.E4,133),new Note(C.E4,134),new Note(C.E4,133), 
			new Note(C.C4,133), new Note(C.C4,134),new Note(C.C4,133),
			new Note(C.G4,300), new Note(C.F4,100), new Note(C.E4,300), new Note(C.D4,100), new Note(C.C4,400)
			)
			);
			*/
		}
	}
	
	public static void main(String[] args){
		complexTest test = new complexTest();
		test.testDifferentMusic(2);
		
		
				
				
	}

}
