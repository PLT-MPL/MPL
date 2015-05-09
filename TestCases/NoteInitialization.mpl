
void main(string arg[]) {
	setNoteDefault(C4, 250, 0, 200);
	// set pitch default value as C4, set duration value as 250,
	// set starttime value as 250, set strength value as 200

	Note note0 = Note(); // Create a new note named note0

	Note note1 = Note(G4);
	// create a note with the pitch value as G4, and the values
	// of its duration, starttime, strength as default

	Note note2 = Note(G4,250);
	// create a note with the pitch value as G4, the duration
	// value as 250, and the values of its starttime,strength
	// as default

	Note note3 = Note(G4,250,500,300);
	// create a note with the pitch value as G4, the duration
	// value as 250, the starttime value as 500, and the
	// strength value as 300

	print ("Done...\n");

}
