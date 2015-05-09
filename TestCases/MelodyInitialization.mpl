
void main(string arg[]) {

	setNoteDefault(C4, 250, 0, 200);
	// set pitch default value as C4, set duration value as 250,
	// set starttime value as 0, set strength value as 200

	Note notes[] = {Note(), Note(), Note(G4), Note(G4),
		Note(A4), Note(A4),Note(G4, 500), Note(F4), Note(F4),
		Note(E4), Note(E4),Note(D4), Note(D4), Note(C4, 500)};
	// Initialize notes array

	Melody melody0 = Melody(); // construct a new melody object

	Melody melody1 = Melody(notes);
	// construct a new Melody object composed of the input the
	// note array notes[]

	Melody melody2 = Melody(melody0);
	// construct a new Melody object which has same attributes
	// as the input melody0.

	print ("Done...\n");

}
