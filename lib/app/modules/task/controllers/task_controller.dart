import 'package:get/get.dart';
import 'package:gittask/app/repositories/task_repository.dart';

import '../../../repositories/models/task.dart';

class TaskController extends GetxController {
  //TODO: Implement TaskController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void createTask(String taskName, String taskDescription) {
    TaskRepository.createTask(Task(
      title: taskName,
      description:    taskDescription,
      isCompleted: false,
    ));
  }
}
