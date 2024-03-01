import 'package:asp_arch/app/(modules)/home/home_controller.dart';
import 'package:asp_arch/app/(modules)/task/controller/task_controller.dart';
import 'package:asp_arch/app/data/repositories/shared_todo_repository.dart';
import 'package:auto_injector/auto_injector.dart';

import 'interactor/repositories/todo_repository.dart';

final injector = AutoInjector();

void registerInstances() {
  injector.add<TaskController>(TaskController.new);
  injector.add<HomeController>(HomeController.new);
  injector.add<TodoRepository>(SharedTodoRepository.new);
}
