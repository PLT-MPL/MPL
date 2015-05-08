package definition;
import java.util.*;


public class Music {
	
	private List<Track> m_trackList;
	
	public Music(){
		m_trackList = new ArrayList<Track>();
	}
	
	public Music(List<Track> trackList){
		m_trackList = trackList;
	}
	
	public Music(Music music){
		m_trackList = new ArrayList<Track>(music.getTracks());
	}
	
	public void insertTrack(Track track){
		m_trackList.add(track);
	}
	
	public Track getTrack(int index){
		if(index >= m_trackList.size())
			throw new NullPointerException();
		
		return m_trackList.get(index);
	}
	
	public List<Track> getTracks(){
		return m_trackList;
	}
	
	public int getNumberOfTracks(){
		return m_trackList.size();
	}
	
	public long getTimeLength(){
		long maxTimeLength = 0;
		for(Track track : m_trackList)
			if(track.getMelody().getTimeLength() > maxTimeLength)
				maxTimeLength = track.getMelody().getTimeLength();
		
		return maxTimeLength;
	}
	
}
