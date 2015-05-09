
void main(string arg[]) {

	setNoteDefault(C4, 200, 0, 200);
	Note new_note = Note(C4);

	setNoteDefault(C4, 200, 0, 200);
	Note notes[] = {Note(C4), Note(D4),
	Note(E4), Note(F4)};
	Melody melody = Melody(notes);

	// Original melody: 1 2 3 4 ||
	// New melody:		1 2 0 4 ||
	melody.deleteNote(2);

	print ("Done...\n");
	
}
