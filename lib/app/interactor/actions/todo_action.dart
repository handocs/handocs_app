import 'package:handocs_app/app/interactor/atoms/todo_atom.dart';
import 'package:handocs_app/app/interactor/models/todo_model.dart';
import '../../injector.dart';
import '../repositories/todo_repository.dart';

var _autoIncrement = 4;

Future<void> fetchTodos() async {
  final repository = injector.get<TodoRepository>();
  todoState.value = await repository.getAll();
}

Future<void> putTodo(TodoModel model) async {
  final repository = injector.get<TodoRepository>();
  if (model.id <= 0) {
    await repository.insert(model);
  } else {
    await repository.update(model);
  }
  fetchTodos();
}

Future<void> deleteTodo(int id) async {
  final repository = injector.get<TodoRepository>();
  await repository.delete(id);
  fetchTodos();
}
