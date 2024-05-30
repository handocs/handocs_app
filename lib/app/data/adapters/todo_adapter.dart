import 'package:handocs_app/app/interactor/models/todo_model.dart';

class TodoAdapter {
  static Map<String, dynamic> toMap(TodoModel model) {
    return {'id': model.id, 'title': model.title, 'check': model.check};
  }

  static TodoModel fromMap(Map<String, dynamic> map) {
    return TodoModel(id: map['id'], title: map['title'], check: map['check']);
  }
}
