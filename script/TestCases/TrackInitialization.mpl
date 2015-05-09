
void main(string arg[]) {

	setNoteDefault(C4, 250, 0, 200);
	Note notes[] = {Note(), Note(), Note(G4), Note(G4),
		Note(A4), Note(A4),Note(G4, 500), Note(F4), Note(F4),
		Note(E4), Note(E4),Note(D4), Note(D4), Note(C4, 500)};
	Melody melody0 = Melody(notes);

	Track track0 = Track(); //construct a new track object

	Track track1 = Track(melody0);
	// construct a new Track object based on melody0 with the
	// default timbre as PIANO

	Track track2 = Track(melody0, VIOLIN);
	// construct a new Track object based on melody0 and set the
	// timbre as VIOLIN

	Track track3 = Track(track1);
	// construct a new Track object which has same attributes as track1

	print ("Done...\n");
	
}
