
void main(string arg[]) {

	string path0 = "twinkle_twinkle0.mid";
	string path1 = "twinkle_twinkle1.mid";
	Music music0 = read(path0); // reading music0
	Music music1 = read(path1); // reading music1

	Music music = music0 + music1;
	// concatenate music0 and music1 to create a new music.
	// music0 is played first then follows music1
	
	write(music, "new_twinkle_twinkle.mid");
	// export the midi file
	
	print("Done...\n");
	
}
