
void main(string arg[]) {

	setNoteDefault(C4, 250, 0, 200);
	Note notes[] = {Note(), Note(), Note(G4), Note(G4),
		Note(A4), Note(A4),Note(G4, 500), Note(F4), Note(F4),
		Note(E4), Note(E4),Note(D4), Note(D4), Note(C4, 500)};
	Melody melody0 = Melody(notes);
	Track track0 = Track(melody0);
	Track track1 = Track(melody0, VIOLIN);
	Track tracks[] = {track0, track1};

	Music music0 = Music(); // construct a new Music object

	Music music1 = Music(tracks);
	// construct a new Music object based on the tracks[] array

	Music music2 = Music(music1);
	// clone an existing Music object to a new Music object

	string path = "twinkle_twinkle.mid";
	Music music = read(path); // read in the midi file from path

	write(music, "new_twinkle_twinkle.mid");
	// write the new music to output path

	print ("Done...\n");

}
