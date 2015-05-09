
void main(string arg[]) {

	// The following two-line statements are used for
	// initialize required objects for the music:
	/* 5 5 4 4 | 3 3 2 - | 5 5 4 4 | 3 3 2 - || */
	
	setNoteDefault(G4, 250, 0, 200);
	// set pitch default value as C4, set starttime value as 0,
	// set duration value as 250, set strength value as 200

	Note notes0[] = {Note(), Note(), Note(F4), Note(F4),
		Note(E4), Note(E4),Note(D4, 500), Note(), Note(),
		Note(F4), Note(F4),Note(E4), Note(E4), Note(D4, 500)};
	// Initialize notes array

	// The following two-line statements are used for initialize
	// required objects for the music:
	/* 5 - 4 - | 3 - 2 - | 5 - 4 - | 3 - 2 - || */

	setNoteDefault(G4, 500, 0, 200);
	// set pitch default value as C4, set duration value as 500,
	// set starttime value as 0, set strength value as 200

	Note notes1[] = {Note(), Note(F4), Note(E4),Note(D4),
	Note(), Note(F4),Note(E4), Note(D4)};
	// Initialize notes array for the violin part
	
	Melody melody0 = Melody(notes0), melody1 = Melody(notes1);
	// Initialize melody object

	Track tracks[] = {Track(melody0, PIANO), Track(melody1, VIOLIN)};
	// Initialize track[] array, which combines the track
	// from melody0 object with PIANO timbre, and another
	// track from melody1 object with VIOLIN timbre.
	
	Music music = Music(tracks); // Initialize music object
	
	write(music, "twinkle_twinkle1.mid");
	// output a midi file.
	
	print("Done...\n");
	
}
