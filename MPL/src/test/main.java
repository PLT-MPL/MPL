package test;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import com.leff.midi.MidiFile;
import com.leff.midi.MidiTrack;
import com.leff.midi.event.MidiEvent;
import com.leff.midi.event.ProgramChange;
import com.leff.midi.event.meta.Tempo;
import com.leff.midi.event.meta.TimeSignature;

import definition.*;
import function.PublicFunction;

public class main {
	
	public Music constructMusic()
	{
		//Insert our own data structure
        Note note = new Note();
        Note note2 = new Note(C.B3);
        Note note3 = new Note(C.B4);
        List<Note> notelist = new ArrayList<Note>();
        notelist.add(note);
        notelist.add(note2);
        notelist.add(note3);
        
        Melody melody = new Melody(notelist);
        
        int track1Timbre = 4;
        Track track = new Track(melody,track1Timbre);
        
        
        PublicFunction.setNoteDefault(5,0,100,7);
        Note note4 = new Note();
        
        Note note5 = new Note(C.A5);
        Note note6 = new Note(C.A8);
        Note note7 = new Note(C.B6);
        Note note8 = new Note(C.C6);
        
        List<Note> notelist2 = new ArrayList<Note>();
        notelist2.add(note4);
        notelist2.add(note5);
        notelist2.add(note6);
        notelist2.add(note7);
        notelist2.add(note8);
        
        
        Melody melody2 = new Melody(notelist2);
        int track2Timbre = 1;
        Track track2 = new Track(melody2,track2Timbre);
        
        List<Track> tracklist = new ArrayList<Track>();
        tracklist.add(track);
        tracklist.add(track2);
        Music music = new Music(tracklist);
        
        
        return music;
	}
	
	public static void main(String args[]){
		// 1. Create some MidiTracks
        MidiTrack tempoTrack = new MidiTrack();
        MidiTrack noteTrack = new MidiTrack();
        

        // 2. Add events to the tracks
        // 2a. Track 0 is typically the tempo map
        
        TimeSignature ts = new TimeSignature();// ?
        ts.setTimeSignature(4, 4, TimeSignature.DEFAULT_METER, TimeSignature.DEFAULT_DIVISION);

        Tempo t = new Tempo();
        t.setBpm(400);// change velocity

        tempoTrack.insertEvent(ts);
        tempoTrack.insertEvent(t);
		
        
        main ob = new main();
        Music music = ob.constructMusic();
        
        String output = "tmp.mid";
        PublicFunction.write(music,output);
        
        
        // The 1st Channel, PIANO
        /*
        MidiEvent pc1 = new ProgramChange(0, 1, 0);// track timber 
        noteTrack.insertEvent(pc1);
        for(int i = 0; i < 13; i++){
        	noteTrack.insertNote(1, 60 + i, 120, start+tempo*lasting, tempo*lasting + 1600);
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
        */
	}



}
