package definition;
import java.util.*;
public class Note {
	
	private int m_pitch;
	private int m_duration;
	private int m_startTime;
	private int m_strength;

	public Note()
	{
		m_pitch = C.NOTE_DEFAULT_PITCH;
		m_duration = C.NOTE_DEFAULT_DURATION;
		m_startTime = C.NOTE_DEFAULT_STARTTIME;
		m_strength = C.NOTE_DEFAULT_STRENGTH;
		C.NOTE_DEFAULT_STARTTIME += C.NOTE_DEFAULT_DURATION;
	}
	
	public Note(int pitch)
	{
		m_pitch = pitch;
		m_duration = C.NOTE_DEFAULT_DURATION;
		m_startTime = C.NOTE_DEFAULT_STARTTIME;
		if(pitch == 0)
			m_strength = 0;
		else
			m_strength = C.NOTE_DEFAULT_STRENGTH;
		C.NOTE_DEFAULT_STARTTIME += C.NOTE_DEFAULT_DURATION;
	}
	
	public Note(int pitch, int duration)
	{
		m_pitch = pitch;
		m_duration = duration;
		m_startTime = C.NOTE_DEFAULT_STARTTIME;		
		if(pitch == 0)
			m_strength = 0;
		else
			m_strength = C.NOTE_DEFAULT_STRENGTH;
		C.NOTE_DEFAULT_STARTTIME += duration;
	}
	
	public Note(int pitch, int duration, int startTime)
	{
		m_pitch = pitch;
		m_duration = duration;
		m_startTime = startTime;
		if(pitch == 0)
			m_strength = 0;
		else
			m_strength = C.NOTE_DEFAULT_STRENGTH;
	}
	
	public Note(int pitch, int duration, int startTime, int strength)
	{
		m_pitch = pitch;
		m_duration = duration;
		m_startTime = startTime;
		m_strength = strength;
	}
	
	public Note(Note note)
	{
		m_pitch = note.getPitch();
		m_duration = note.getDuration();
		m_startTime = note.getStartTime();
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
	
	public void setStartTime(int startTime)
	{
		m_startTime = startTime;
	}
	
	public int getStartTime()
	{
		return m_startTime;
	}
	
	public void plus(int val){
		m_pitch = m_pitch+val;
	}
	
	public void minus(int val){
		m_pitch = m_pitch - val;
	}

}
