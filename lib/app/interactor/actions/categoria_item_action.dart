import '../atoms/categoria_item_atom.dart';
import '../models/categoria_item_model.dart';

var _autoIncrement = 4;

Future<void> fetchCategoriaItems() async {
  categoriaItemState.value = [];
}

Future<void> putCategoriaItem(CategoriaItemModel model) async {}

Future<void> deleteCategoriaItem(int id) async {
  categoriaItemState.value =
      categoriaItemState.value.where((e) => e.id != id).toList();
}
