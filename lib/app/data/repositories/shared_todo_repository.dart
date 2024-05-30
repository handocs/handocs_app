import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../interactor/models/todo_model.dart';
import '../../interactor/repositories/todo_repository.dart';
import '../adapters/todo_adapter.dart';

const _key = 'TODO';

class SharedTodoRepository implements TodoRepository {
  @override
  Future<List<TodoModel>> getAll() async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(_key);
    if (json == null) return [];
    final list = jsonDecode(json) as List;
    return list.map((e) => TodoAdapter.fromMap(e)).toList();
  }

  @override
  Future<TodoModel> insert(TodoModel model) async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(_key) ?? '[]';
    final list = jsonDecode(json) as List;
    //final email = list.isEmpty ? model.email : list.last['email'];
    //final newModel = model.copyWith(email: email);
    list.add(TodoAdapter.toMap(model));
    await shared.setString(_key, jsonEncode(list));
    return model;
  }

  @override
  Future<TodoModel> update(TodoModel model) async {
    return insert(model);
  }

  @override
  Future<bool> delete(int id) async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(_key) ?? '[]';
    final list = jsonDecode(json) as List;
    final index = list.lastIndexWhere((e) => e['id' == id]);
    if (index == -1) throw Exception('Todo não encontrado.');
    list.removeAt(index);
    await shared.setString(_key, jsonEncode(list));
    return true;
  }
}
