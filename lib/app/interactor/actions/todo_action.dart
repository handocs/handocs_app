import 'package:handocs_app/app/interactor/atoms/todo_atom.dart';
import 'package:handocs_app/app/interactor/models/todo_model.dart';

var _autoIncrement = 4;

Future<void> fetchTodos() async {  todoState.value = [];}

Future<void> putTodo(TodoModel model) async {
  if (model.id == -1) {
    //create
    _autoIncrement++;
    todoState.value = [
      ...todoState.value,
      model.copyWith(id: _autoIncrement),
    ];
  } else {
    //update
    final index = todoState.value.indexWhere((e) => e.id == model.id);
    todoState.value[index] = model;
    todoState();
  }
}

Future<void> deleteTodo(int id) async {  todoState.value = todoState.value.where((e) => e.id != id).toList();}
