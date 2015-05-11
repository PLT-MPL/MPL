
void main(string arg[]) {
	Music music = read("RowTheBoatSingle.mid");
	Melody melody1 = Melody(music.getTrack(0).getMelody());
	Melody melody2 = Melody(music.getTrack(0).getMelody());

	for(int i = 0; i < melody1.getLength(); i++)
		melody1.getNote(i).setStrength(70);

	music.getTrack(0).insertMelody(2400, melody1);
	write(music, "RowTheBoatRepeated.mid");
}