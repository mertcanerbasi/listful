import 'package:injectable/injectable.dart';
import 'package:listfull/core/base/base_view_model.dart';
import 'package:listfull/feature/data/model/mood.dart';

@injectable
class FeelingViewModel extends BaseViewModel {
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
  void setselectedMood(Mood? selectedMood) {
    _selectedMood = selectedMood;
    notifyListeners();
  }
}
