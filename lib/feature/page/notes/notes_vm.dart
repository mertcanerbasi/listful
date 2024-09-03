import 'package:injectable/injectable.dart';
import 'package:listfull/core/base/base_view_model.dart';
import 'package:listfull/feature/data/repository/notes_repository.dart';

@injectable
class NotesViewModel extends BaseViewModel {
  final NotesRepository _notesRepository;

  NotesViewModel(this._notesRepository);
}
