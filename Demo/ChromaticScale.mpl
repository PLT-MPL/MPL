
void main(string arg[]) {

	setNoteDefault(C4, 250, 0, 200);
	Melody melody = Melody();

	for(int i = 0; i < 13; i++){
		Note note = Note(C4+i);
		melody.addNote(note);
	}
	Track track = Track(melody, PIANO);

	Music music = Music();
	music.insertTrack(track);

	write(music, "ChromaticScale.mid");
}
