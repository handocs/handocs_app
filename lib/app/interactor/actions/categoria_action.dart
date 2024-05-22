import '../atoms/categoria_atom.dart';
import '../models/categoria_model.dart';

var _autoIncrement = 4;

Future<void> fetchCategorias() async {
  categoriaState.value = [];
}

Future<void> putCategoria(CategoriaModel model) async {}

Future<void> deleteCategoria(int id) async {
  categoriaState.value = categoriaState.value.where((e) => e.id != id).toList();
}
