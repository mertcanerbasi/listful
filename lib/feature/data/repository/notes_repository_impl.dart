import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:listfull/core/source/local_data_source.dart';
import 'package:listfull/feature/data/model/note.dart';
import 'package:listfull/feature/data/repository/notes_repository.dart';

@LazySingleton(as: NotesRepository)
class NotesRepositoryImpl implements NotesRepository {
  final LocalDataSource _localDataSource;

  NotesRepositoryImpl(this._localDataSource);
  @override
  Future<void> clear() async {
    await _localDataSource.clear();
  }

  @override
  NoteList? getAllNotes() {
    return _localDataSource.getData('notes', NoteList.fromJson);
  }

  @override
  Future<void> saveNotes(Note note) async {
    NoteList? noteList = getAllNotes();
    if (noteList == null || noteList.notes == null) {
      noteList = NoteList(notes: [note]);
    } else {
      var existingNote =
          noteList.notes!.firstWhereOrNull((t) => t.id == note.id);
      if (existingNote != null) {
        noteList.notes!.remove(existingNote);
      }
      noteList.notes!.add(note);
    }
    await _localDataSource.setData('notes', noteList, (m) => m.toJson());
  }
}
