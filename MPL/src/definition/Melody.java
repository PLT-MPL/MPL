package definition;
import java.util.*;


public class Melody {
	
	private List<Note> m_noteList;
	
	public Melody()
	{
		m_noteList = new ArrayList<Note>();
	}
	
	public Melody(List<Note> noteList)
	{
		m_noteList = new ArrayList<Note>(noteList);
	}
	
	public Melody(Melody melody)
	{
		
	}
	
	public Melody subMelody(int startPoint, int endPoint)
	{
		List<Note> newNoteList = new ArrayList<Note>();
		
		if((startPoint < 0) || (endPoint >= m_noteList.size()))
				throw new NullPointerException(); // extends exception
		
		for(int i=startPoint;i<=endPoint;i++)
			newNoteList.add(m_noteList.get(i));
		
		
		Melody subMelody = new Melody(newNoteList);
		return subMelody;
	}
	
	public void addNote(Note note)
	{
		if(m_noteList == null)
			m_noteList = new ArrayList<Note>();
		
		m_noteList.add(note);
	}
	
	public void deleteNote(int index)
	{
		if(index >= m_noteList.size())
			throw new NullPointerException(); 
		
		m_noteList.remove(index);
	}
	
	
	
	

}