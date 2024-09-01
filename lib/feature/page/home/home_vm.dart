import 'package:listfull/core/base/base_view_model.dart';
import 'package:injectable/injectable.dart';
import 'package:listfull/feature/data/model/enums/category_enums.dart';

@injectable
class HomeViewModel extends BaseViewModel {
  HomeViewModel();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setisLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  int _completedTasks = 3;
  int get completedTasks => _completedTasks;
  void setcompletedTasks(int completedTasks) {
    _completedTasks = completedTasks;
    notifyListeners();
  }

  int _taskCount = 5;
  int get taskCount => _taskCount;
  void settaskCount(int taskCount) {
    _taskCount = taskCount;
    notifyListeners();
  }

  CategoryEnums _selectedCategory = CategoryEnums.overview;
  CategoryEnums get selectedCategory => _selectedCategory;
  void setselectedCategory(CategoryEnums selectedCategory) {
    _selectedCategory = selectedCategory;
    notifyListeners();
  }

  DateTime _currentDate = DateTime.now();
  DateTime get currentDate => _currentDate;
  void setcurrentDate(DateTime currentDate) {
    _currentDate = currentDate;
    notifyListeners();
  }
}
