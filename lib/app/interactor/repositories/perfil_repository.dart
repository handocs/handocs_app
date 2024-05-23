import 'package:handocs_app/app/interactor/models/perfil_model.dart';

abstract class PerfilRepository {
  Future<List<PerfilModel>> getAll();

  Future<PerfilModel> insert(PerfilModel model);

  Future<PerfilModel> update(PerfilModel model);

  Future<bool> delete(String email);
}
