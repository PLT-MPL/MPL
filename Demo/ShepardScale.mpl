
void main(string arg[]) {

	int i;

	setNoteDefault(C4, 500, 0, 200);
	Melody melody1 = Melody();
	Melody melody2 = Melody();
	Melody melody3 = Melody();

	for(i = 0; i < 12; i++){
		Note note = Note(C4);
		Note note1 = note + i;
		Note note2 = note + i + 12;
		Note note3 = note + i - 12;
		Note note0 = Note(0);
		note2.setStrength((11 - i) * 10);
		if (i < 6)
			note1.setStrength((12 + i) * 10);
		else
			note1.setStrength((23 - i) * 10);
		note3.setStrength((i + 0) * 10);
		melody1.addNote(note1);
		melody1.addNote(note0);
		melody2.addNote(note2);
		melody2.addNote(note0);
		melody3.addNote(note3);
		melody3.addNote(note0);
	}

	melody1 *= 3;
	melody2 *= 3;
	melody3 *= 3;

	Track track1 = Track(melody1, VIOLIN);
	Track track2 = Track(melody2, VIOLIN);
	Track track3 = Track(melody3, VIOLIN);

	Music music = Music();
	music.insertTrack(track1);
	music.insertTrack(track2);
	music.insertTrack(track3);

	write(music, "ShepardScale.mid");
}
