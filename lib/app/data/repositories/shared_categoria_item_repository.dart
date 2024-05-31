import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../interactor/models/categoria_item_model.dart';
import '../../interactor/repositories/categoria_item_repository.dart';
import '../adapters/categoria_item_adapter.dart';

const _key = 'CATEGORIA_ITEM';

class SharedCategoriaItemRepository implements CategoriaItemRepository {
  @override
  Future<List<CategoriaItemModel>> getAll(int categoriaId) async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(_key);
    if (json == null) return [];
    final list = jsonDecode(json) as List;
    final listFiltered =
        list.where((e) => e['categoriaId'] == categoriaId).toList();
    return listFiltered.map((e) => CategoriaItemAdapter.fromMap(e)).toList();
  }

  @override
  Future<CategoriaItemModel> insert(CategoriaItemModel model) async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(_key) ?? '[]';
    final list = jsonDecode(json) as List;
    final id = list.isEmpty ? 1 : list.last['id'] + 1;
    final newModel = model.copyWith(id: id);
    list.add(CategoriaItemAdapter.toMap(newModel));
    await shared.setString(_key, jsonEncode(list));
    return newModel;
  }

  @override
  Future<CategoriaItemModel> update(CategoriaItemModel model) async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(_key) ?? '[]';
    final list = jsonDecode(json) as List;
    final index = list.lastIndexWhere((e) => e['id'] == model.id);
    if (index == -1) throw Exception('Item de categoria não encontrado.');
    list[index] = CategoriaItemAdapter.toMap(model);
    await shared.setString(_key, jsonEncode(list));
    return model;
  }

  @override
  Future<bool> delete(int id) async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(_key) ?? '[]';
    final list = jsonDecode(json) as List;
    final index = list.lastIndexWhere((e) => e['id'] == id);
    if (index == -1) throw Exception('Item de categoria não encontrado.');
    list.removeAt(index);
    await shared.setString(_key, jsonEncode(list));
    return true;
  }
}
