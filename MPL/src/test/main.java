package Test;

import java.io.*;
import java.util.ArrayList;

import com.leff.midi.MidiFile;
import com.leff.midi.MidiTrack;
import com.leff.midi.event.MidiEvent;
import com.leff.midi.event.ProgramChange;
import com.leff.midi.event.meta.Tempo;
import com.leff.midi.event.meta.TimeSignature;

public class main {
	
	public static void main(String args[]){
		// 1. Create some MidiTracks
        MidiTrack tempoTrack = new MidiTrack();
        MidiTrack noteTrack = new MidiTrack();
        

        // 2. Add events to the tracks
        // 2a. Track 0 is typically the tempo map
        TimeSignature ts = new TimeSignature();
        ts.setTimeSignature(4, 4, TimeSignature.DEFAULT_METER, TimeSignature.DEFAULT_DIVISION);

        Tempo t = new Tempo();
        t.setBpm(228);

        tempoTrack.insertEvent(ts);
        tempoTrack.insertEvent(t);

        int start = 0;
        int tempo = 1;
        int lasting = 200;
        // The 1st Channel, PIANO
        MidiEvent pc1 = new ProgramChange(0, 1, 0);
        noteTrack.insertEvent(pc1);
        for(int i = 0; i < 13; i++){
        	noteTrack.insertNote(2, 60 + i, 120, start+tempo*lasting, tempo*lasting + 1600);
        	start += tempo*lasting;
        }
        

        // It's best not to manually insert EndOfTrack events; MidiTrack will
        // call closeTrack() on itself before writing itself to a file

        // 3. Create a MidiFile with the tracks we created
        ArrayList<MidiTrack> tracks = new ArrayList<MidiTrack>();
        tracks.add(tempoTrack);
        tracks.add(noteTrack);

        MidiFile midi = new MidiFile(MidiFile.DEFAULT_RESOLUTION, tracks);

        // 4. Write the MIDI data to a file
        
        File output = new File("tmp.mid");
        try {
            midi.writeToFile(output);
        }
        catch(IOException e) {
            System.err.println(e);
        }
        System.err.println("haha");
	}



}
