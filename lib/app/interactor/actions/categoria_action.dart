import 'package:handocs_app/app/interactor/atoms/categoria_atom.dart';
import '../../injector.dart';
import '../models/categoria_model.dart';
import '../repositories/categoria_repository.dart';

var _autoIncrement = 4;

Future<void> fetchCategorias() async {
  final repository = injector.get<CategoriaRepository>();
  categoriaState.value = await repository.getAll();
}

Future<void> putCategoria(CategoriaModel model) async {
  final repository = injector.get<CategoriaRepository>();
  if (model.id <= 0) {
    await repository.insert(model);
  } else {
    await repository.update(model);
  }
  fetchCategorias();
}

Future<void> deleteCategoria(int id) async {
  final repository = injector.get<CategoriaRepository>();
  await repository.delete(id);
  fetchCategorias();
}

Future<void> putCategorias(List<CategoriaModel> listModel) async {
  final repository = injector.get<CategoriaRepository>();
  for (CategoriaModel model in listModel) {
    if (model.id < 1) {
      await repository.insert(model);
    } else {
      await repository.update(model);
    }
  }

  fetchCategorias();
}

Future<void> putCategoriasDemo() async {
  final repository = injector.get<CategoriaRepository>();

  await putCategoria(CategoriaModel(
      id: 0,
      nome: 'CARTÃO FIN.',
      tipo: 'CARTAO',
      icone: 0xe19f,
      qtdeItens: 0,
      qtdeCompartilhados: 0,
      criadoEm: DateTime.now().toIso8601String()));

  await putCategoria(CategoriaModel(
      id: 0,
      nome: 'CARTÃO VIS.',
      tipo: 'CONTATO',
      icone: 0xe491,
      qtdeItens: 0,
      qtdeCompartilhados: 0,
      criadoEm: DateTime.now().toIso8601String()));

  await putCategoria(CategoriaModel(
      id: 0,
      nome: 'LINKS',
      tipo: 'LINK',
      icone: 0xe6dd,
      qtdeItens: 0,
      qtdeCompartilhados: 0,
      criadoEm: DateTime.now().toIso8601String()));

  await putCategoria(CategoriaModel(
      id: 0,
      nome: 'RECEITAS',
      tipo: 'RECEITA',
      icone: 0xe39e,
      qtdeItens: 0,
      qtdeCompartilhados: 0,
      criadoEm: DateTime.now().toIso8601String()));

  await putCategoria(CategoriaModel(
      id: 0,
      nome: 'DOCUMENTOS',
      tipo: 'DOCUMENTO',
      icone: 0xe1f2,
      qtdeItens: 0,
      qtdeCompartilhados: 0,
      criadoEm: DateTime.now().toIso8601String()));
}
