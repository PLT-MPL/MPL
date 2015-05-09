
void main(string arg[]) {

	string path = "twinkle_twinkle.mid";
	Music music = read(path);
	// read in the midi file from path

	Track tracks[] = music.getTracks(); //get tracks array
	
	/* 5 5 4 4 | 3 3 2 - | 5 5 4 4 | 3 3 2 - ||*/
	
	setNoteDefault(G4, 250, 0, 200);
	// set pitch default value as G4, set duration
	// value as 250, set starttime value as 0, set
	// strength value as 200

	Note notes0[] = {Note(), Note(), Note(F4), Note(F4),
	Note(E4), Note(E4), Note(D4, 500), Note(), Note(),
	Note(F4), Note(F4), Note(E4), Note(E4),
	Note(D4, 500)};

	// initialize notes array
	/* 5 - 4 - | 3 - 2 - | 5 - 4 - | 3 - 2 - ||*/
	setNoteDefault(G4, 500, 0, 200);
	// set pitch default value as G4, set duration value
	// as 500, set startime value as 0, set strength value
	// as 200
	
	Note notes1[] = {Note(), Note(F4), Note(E4), Note(D4),
	Note(), Note(F4), Note(E4), Note(D4)};
	
	// initialize notes array
	Melody melody0 = Melody(notes0);// Initialize melody0
	Melody melody1 = Melody(notes1);//Initialize melody1
	tracks[0].getMelody() += melody0;
	
	// concatenate melody0 to tracks[0]’s original melody
	tracks[1].getMelody() += melody1;
	
	// concatenate melody1 to tracks[1]’s original melody
	write(music, "new_twinkle_twinkle.mid");
	// write the new music to output path

	print ("Done...\n");
	
}
