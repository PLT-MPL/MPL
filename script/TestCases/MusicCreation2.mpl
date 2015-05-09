
void main(string arg[]) {

	// The following two-line statements are used for
	// initialize required objects for the music:
	/* 1 1 5 5 | 6 6 5 - | 4 4 3 3 | 2 2 1 - || */
	
	setNoteDefault(C4, 250, 0, 200);
	// set pitch default value as C4, set starttime value as 0,
	// set duration value as 250, set strength value as 200

	Note notes0[] = {Note(), Note(), Note(G4), Note(G4),
		Note(A4), Note(A4),Note(G4, 500), Note(F4), Note(F4),
		Note(E4), Note(E4),Note(D4), Note(D4), Note(C4, 500)};
	// Initialize notes array

	Melody melody0 = Melody(notes0);
	// Initialize melody object

	Track tracks[] = {Track(melody0, VIOLIN)};
	// Initialize track[] array, which contains the track
	// from melody0 object with VIOLIN timbre.
	
	Music music = Music(tracks); // Initialize music object
	
	write(music, "twinkle_twinkle2.mid");
	// output a midi file.
	
	print("Done...\n");
	
}
