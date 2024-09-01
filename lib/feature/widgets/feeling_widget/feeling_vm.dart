import 'package:injectable/injectable.dart';
import 'package:listfull/core/base/base_view_model.dart';
import 'package:listfull/feature/data/model/mood.dart';
import 'package:listfull/feature/data/repository/mood_repository.dart';

@injectable
class FeelingViewModel extends BaseViewModel {
  final MoodRepository _moodRepository;

  FeelingViewModel(this._moodRepository);
  final List<Mood> moodList = [
    Mood(emoji: '😊', label: 'Happy'),
    Mood(emoji: '😔', label: 'Sad'),
    Mood(emoji: '😡', label: 'Angry'),
    Mood(emoji: '😴', label: 'Tired'),
    Mood(emoji: '😌', label: 'Relaxed'),
    Mood(emoji: '😅', label: 'Nervous'),
    Mood(emoji: '😎', label: 'Cool'),
    Mood(emoji: '😢', label: 'Crying'),
    Mood(emoji: '😠', label: 'Annoyed'),
  ];

  Mood? _selectedMood;
  Mood? get selectedMood => _selectedMood;
  Future<void> setselectedMood(Mood? selectedMood) async {
    _selectedMood = selectedMood;
    await saveMood();
    notifyListeners();
  }

  Future<void> saveMood() async {
    if (_selectedMood != null) {
      await _moodRepository.saveMood(_selectedMood!, DateTime.now());
    }
  }

  void getMood() async {
    final mood = _moodRepository.getMood(DateTime.now());
    setselectedMood(mood);
  }
}
