import '../../injector.dart';
import '../atoms/categoria_item_atom.dart';
import '../models/categoria_item_model.dart';
import '../repositories/categoria_item_repository.dart';

Future<void> fetchCategoriaItens(int categoriaId) async {
  final repository = injector.get<CategoriaItemRepository>();
  categoriaItemState.value = await repository.getAll(categoriaId);
}

Future<void> putCategoriaItem(CategoriaItemModel model) async {
  final repository = injector.get<CategoriaItemRepository>();
  if (model.id <= 0) {
    await repository.insert(model);
  } else {
    await repository.update(model);
  }
  fetchCategoriaItens(model.categoriaId);
}

Future<void> deleteCategoriaItem(int id, int categoriaId) async {
  final repository = injector.get<CategoriaItemRepository>();
  await repository.delete(id);
  fetchCategoriaItens(categoriaId);
}


