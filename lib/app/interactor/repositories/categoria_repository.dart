import '../models/categoria_model.dart';

abstract class CategoriaRepository {
  Future<List<CategoriaModel>> getAll();

  Future<CategoriaModel> insert(CategoriaModel model);

  Future<CategoriaModel> update(CategoriaModel model);

  Future<bool> delete(int id);
}
