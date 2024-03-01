import 'package:asp_arch/app/(modules)/task/atoms/todo_atom.dart';
import 'package:asp_arch/app/injector.dart';
import 'package:asp_arch/app/interactor/models/todo_model.dart';
import 'package:asp_arch/app/interactor/repositories/todo_repository.dart';

class TaskController {
  Future<void> fetchTodos() async {
    final repository = injector.get<TodoRepository>();
    todoState.value = await repository.getAll();
  }

  Future<void> putTodo(TodoModel model) async {
    final repository = injector.get<TodoRepository>();

    if (model.id == -1) {
      await repository.insert(model);
    } else {
      await repository.update(model);
    }
    // reload list
    fetchTodos();
  }

  Future<void> deleteTodo(int id) async {
    final repository = injector.get<TodoRepository>();
    await repository.delete(id);
    fetchTodos();
  }
}
