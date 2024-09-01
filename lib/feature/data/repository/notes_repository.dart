import 'package:listfull/feature/data/model/note.dart';

abstract class NotesRepository {
  Future<void> saveNotes(Note note);
  Future<void> clear();
  NoteList? getAllNotes();
}
