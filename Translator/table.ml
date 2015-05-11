let base_table = 
	let table = Hashtbl.create 1024 in
	Hashtbl.add table "current_loop" "false";
	Hashtbl.add table "current_function_type" "None";
	Hashtbl.add table "Note" "int_int_int_int";
	Hashtbl.add table "Melody" "array_Note";
	Hashtbl.add table "Track" "Melody_int";
	Hashtbl.add table "Music" "array_Track";

	Hashtbl.add table "Note_setDuration" "Note_int_void";
	Hashtbl.add table "Note_getDuration" "Note_void_int";
	Hashtbl.add table "Note_setPitch" "Note_int_void";
	Hashtbl.add table "Note_getPitch" "Note_void_int";
	Hashtbl.add table "Note_setStartTime" "Note_int_void";
	Hashtbl.add table "Note_getStartTime" "Note_void_int";
	Hashtbl.add table "Note_setStrength" "Note_int_void";
	Hashtbl.add table "Note_getStrength" "Note_void_int";
	
	Hashtbl.add table "Melody_subMelody" "Melody_int_int_Melody";
	Hashtbl.add table "Melody_addNote" "Melody_Note_void";
	Hashtbl.add table "Melody_deleteNote" "Melody_int_void";
	Hashtbl.add table "Melody_getNote" "Melody_int_Note";
	Hashtbl.add table "Melody_getNotes" "Melody_void_array_Note";
	Hashtbl.add table "Melody_getLength" "Melody_void_int";
	Hashtbl.add table "Melody_getTimeLength" "Melody_void_int";
	Hashtbl.add table "Melody_speedUp" "Melody_void_int";
	Hashtbl.add table "Melody_speedDown" "Melody_void_int";
	Hashtbl.add table "Melody_changeStrength" "Melody_void_int";
	

	Hashtbl.add table "Track_setTimbre" "Track_int_void";
	Hashtbl.add table "Track_insertMelody" "Track_int_Melody_void";
	Hashtbl.add table "Track_getMelody" "Track_void_Melody";
	Hashtbl.add table "Track_getLength" "Track_void_int";

	Hashtbl.add table "Music_getTrack" "Music_int_Track";
	Hashtbl.add table "Music_getTracks" "Music_void_array_Track";
	Hashtbl.add table "Music_getNumberOfTracks" "Music_void_int";
	Hashtbl.add table "Music_getTimeLength" "Music_void_int";
	Hashtbl.add table "Music_insertTrack" "Music_Track_void";


	Hashtbl.add table "setNoteDefault" "void_int_int_int_int_void";
	Hashtbl.add table "changeToMillisecond" "void_int_int_int_int";
	Hashtbl.add table "printTime" "void_int_void";
	Hashtbl.add table "read" "void_String_Music";
	Hashtbl.add table "write" "void_Music_String_void";
	Hashtbl.add table "print" "void_String_void";
	Hashtbl.add table "sizeof" "void_array_Note_int";
	
	(* function_name: if called by note.func(): Type_funcname
					  if general function:		funcname
	   function_type: if called by note.func(): Type_argTypes_returnType
					  if general function: 		void_argTypes_returnType *)
	table