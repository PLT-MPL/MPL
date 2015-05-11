
void main(string arg[]) {
	Note notes[] = {Note(C4,600), Note(C4,600), Note(C4,450), Note(D4,150), 
					Note(E4,600), Note(E4,450), Note(D4,150), Note(E4,450), 
					Note(F4,150), Note(G4,1200), Note(C5,200), Note(C5,200), 
					Note(C5,200), Note(G4,200), Note(G4,200), Note(G4,200), 
					Note(E4,200), Note(E4,200), Note(E4,200), Note(C4,200), 
					Note(C4,200), Note(C4,200), Note(G4,450), Note(F4,150), 
					Note(E4,450), Note(D4,150), Note(C4,600)};

	Melody melody = Melody(notes);
	Track tracks[] = {Track(melody)};
	Music music = Music(tracks);
	write(music, "RowTheBoatSingle.mid");
}
