package function;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.leff.midi.MidiFile;
import com.leff.midi.MidiTrack;
import com.leff.midi.event.MidiEvent;
import com.leff.midi.event.NoteOff;
import com.leff.midi.event.NoteOn;
import com.leff.midi.event.ProgramChange;

import definition.*;

public class PublicFunction {
	public static void setNoteDefault(int pitch, int startTime,
			int duration, int strength){
		
		C.NOTE_DEFAULT_PITCH = pitch;
		C.NOTE_DEFAULT_STARTTIME = startTime;
		C.NOTE_DEFAULT_DURATION = duration;
		C.NOTE_DEFAULT_STRENGTH = strength;
	}
	
	public static int changeToMillisecond(int minute, int second,
			int millisecond){
		return minute*60*1000 + second*1000 + millisecond;
	}
	
	public static void printTime(int millisecond){
		int ms = millisecond % 1000;
		millisecond /= 1000;
		int s = millisecond % 60;
		millisecond /= 60;
		int min = millisecond;
		System.out.println(min+"/"+s+"/"+ms);
	}
	
	public static Music read(String path){
		MidiFile mf = null;
        File input = new File(path);
        Music msc = new Music();
        
        try {
            mf = new MidiFile(input);
        }
        catch(IOException e) {
            System.err.println("Error parsing MIDI file:");
            e.printStackTrace();
            return msc;
        }
        
        for(int i = 0; i < mf.getTrackCount(); i++){
        	Iterator<MidiEvent> it = mf.getTracks().get(i).getEvents().iterator();
        	ArrayList<Note> noteList = new ArrayList<Note>();
        	while(it.hasNext()){
        		 MidiEvent E = it.next();
        		 // E.
        		 Melody mld = new Melody(noteList);
             	 // Track trk = new Track(mld, E.getDelta());
        	}
        	
        }
        
		return msc;
	}
	
	public static void write(Music music, String outputpath){
		
		MidiTrack tempoTrack = new MidiTrack();

        List<Track> tracklist = music.getTracks();
		int channel = 1;
		ArrayList<MidiTrack> midiTrackList = new ArrayList<MidiTrack>();
		midiTrackList.add(tempoTrack);
		for(Track track: tracklist){
			MidiTrack miditrack = new MidiTrack();
			int timbre = track.getTimbre();
			MidiEvent midievent = new ProgramChange(0, channel, timbre);
			miditrack.insertEvent(midievent);
			 
			Melody melody = track.getMelody();
			List<Note> notelist = melody.getNoteList();
			//int tempo = 120; 
			for(Note note: notelist){
				int pitch = note.getPitch();
				long duration = note.getDuration();
				long starttime = note.getStartTime();
				int strength = note.getStrength();
				 
				miditrack.insertNote(channel,pitch,strength,starttime,duration);
			 }
			 channel++;
			 midiTrackList.add(miditrack);
		 }
		

       MidiFile midi = new MidiFile(MidiFile.DEFAULT_RESOLUTION, midiTrackList);

       // 4. Write the MIDI data to a file
       File output = new File(outputpath);
       try {
           midi.writeToFile(output);
       }
       catch(IOException e) {
           System.err.println(e);
       }
       System.out.println("haha");
	}
	
	public static void print(String str){
		// 1. Open up a MIDI file
        MidiFile mf = null;
        File input = new File(str);

        try{
            mf = new MidiFile(input);
        } catch(IOException e){
            System.err.println("Error parsing MIDI file:");
            e.printStackTrace();
            return;
        }
        
        
        Music mus = new Music();
        for(int i = 0; i < mf.getTrackCount(); i++){
        	MidiTrack T = mf.getTracks().get(i);
        	Iterator<MidiEvent> it = T.getEvents().iterator();
        	
        	Track tra = new Track();
        	Melody mel = new Melody();
        	while(it.hasNext()){
                MidiEvent E = it.next();
                if(E.getClass().equals(ProgramChange.class)){
                	ProgramChange p = (ProgramChange) E;
                	tra.setTimbre(p.getProgramNumber());
                }
                if(E.getClass().equals(NoteOn.class)){
                	NoteOn sn = (NoteOn) E;
                	NoteOn en = (NoteOn) it.next();
                    mel.addNote(new Note(sn.getNoteValue(), en.getTick()-sn.getTick(), sn.getTick(), sn.getVelocity()));
                }
            }
        	tra.insertMelody(0, mel);
        	mus.insertTrack(tra);
        }
        
		System.out.print(str);
	}
	
	public static int sizeof(Note notes[]){
		return notes.length;
	}
}
