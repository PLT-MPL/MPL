package test;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import definition.*;
import function.PublicFunction;

import com.leff.midi.*;
import com.leff.midi.event.MidiEvent;
import com.leff.midi.event.NoteOff;
import com.leff.midi.event.NoteOn;
import com.leff.midi.event.ProgramChange;
import com.leff.midi.event.meta.Tempo;
import com.leff.midi.event.meta.TimeSignature;

public class test {
	
	public static void main(String[] args) {
		Note n = new Note();
		// n = n + 1
		n = PublicFunction.plus(n,1);
		// n = n - 2
		n = PublicFunction.minus(n,2);
		
		// 1 1 5 5 | 6 6 5 - | 4 4 3 3 | 2 2 1 - ||
		PublicFunction.setNoteDefault(C.C4, 250, 0, 200); 
		List<Note> notes0 = new ArrayList<Note>(Arrays.asList(new Note(), new Note(),
				new Note(C.G4),new Note(C.G4),new Note(C.A4),new Note(C.A4),new Note(C.G4,500),
				new Note(C.F4),new Note(C.F4),new Note(C.E4),new Note(C.E4),new Note(C.D4),new Note(C.D4),
				new Note(C.C4,500)));

		// 1 - 5 - | 6 - 5 - | 4 - 3 - | 2 - 1 - ||
		PublicFunction.setNoteDefault(C.C4, 500, 0, 50); 
		List<Note> notes1 = new ArrayList<Note>(Arrays.asList(new Note(),new Note(C.G4),
				new Note(C.A4),new Note(C.G4),new Note(C.F4),new Note(C.E4),
				new Note(C.D4),new Note()));
		
		// Create melody
		Melody melody0 =  new Melody(notes0);
		Melody melody1 = new Melody(notes1);
		
		// Put into track list
		List<Track> tracks = new ArrayList<Track>(Arrays.asList(new Track(melody0,C.PIANO),
				new Track(melody1, C.VIOLIN)));

		// Create music
		Music music = new Music(tracks);
		
		// Write to File
		PublicFunction.write(music, "twinkle_twinkle.mid");
		
		// Test Read and Write
		Music msc = PublicFunction.read("twinkle_twinkle.mid");
		PublicFunction.write(msc, "twinkle_twinkle2.mid");
		
		long test1 = 10;
		int test2 = (int) test1;
		System.out.println(test2);
		
        System.out.println("Done...");
	}
}
