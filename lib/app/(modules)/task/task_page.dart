import 'package:asp/asp.dart';
import 'package:asp_arch/app/(modules)/task/atoms/todo_atom.dart';
import 'package:asp_arch/app/(modules)/task/controller/task_controller.dart';
import 'package:asp_arch/app/injector.dart';
import 'package:asp_arch/app/interactor/models/todo_model.dart';
import 'package:asp_arch/app/utils/widgets/navbar/nav_model.dart';
import 'package:asp_arch/app/utils/widgets/scaffold/base_scaffold.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final controller = injector.get<TaskController>();

  @override
  void initState() {
    // TODO: implement initState
    controller.fetchTodos();
  }

  void editTodoDialog([TodoModel? model]) {
    model ??= TodoModel(id: -1, title: '', check: false);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Todo'),
          content: TextFormField(
            initialValue: model?.title,
            onChanged: (value) {
              model = model!.copyWith(title: value);
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                controller.deleteTodo(model!.id);
                Navigator.pop(context);
              },
              child: const Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                controller.putTodo(model!);
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int selectedTab = 1;
    List<NavModel> items = [];

    var _selectedIndex = 1;
    return RxBuilder(builder: (context) {
      final todos = todoState.value;
      return BaseScaffold(
        selectedTab: selectedTab,
        items: items,
        selectedIndex: _selectedIndex,
        floatingActionButton: Container(
          margin: const EdgeInsets.only(top: 50),
          height: 64,
          width: 64,
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            elevation: 0,
            onPressed: () {
              editTodoDialog();
            },
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 3, color: Colors.black),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ),
        page: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (_, index) {
            final todo = todos[index];
            return GestureDetector(
              onLongPress: () {
                editTodoDialog(todo);
              },
              child: CheckboxListTile(
                value: todo.check,
                title: Text(todo.title),
                onChanged: (value) {
                  controller.putTodo(
                    todo.copyWith(check: value!),
                  );
                },
              ),
            );
          },
        ),
      );
    });
  }
}
