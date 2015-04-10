package definition;

public class Track {
	private int t_timbre;
	private Melody t_melody;
	
	public Track(){
		// TODO:
		t_timbre = 0;
		t_melody = new Melody();
	}
	
	public Track(Melody melody){
		t_melody = melody;
	}
	
	public Track(Melody melody, int timbre){
		t_melody = melody;
		t_timbre = timbre;
	}
	
	public Track(Track track){
		t_timbre = track.getTimbre();
		t_melody = new Melody(track.getMelody());
	}
	
	public void setTimbre(int timbre){
		t_timbre = timbre;
	}
	
	public void insertMelody(int startTime, Melody melody){
		// TODO:
	}
	
	public Melody getMelody(){
		return t_melody;
	}
	
	public int getTimbre(){
		return t_timbre;
	}
	
	public int getLength(){
		return t_melody.getLength();
	}
}
