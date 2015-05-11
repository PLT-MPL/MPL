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
	public static void setNoteDefault(int pitch, int duration, int startTime,
			 int strength){
		
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
		// System.out.println("\n/********read*******/");
		// 1. Open up a MIDI file
        MidiFile mf = null;
        File input = new File(path);

        try{
            mf = new MidiFile(input);
        } catch(IOException e){
            System.err.println("Error parsing MIDI file:");
            e.printStackTrace();
            return null;
        }
        
        Music mus = new Music();
        // System.out.println(mf.getTrackCount());
        for(int i = 0; i < mf.getTrackCount(); i++){
        	MidiTrack T = mf.getTracks().get(i);
        	Iterator<MidiEvent> it = T.getEvents().iterator();

        	Melody mel = new Melody();
        	int timbre = -1;
        	while(it.hasNext()){
                MidiEvent E = it.next();
                if(E.getClass().equals(ProgramChange.class)){
                	ProgramChange p = (ProgramChange) E;
                	timbre = p.getProgramNumber();
                }
                if(E.getClass().equals(NoteOn.class)){
                	NoteOn sn = (NoteOn) E;
                	NoteOn en = (NoteOn) it.next();
                    
                    int pitch = sn.getNoteValue();
                    int duration = (int)(en.getTick()-sn.getTick());
                    int startTime = (int)sn.getTick();
                    int strength = sn.getVelocity();
                    
                    // System.out.println(timbre + ", " + pitch + ", " + strength + ", " 
    				//		+ startTime + ", " + duration);
                    mel.addNote(new Note(pitch, duration, startTime, strength));
                }
            }
        	Track tra = new Track(mel, timbre);
        	mus.insertTrack(tra);
        }
        
		return mus;
	}
	
	public static void write(Music music, String outputpath){
		
		// System.out.println("\n/********write*******/");

        List<Track> tracklist = music.getTracks();
		int channel = 0;
		ArrayList<MidiTrack> midiTrackList = new ArrayList<MidiTrack>();
		for(Track track: tracklist){
			MidiTrack miditrack = new MidiTrack();
			int timbre = track.getTimbre();
			MidiEvent midievent = new ProgramChange(0, channel, timbre);
			miditrack.insertEvent(midievent);
			 
			Melody melody = track.getMelody();
			List<Note> notelist = melody.getNoteList();
			int time = 1;
			//int tempo = 120; 
			for(Note note: notelist){
				int pitch = note.getPitch();
				int duration = (int)note.getDuration();
				int startTime = (int)note.getStartTime();
				int strength = note.getStrength();
				/*
				 System.out.println(channel + ", " + pitch + ", " + strength + ", " 
						+ startTime + ", " + duration);
						*/
				 if((startTime == 2000)&& (time == 2))
					 break;
				 else if(startTime == 2000)
					 time = time + 1;
				miditrack.insertNote(channel,pitch,strength,startTime,duration);
			}
			channel++;
			midiTrackList.add(miditrack);
		}
		
		// System.out.println(midiTrackList.size());
        MidiFile midi = new MidiFile(MidiFile.DEFAULT_RESOLUTION, midiTrackList);

        // 4. Write the MIDI data to a file
        File output = new File(outputpath);
        try {
            midi.writeToFile(output);
        }
       catch(IOException e) {
            System.err.println(e);
       }
       // System.out.println("haha");
	}
	
	public static void print(String str){        
		System.out.print(str);
	}
	
	public static int sizeof(Note notes[]){
		return notes.length;
	}

	// note = note + 2
	public static Note plus(Note note, int val){
		int pitch = note.getPitch();
		int duration = (int)note.getDuration();
		int startTime = (int)note.getStartTime();
		int strength = note.getStrength();

		return new Note(pitch+val, duration, startTime, strength);
	}

	// note = 2 + note
	public static Note plus(int val, Note note){
		int pitch = note.getPitch();
		int duration = (int)note.getDuration();
		int startTime = (int)note.getStartTime();
		int strength = note.getStrength();

		return new Note(pitch+val, duration, startTime, strength);
	}
	
	// note = note - 2
	public static Note minus(Note note, int val){
		int pitch = note.getPitch();
		int duration = (int)note.getDuration();
		int startTime = (int)note.getStartTime();
		int strength = note.getStrength();

		return new Note(pitch-val, duration, startTime, strength);
	}
	
	// Melody = note + note
	public static Melody addNote(Note note_1, Note note_2){
		
		List<Note> noteList = new ArrayList<Note>();
		noteList.add(note_1);
		noteList.add(note_2);
		
		Melody melody = new Melody(noteList);
		
		return melody;
	}

	//melody  = melody + melody
	public static Melody addMelody(Melody melody_1, Melody melody_2)
	{
		List<Note> noteList_1 = melody_1.getNoteList();
		List<Note> noteList_2 = melody_2.getNoteList();
		
		List<Note> newNoteList = new ArrayList<Note>();
		
		if((noteList_2 == null) ||  (noteList_1 == null))
			throw new NullPointerException();
		
		int listSize = noteList_1.size();
		Note lastNote = noteList_1.get(listSize-1);
		int startTime = (int)lastNote.getStartTime() + (int)lastNote.getDuration();
		
		newNoteList.addAll(noteList_1);
		for(Note note: noteList_2)
		{
			Note tmp = new Note(note);
			tmp.setStartTime(startTime);
			newNoteList.add(tmp);
			startTime = startTime + (int)note.getDuration();
		}
		
		Melody melody = new Melody(newNoteList);
		return melody;
	}
	
	//melody  = melody * melody
	public static Melody multiplyMelody(Melody melody_1, Melody melody_2)
	{
		List<Note> noteList_1 = melody_1.getNoteList();
		List<Note> noteList_2 = melody_2.getNoteList();
		
		if((noteList_1 == null) || (noteList_2 == null))
			throw new NullPointerException();
		
		List<Note> newNoteList = new ArrayList<Note>(noteList_1);
		
		newNoteList.addAll(noteList_2);
		Melody melody = new Melody(newNoteList);
		return melody;
	}

	//melody  = melody + note
	public static Melody addNote(Melody melody, Note note){
		
		List<Note> noteList = melody.getNoteList();
		
		if(noteList == null)
			noteList = new ArrayList<Note>();
		
		List<Note> newNoteList = new ArrayList<Note>();
		newNoteList.addAll(noteList);
		newNoteList.add(note);
		
		Melody newMelody = new Melody(newNoteList);
		return newMelody;
	}

	//melody  = note + melody
	public static Melody addNote(Note note, Melody melody){
	
		List<Note> noteList = melody.getNoteList();
		
		if(noteList == null)
			noteList = new ArrayList<Note>();
		
		List<Note> newNoteList = new ArrayList<Note>();
		newNoteList.addAll(noteList);
		newNoteList.add(note);
		
		Melody newMelody = new Melody(newNoteList);
		return newMelody;
	}

	//melody = melody * 3
	public static Melody multiplyInt(Melody melody, int time){

		 Melody newMelody = new Melody(melody);
			for(int i=0;i<time-1;i++){
				System.out.println(newMelody.getLength());
				newMelody = addMelody(newMelody,melody);
			}
			return newMelody;
	}

	//melody = 3 *  melody
	public static Melody multiplyInt(int time, Melody melody){
	
        Melody newMelody = new Melody(melody);
		for(int i=0;i<time;i++){
			newMelody = addMelody(newMelody,melody);
		}
		return newMelody;
	}

	// music = music + music
	public static Music addMusic(Music music_1, Music music_2)// music played later
	{
		List<Track> trackList_2 = music_2.getTracks();
		List<Track> trackList_1 = music_1.getTracks();

		List<Track> newTrackList = new ArrayList<Track>();
		
		if((trackList_1 == null) || (trackList_2 == null))
				throw new NullPointerException();

		int maxEndTime = (int)music_1.getTimeLength();
		
		
		newTrackList.addAll(trackList_1);
		
		for(Track track : trackList_2)
		{
			Melody melody = track.getMelody();
			if(melody == null)
				throw new NullPointerException();
			
			List<Note> newNoteList = new ArrayList<Note>();
			List<Note> noteLists = melody.getNoteList();
			if(noteLists == null)
				throw new NullPointerException();
			
			int startTime = maxEndTime;
			for(Note note: noteLists)
			{
				Note tmp = new Note(note);
				tmp.setStartTime(startTime);
				
				newNoteList.add(tmp);
				
				startTime = startTime + (int)note.getDuration();
			}
			Melody newMelody = new Melody(newNoteList);
			Track newTrack = new Track(newMelody, track.getTimbre());
			newTrackList.add(newTrack);
			// System.out.println(newTrack.getMelody().getNote(0).getStartTime()+"hhhh");
		}
		
		Music newMusic = new Music(newTrackList);

		return newMusic;
		
	}
	
	// music = music * music
	public static Music multiplyMusic(Music music_1, Music music_2)
	{
		List<Track> trackList_1 = music_1.getTracks();
		List<Track> trackList_2 = music_2.getTracks();
		
		List<Track> trackList = new ArrayList<Track>();

		if((trackList_1 == null) || (trackList_2 == null))
				throw new NullPointerException();
		
		for(Track track : trackList_2)
		{
			Melody melody = track.getMelody();
			if(melody == null)
				throw new NullPointerException();
			
			List<Note> noteLists = melody.getNoteList();
			if(noteLists == null)
				throw new NullPointerException();
		
		}
		trackList.addAll(trackList_1);
		trackList.addAll(trackList_2);

		Music newMusic = new Music(trackList);
		return newMusic;
	}

}
