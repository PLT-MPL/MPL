package definition;

public class Music {
	public Music(){}
	
	public Music(Track [] tracks){}
	
	public Music (Music music){}
	
	public Track getTrack(int index){
		return tracks[index];
	}
	
	public Track [] getTracks(){
		return tracks;
	}
	
	public int getNumberOfTracks(){
		return tracks.length;
	}
	
	public int getTimeLength(){
		int maxTimeLength = 0;
		for(Track track : tracks)
			if(track.getMelody().getTimeLength() > maxTimeLength)
				return maxTimeLength;
				
	}
	
	private Track [] tracks;
}
