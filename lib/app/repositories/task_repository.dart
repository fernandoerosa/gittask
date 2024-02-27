import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

import 'models/task.dart';

class TaskRepository {
  static createTask(Task task) {
    var box = Hive.box<Task>('tasks');

    box.flush();

    Logger().i('task created');
  }
}
