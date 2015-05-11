package definition;

public class Track {
	private int t_timbre;
	private Melody t_melody;
	
	public Track(){
		t_melody = new Melody();
		// Default timbre is set to PIANO
		t_timbre = 0;
	}	
	public Track(Melody melody){
		t_melody = melody;
		// Default is set to PIANO
		t_timbre = 0;
	}
	
	public Track(Melody melody, int timbre){
		t_melody = melody;
		t_timbre = timbre;
	}
	
	public Track(Track track){
		t_melody = new Melody(track.getMelody());
		t_timbre = track.getTimbre();
	}
	
	public void setTimbre(int timbre){
		t_timbre = timbre;
	}
	
	public void insertMelody(int startTime, Melody melody){
		
		if(startTime < 0)
			throw new IllegalArgumentException();
		int len = melody.getLength();
		for(int i = 0; i < len; i++){
			Note note = melody.getNote(i);
			long tmp_startTime = note.getStartTime() + startTime;
			Note newNote = new Note(note);
			newNote.setStartTime(tmp_startTime);
			t_melody.addNote(newNote);
		}
	}
	
	public Melody getMelody(){
		return t_melody;
	}
	
	public void setMelody(Melody melody)
	{
		t_melody = melody;
	}
	
	public int getTimbre(){
		return t_timbre;
	}
	
	public int getLength(){
		return t_melody.getLength();
	}
	/*
	
	*/
}