
void main(string arg[]) {
			Note notes0[] = {Note(G5,400), Note(E5,200), Note(F5,200), Note(G5,400), Note(E5,200), 
							 Note(F5,200), Note(G5,200), Note(G4,200), Note(A4,200), Note(B4,200), 
							 Note(C5,200), Note(D5,200), Note(E5,200), Note(F5,200), Note(E5,400), 
							 Note(C5,200), Note(D5,200), Note(E5,400), Note(E4,200), Note(F4,200),
			 				 Note(G4,200), Note(A4,200), Note(G4,200), Note(F4,200), Note(G4,200), 
			 				 Note(C5,200), Note(B4,200), Note(C5,200), Note(A4,400), Note(C5,200), 
			 				 Note(B4,200), Note(A4,400), Note(G4,200), Note(F4,200), Note(G4,200), 
			 				 Note(F4,200), Note(E4,200), Note(F4,200), Note(G4,200), Note(A4,200), 
			 				 Note(B4,200), Note(C5,200), Note(A4,400), Note(C5,200), Note(B4,200), 
			 				 Note(C5,400), Note(B4,200), Note(C5,200), Note(B4,200), Note(C5,200),  
			 				 Note(D5,200), Note(C5,200), Note(B4,200), Note(C5,200), Note(A4,200),  
			 				 Note(B4,200), Note(C5,800)};
			
			/*
			L: C3(8) G3(8) C4(8) E4(8) G2(8) G3(8) B3(8) D4(8)
			
			L: A2(8) E3(8) A3(8) C4(8) E2(8) E3(8) G3(8) B3(8)
			
			L: F2(8) F3(8) A3(8) C4(8) C3(8) E3(8) G3(8) C4(8)

			L: F2(8) F3(8) A3(8) C4(8) G2(8) G3(8) B3(8) D4(8)
			
			L: C4(1)
			*/
			
			setNoteDefault(C4,400,0,70);
			Note notes1[] = {Note(C3,400), Note(G3,400), Note(C4,400), Note(E4,400), Note(G2,400), 
							 Note(G3,400), Note(B3,400), Note(D4,400), Note(A2,400), Note(E3,400), 
							 Note(A3,400), Note(C4,400), Note(E2,400), Note(E3,400), Note(G3,400),  
							 Note(B3,400), Note(F2,400), Note(F3,400), Note(A3,400), Note(C4,400), 
							 Note(C3,400), Note(E3,400), Note(G3,400), Note(C4,400), Note(F2,400), 
							 Note(F3,400), Note(A3,400), Note(C4,400), Note(G2,400), Note(G3,400), 
							 Note(B3,400), Note(D4,400), Note(C4,800)};
			
			Melody melody0 = Melody(notes0);
			Melody melody1 = Melody(notes1);
			Track tracks[] = {Track(melody0,VIOLIN), Track(melody1,PIANO)};
			Music music =  Music(tracks);
			Music music2 = Music(music);
			music += music2;
			// Write to File
			write(music, "canon.mid");
}