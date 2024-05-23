import 'dart:convert';
import 'package:handocs_app/app/data/adapters/perfil_adapter.dart';
import 'package:handocs_app/app/interactor/repositories/perfil_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../interactor/models/perfil_model.dart';

const _key = 'PERFIL';

class SharedPerfilRepository implements PerfilRepository {
  @override
  Future<List<PerfilModel>> getAll() async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(_key);
    if (json == null) return [];
    final list = jsonDecode(json) as List;
    return list.map((e) => PerfilAdapter.fromMap(e)).toList();
  }

  @override
  Future<PerfilModel> insert(PerfilModel model) async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(_key) ?? '[]';
    final list = jsonDecode(json) as List;
    final email = list.isEmpty ? model.email : list.last['email'];
    final newModel = model.copyWith(email: email);
    list.add(PerfilAdapter.toMap(newModel));
    await shared.setString(_key, jsonEncode(list));
    return newModel;
  }

  @override
  Future<PerfilModel> update(PerfilModel model) async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(_key) ?? '[]';
    final list = jsonDecode(json) as List;
    final index = list.lastIndexWhere((e) => e['email' == model.email]);
    if (index == -1) throw Exception('Perfil não encontrado.');
    list[index] = PerfilAdapter.toMap(model);
    await shared.setString(_key, jsonEncode(list));
    return model;
  }

  @override
  Future<bool> delete(String email) async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(_key) ?? '[]';
    final list = jsonDecode(json) as List;
    final index = list.lastIndexWhere((e) => e['email' == email]);
    if (index == -1) throw Exception('Perfil não encontrado.');
    list.removeAt(index);
    await shared.setString(_key, jsonEncode(list));
    return true;
  }
}
