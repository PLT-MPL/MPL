package definition;


public class Note {
	
	private static final int C4 = 0;
	
	private int m_pitch;
	private int m_duration;
	private int m_starttime;
	private int m_strength;

	
	public Note()
	{
		m_pitch = 0;
		m_duration = 0;
		m_starttime = 0;
		m_strength = 0;
	}
	
	public Note(int pitch)
	{
		m_pitch = pitch;
	}
	
	public Note(int pitch, int duration)
	{
		m_pitch = pitch;
		m_duration = duration;
	}
	
	public Note(int pitch, int duration, int starttime)
	{
		m_pitch = pitch;
		m_duration = duration;
		m_starttime = starttime;
	}
	
	public Note(int pitch, int duration, int starttime, int strength)
	{
		m_pitch = pitch;
		m_duration = duration;
		m_starttime = starttime;
		m_strength = strength;
	}
	
	public Note(Note note)
	{
		m_pitch = note.getPitch();
		m_duration = note.getDuration();
		m_starttime = note.getStarttime();
		m_strength = note.getStrength();
	}
	
	public void setDuration(int duration)
	{
		m_duration = duration;
	}
	
	public int getDuration()
	{
		return m_duration;
	}
	
	public void setPitch(int pitch)
	{
		m_pitch = pitch;
	}
	
	public int getPitch()
	{
		return m_pitch;
	}
	
	public void setStrength(int strength)
	{
		m_strength = strength;
	}
	
	public int getStrength()
	{
		return m_strength;
	}
	
	public void setStarttime(int starttime)
	{
		m_starttime = starttime;
	}
	
	public int getStarttime()
	{
		return m_starttime;
	}
	
	
	public static void main(String[] args)
	{
		Note ob = new Note(C4);
	}
}
