import 'package:injectable/injectable.dart';
import 'package:listfull/core/base/base_view_model.dart';

@injectable
class FeelingViewModel extends BaseViewModel {
  final List<Map<String, String>> moods = [
    {'emoji': '😊', 'label': 'Happy'},
    {'emoji': '😔', 'label': 'Sad'},
    {'emoji': '😡', 'label': 'Angry'},
    {'emoji': '😴', 'label': 'Tired'},
    {'emoji': '😌', 'label': 'Relaxed'},
    {'emoji': '😅', 'label': 'Nervous'},
    {'emoji': '😎', 'label': 'Cool'},
    {'emoji': '😢', 'label': 'Crying'},
    {'emoji': '😠', 'label': 'Annoyed'},
  ];
}
