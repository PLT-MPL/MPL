package definition;

public class Track {
	private int timbre;
	private Melody melody;
	
	public Track(){}
	
	public Track(Melody melody){
		
	}
	
	public Track(Melody melody, int timbre){}
	
	public Track(Track track){
		timbre = track.timbre;
		melody = new Melody(track.melody);
	}
	
	public void setTimbre(int timbre){
		this.timbre = timbre;
	}
	
	public void insertMelody(int startTime, Melody melody){
		
	}
	
	public Melody getMelody(){
		return melody;
	}
	
	public int getLength(){
		return melody.getLength();
	}
}
