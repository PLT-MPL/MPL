
void main(string arg[]) {

	Music music = read("twinkle_twinkle2.mid");
	
	//reading music
	for(int i = 0; i < music.getNumberOfTracks(); i++) {
		music.getTrack(i).setTimbre(PIANO);
	}
	
	// for each track in the music, set its timbre to VIOLIN
	write(music, "new_twinkle_twinkle.mid");
	// export the midi file
	
	print("Done...\n");
	
}
