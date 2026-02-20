import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app_v2/constant.dart';

import 'package:notes_app_v2/models/note_model.dart';
part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  int? x = 5;
  featchAllNotes() async {
    print("featch invocied");
    var notesBox = Hive.box(kNotesBox);
    notes = notesBox.values.toList() as List<NoteModel>;
    print("notes: $notes");
    emit(NotesSuccess(notes: notes!));
  }
}
