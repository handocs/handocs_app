import 'package:handocs_app/app/interactor/atoms/todo_atom.dart';
import 'package:handocs_app/app/interactor/models/todo_model.dart';

var _autoIncrement = 4;

Future<void> fetchTodo() async {
  todoState.value = [
    TodoModel(id: 1, title: 'Teste 01', check: false),
    TodoModel(id: 2, title: 'Teste 02', check: false),
    TodoModel(id: 3, title: 'Teste 03', check: false),
    TodoModel(id: 4, title: 'Teste 04', check: false),
  ];
}

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

Future<void> deleteTodo(int id) async {
  todoState.value = todoState.value.where((e) => e.id != id).toList();
}
