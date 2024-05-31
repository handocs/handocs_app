import '../models/categoria_item_model.dart';

abstract class CategoriaItemRepository {
  Future<List<CategoriaItemModel>> getAll(int categoriaId);

  Future<CategoriaItemModel> insert(CategoriaItemModel model);

  Future<CategoriaItemModel> update(CategoriaItemModel model);

  Future<bool> delete(int id);
}
