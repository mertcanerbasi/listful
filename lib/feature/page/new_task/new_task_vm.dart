import 'package:injectable/injectable.dart';
import 'package:listfull/core/base/base_view_model.dart';
import 'package:listfull/feature/data/model/enums/priority_enums.dart';

@injectable
class NewTaskViewModel extends BaseViewModel {
  PriorityEnums _selectedPriority = PriorityEnums.low;
  PriorityEnums get selectedPriority => _selectedPriority;
  void setselectedPriority(PriorityEnums selectedPriority) {
    _selectedPriority = selectedPriority;
    notifyListeners();
  }
}
