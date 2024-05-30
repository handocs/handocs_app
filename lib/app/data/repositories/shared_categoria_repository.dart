import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../interactor/models/categoria_model.dart';
import '../../interactor/repositories/categoria_repository.dart';
import '../adapters/categoria_adapter.dart';

const _key = 'CATEGORIA';

class SharedCategoriaRepository implements CategoriaRepository {
  @override
  Future<List<CategoriaModel>> getAll() async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(_key);
    if (json == null) return [];
    final list = jsonDecode(json) as List;
    return list.map((e) => CategoriaAdapter.fromMap(e)).toList();
  }

  @override
  Future<CategoriaModel> insert(CategoriaModel model) async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(_key) ?? '[]';
    final list = jsonDecode(json) as List;
    //final email = list.isEmpty ? model.email : list.last['email'];
    //final newModel = model.copyWith(email: email);
    list.add(CategoriaAdapter.toMap(model));
    await shared.setString(_key, jsonEncode(list));
    return model;
  }

  @override
  Future<CategoriaModel> update(CategoriaModel model) async {
    return insert(model);
  }

  @override
  Future<bool> delete(int id) async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(_key) ?? '[]';
    final list = jsonDecode(json) as List;
    final index = list.lastIndexWhere((e) => e['id' == id]);
    if (index == -1) throw Exception('Categoria não encontrado.');
    list.removeAt(index);
    await shared.setString(_key, jsonEncode(list));
    return true;
  }
}
