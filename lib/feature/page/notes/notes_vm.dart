import 'package:injectable/injectable.dart';
import 'package:listfull/core/base/base_view_model.dart';
import 'package:listfull/feature/data/model/note.dart';
import 'package:listfull/feature/data/repository/notes_repository.dart';

@injectable
class NotesViewModel extends BaseViewModel {
  final NotesRepository _notesRepository;

  NotesViewModel(this._notesRepository);

  late NoteList _notes;
  NoteList get notes => _notes;
  void setnotes(NoteList notes) {
    _notes = notes;
    notifyListeners();
  }

  bool _isAddingNote = false;
  bool get isAddingNote => _isAddingNote;
  void setisAddingNote(bool isAddingNote) {
    _isAddingNote = isAddingNote;
    notifyListeners();
  }

  Future<void> saveNote(String note) async {
    await _notesRepository.saveNotes(Note(
      note: note,
      id: "note_${DateTime.now().millisecondsSinceEpoch}",
    ));
  }

  void getNotes() {
    final notes = _notesRepository.getAllNotes();
    if (notes != null) {
      setnotes(notes);
    } else {
      setnotes(NoteList(notes: []));
    }
  }
}
