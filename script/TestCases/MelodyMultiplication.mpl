
void main(string arg[]) {

	string path = "twinkle_twinkle.mid";
	Music music = read(path); //read in the music midi file

	Track tracks[] = music.getTracks();
	// tracks[0] is for the melody with timbre value
	// of Piano and tracks[1] is of the melody with
	// timbre value of Violin

	// Original melody:
	// 1 - 5 - | 6 - 5 - | 4 - 3 - | 2 - 1 - |
	// 5 - 4 - | 3 - 2 - | 5 - 4 - | 3 - 2 - ||

	// After multiplication:
	// 1 1 5 5 | 6 6 5 - | 4 4 3 3 | 2 2 1 - |
	// 1 - 5 - | 6 - 5 - | 4 - 3 - | 2 - 1 - |
	//
	// 5 5 4 4 | 3 3 2 - | 5 5 4 4 | 3 3 2 - ||
	// 5 - 4 - | 3 - 2 - | 5 - 4 - | 3 - 2 - ||

	tracks[1].getMelody() *= tracks[0].getMelody();
	// get the melody of the piano track and superimpose
	// it to the melody of the violin track to set as
	// the new melody of the violin track

	write(music, "new_twinkle_twinkle.mid");
	// export to a midi file

	print ("Done...\n");
	
}
