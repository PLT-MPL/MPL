package definition;
import java.util.*;
 
public class Melody {
     
    private List<Note> m_noteList;
     
    public Melody(){
         
        m_noteList = new ArrayList<Note>();
    }
     
    public Melody(List<Note> noteList){
         
        m_noteList = new ArrayList<Note>(noteList);
    }
     
    public Melody(Melody melody){
         
        if(m_noteList == null)
            m_noteList = new ArrayList<Note>();
         
        m_noteList = new ArrayList<Note>(melody.getNoteList());
    }
     
    public List<Note> getNoteList(){
         
        return m_noteList;
    }
     
    public void setNoteList(List<Note> noteList){
         
        m_noteList = noteList;
    }
     
    public Melody subMelody(int startPoint, int endPoint){
         
        List<Note> newNoteList = new ArrayList<Note>();
         
        if((startPoint < 0) || (endPoint >= m_noteList.size()))
                throw new NullPointerException(); // extends exception
         
        for(int i=startPoint;i<=endPoint;i++)
            newNoteList.add(m_noteList.get(i));
         
         
        Melody subMelody = new Melody(newNoteList);
        return subMelody;
    }
     
    public void addNote(Note note){
         
        if(m_noteList == null)
            m_noteList = new ArrayList<Note>();
         
        m_noteList.add(note);
    }
     
    public void deleteNote(int index){
         
        if(index >= m_noteList.size())
            throw new NullPointerException(); 
         
        m_noteList.remove(index);
    }
     
    public Note getNote(int index){
         
        return m_noteList.get(index);
    }
     
    public int getLength(){
         
        return m_noteList.size();
    }
     
    public long getTimeLength(){
         
        long maxEnd = 0;
        for(Note note : m_noteList)
        {
            long endtime = note.getStartTime() + note.getDuration();
            if(endtime > maxEnd)
                maxEnd = endtime;
        }
        return maxEnd;
    }
     
    public void addMelody(Melody melody)
    {
        List<Note> noteLists = melody.getNoteList();
        if(noteLists == null)
            throw new NullPointerException();
         
        int listSize = m_noteList.size();
        Note lastNote = m_noteList.get(listSize-1);
        int startTime = lastNote.getStartTime() + lastNote.getDuration();
         
        for(Note note: noteLists)
        {
            note.setStartTime(startTime);
            startTime = startTime + note.getDuration();
        }
        m_noteList.addAll(noteLists);
    }
     
    public void multipleMelody(Melody melody)
    {
        List<Note> noteLists = melody.getNoteList();
        if(noteLists == null)
            throw new NullPointerException();
         
        m_noteList.addAll(noteLists);
    }
}