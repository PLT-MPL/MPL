
Melody addChords1(Melody melody){

	Melody newMelody = Melody();
	for(int i = 0; i < melody.getLength(); i++){
		Note note = melody.getNote(i);
		int pitch = note.getPitch() - 12;
		int duration = note.getDuration();
		int starttime = note.getStartTime();
		int strength = note.getStrength();
		Note chord = Note(pitch, duration, starttime, strength);
		newMelody.addNote(chord);
	}
	return newMelody;
}

Melody addChords2(Melody melody){

	Melody newMelody = Melody();
	int i = 0;
	while(true){
		Note note = melody.getNote(i);
		int pitch = note.getPitch() - 12;
		int duration = note.getDuration();
		int starttime = note.getStartTime();
		int strength = note.getStrength();
		Note chord = Note(pitch, duration, starttime, strength);
		newMelody.addNote(chord);
		i++;
		if(i >= melody.getLength()) break;
	}
	return newMelody;
}


void main(string arg[]) {

	Music music = read("twinkle_twinkle0.mid");
	
	//reading music
	Melody melody = music.getTrack(0).getMelody();

	Melody newMelody = addChords1(melody);
	Track tracks[] = {music.getTrack(0), Track(newMelody, PIANO)};
	Music newMusic = Music(tracks);
	
	for(int i = 0; i < newMusic.getNumberOfTracks(); i++) {
		Track currentTrack = newMusic.getTrack(i);
   if ( i < newMusic.getNumberOfTracks() - 1) {
       continue;
   }
   currentTrack.setTimbre(VIOLIN);
}

	// for each track in the music, set its timbre to VIOLIN
	write(newMusic, "new_twinkle_twinkle.mid");
	// export the midi file
	
	print("Done...\n");
	
}
