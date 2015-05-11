
void main(string arg[]) {
	Music music = read("ChromaticScale.mid");

	for(int i = 0; i < music.getTrack(0).getMelody().getLength(); i++){
		music.getTrack(0).getMelody().getNote(i) += 12;
	}

	write(music, "RaiseTone.mid");
}
