import '../../../../core/base/viewmodel/base_view_model.dart';

class TaskDetailViewModel extends BaseViewModel {
  bool isDone = false;

  @override
  void init() {}

  void doneTask() {
    isDone = !isDone;
    setState();
  }
}
