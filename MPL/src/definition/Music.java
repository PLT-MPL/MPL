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
	
	
	public static void addMusic(Music music_1, Music music_2)// music played later
	{
		List<Track> trackList_2 = music_2.getTracks();
		List<Track> trackList_1 = music_1.getTracks();

		if((trackList_1 == null) || (trackList_2 == null))
				throw new NullPointerException();

		long maxEndTime = music_1.getTimeLength();
		
		for(Track track : trackList_2)
		{
			Melody melody = track.getMelody();
			if(melody == null)
				throw new NullPointerException();
			
			List<Note> noteLists = melody.getNoteList();
			if(noteLists == null)
				throw new NullPointerException();
			
			long startTime = maxEndTime;
			for(Note note: noteLists)
			{
				note.setStartTime(startTime);
				startTime = startTime + note.getDuration();
			}
			melody.setNoteList(noteLists);
			track.setMelody(melody);
		}
		trackList_1.addAll(trackList_2);
		
	}
	
	public static void multipleMusic(Music music_1, Music music_2)
	{
		List<Track> trackList_1 = music_1.getTracks();
		List<Track> trackList_2 = music_2.getTracks();

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
		trackList_1.addAll(trackList_2);
	}
}
