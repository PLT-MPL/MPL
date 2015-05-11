
void main(string arg[]) {
	Music music = read("RowTheBoatSingle.mid");
	Melody melody1 = Melody(music.getTrack(0).getMelody());
	Melody melody2 = Melody(music.getTrack(0).getMelody());

	melody1.changeStrength(70);
	melody2.changeStrength(40);

	music.getTrack(0).insertMelody(2400, melody1);
	music.getTrack(0).insertMelody(4800, melody2);
	write(music, "RowTheBoatRepeated.mid");
}