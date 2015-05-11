
void main(string arg[]) {
	setNoteDefault(C4, 200, 0, 200);
	Note notes0r[] = {Note(E5, 100), Note(E5), Note(E5, 100), Note(0, 100), Note(C5, 100), Note(E5), Note(G5), Note(0), Note(G4), Note(0)};
	setNoteDefault(C4, 200, 0, 200);
	Note notes1r[] = {Note(C5), Note(0, 100), Note(G4, 100), Note(0), Note(E4), Note(0, 100), Note(A4), Note(B4, 100), Note(0, 100), Note(B4-1, 100), Note(A4)};
	setNoteDefault(C4, 200, 0, 200);
	Note notes2r[] = {Note(G4, 133), Note(E5, 133), Note(G5, 134), Note(A5), Note(F5, 100), Note(G5, 100), Note(0, 100), Note(E5), Note(C5, 100), Note(D5, 100), Note(B4, 100), Note(0, 100)};
	setNoteDefault(C4, 200, 0, 200);
	Note notes3r[] = {Note(0), Note(G5, 100), Note(F5+1, 100), Note(F5, 100), Note(D5+1), Note(E5, 100), Note(0, 100), Note(G4, 100), Note(A4, 100), Note(C5, 100), Note(0, 100), Note(A4, 100), Note(C5, 100), Note(D5, 100)};
	setNoteDefault(C4, 200, 0, 200);
	Note notes4r[] = {Note(0), Note(G5, 100), Note(F5+1, 100), Note(F5, 100), Note(D5+1), Note(E5, 100), Note(0, 100), Note(C6), Note(C6, 100), Note(C6), Note(0)};
	setNoteDefault(C4, 200, 0, 200);
	Note notes5r[] = {Note(0), Note(E5-1), Note(0, 100), Note(D5), Note(0, 100), Note(C5), Note(0), Note(0), Note(0)};

	setNoteDefault(C4, 200, 0, 200);
	Note notes0l[] = {Note(D3, 100), Note(D3), Note(D3, 100), Note(0, 100), Note(D3, 100), Note(D3), Note(0, 400), Note(G3), Note(0)};
	setNoteDefault(C4, 200, 0, 200);
	Note notes1l[] = {Note(G3), Note(0, 100), Note(E3, 100), Note(0), Note(C3), Note(0, 100), Note(F3), Note(G3, 100), Note(0, 100), Note(F3+1, 100), Note(F3)};
	setNoteDefault(C4, 200, 0, 200);
	Note notes2l[] = {Note(E3, 133), Note(C4, 133), Note(E4, 134), Note(F4), Note(D4, 100), Note(E4, 100), Note(0, 100), Note(C4), Note(A3, 100), Note(B3, 100), Note(G3, 100), Note(0, 100)};
	setNoteDefault(C4, 200, 0, 200);
	Note notes3l[] = {Note(C3), Note(0, 100), Note(G3, 100), Note(0), Note(C4), Note(F3), Note(0, 100), Note(C4, 100), Note(C4), Note(F3)};
	setNoteDefault(C4, 200, 0, 200);
	Note notes4l[] = {Note(C3), Note(0, 100), Note(E3, 100), Note(0), Note(G3, 100), Note(C4, 100), Note(0, 400), Note(0), Note(G3)};
	setNoteDefault(C4, 200, 0, 200);
	Note notes5l[] = {Note(C3), Note(G3+1), Note(0, 100), Note(B3-1), Note(0, 100), Note(C4), Note(0, 100), Note(G3, 100), Note(G3), Note(C3)};
	
	Melody melody0r = Melody(notes0r), melody1r = Melody(notes1r), melody2r = Melody(notes2r), melody3r = Melody(notes3r), melody4r = Melody(notes4r), melody5r = Melody(notes5r);
	Melody melody0l = Melody(notes0l), melody1l = Melody(notes1l), melody2l = Melody(notes2l), melody3l = Melody(notes3l), melody4l = Melody(notes4l), melody5l = Melody(notes5l);

	Melody melodyr = melody0r + (melody1r + melody2r) * 2 + melody3r + melody4r + melody3r + melody5r;
	Melody melodyl = melody0l + (melody1l + melody2l) * 2 + melody3l + melody4l + melody3l + melody5l;

	Track tracks[] = {Track(melodyl, PIANO), Track(melodyr, PIANO)};

	Music music = Music(tracks);

	write(music, "Super_Mario.mid");

	print("Done...\n");
}