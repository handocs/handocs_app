import 'package:handocs_app/app/interactor/actions/categoria_item_action.dart';
import 'package:handocs_app/app/interactor/atoms/categoria_atom.dart';
import 'package:handocs_app/app/interactor/models/categoria_item_model.dart';
import '../../injector.dart';
import '../models/categoria_model.dart';
import '../repositories/categoria_repository.dart';

Future<void> fetchCategorias() async {
  final repository = injector.get<CategoriaRepository>();
  categoriaState.value = await repository.getAll();
}

Future<CategoriaModel> putCategoria(CategoriaModel model) async {
  final repository = injector.get<CategoriaRepository>();
  CategoriaModel modelReturn;

  if (model.id <= 0) {
    modelReturn = await repository.insert(model);
  } else {
    modelReturn = await repository.update(model);
  }

  fetchCategorias();

  return modelReturn;
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
  //DEMO - TIPO CARTAO
  await putCategoria(CategoriaModel(
          id: 0,
          nome: 'CARTÃO FIN.',
          tipo: 'CARTAO',
          icone: 0xe19f,
          qtdeItens: 0,
          qtdeCompartilhados: 0,
          criadoEm: DateTime.now().toIso8601String()))
      .then((value) {
    putCategoriaItem(CategoriaItemModel(
        id: 0,
        categoriaId: value.id,
        tipo: value.tipo,
        nome: 'Demo 01',
        descricao: 'Demo item.',
        ref01: '5555 9999 9999 9999',
        ref02: 'FULANO T SILVA',
        ref03: '01/99',
        ref04: '123',
        favoritado: false,
        validade: DateTime(1999, 12, 31).toIso8601String(),
        tags: 'TAG01,TAG02',
        criadoEm: DateTime.now().toIso8601String()));

    putCategoriaItem(CategoriaItemModel(
        id: 0,
        categoriaId: value.id,
        tipo: value.tipo,
        nome: 'Demo 02',
        descricao: 'Demo item.',
        ref01: '1111 9999 9999 9999',
        ref02: 'CICLANO T SILVA',
        ref03: '01/99',
        ref04: '123',
        favoritado: false,
        validade: DateTime(1999, 12, 31).toIso8601String(),
        tags: 'TAG03,TAG04',
        criadoEm: DateTime.now().toIso8601String()));
  });

  //DEMO - TIPO CONTATO
  await putCategoria(CategoriaModel(
          id: 0,
          nome: 'CARTÃO VIS.',
          tipo: 'CONTATO',
          icone: 0xe491,
          qtdeItens: 0,
          qtdeCompartilhados: 0,
          criadoEm: DateTime.now().toIso8601String()))
      .then((value) {
    putCategoriaItem(CategoriaItemModel(
        id: 0,
        categoriaId: value.id,
        tipo: value.tipo,
        nome: 'JOAO DA SILVA DEMO',
        descricao: 'CONTATO DO JOÃO',
        ref01: 'joao.silva@demo.com',
        ref02: '(11)9.9999-9999',
        ref03: 'HANDOCS LTDA',
        ref04: 'Amigo do fulano.',
        favoritado: false,
        validade: DateTime(1999, 12, 31).toIso8601String(),
        tags: 'TAG03,TAG04',
        criadoEm: DateTime.now().toIso8601String()));

    putCategoriaItem(CategoriaItemModel(
        id: 0,
        categoriaId: value.id,
        tipo: value.tipo,
        nome: 'MARIA DA SILVA DEMO',
        descricao: 'CONTATO DA MARIA',
        ref01: 'mario.silva@demo.com',
        ref02: '(11)9.8888-8888',
        ref03: 'BANCO DO BRASIL LTDA',
        ref04: 'Gerente de conta.',
        favoritado: false,
        validade: DateTime(1999, 12, 31).toIso8601String(),
        tags: 'TAG03,TAG04',
        criadoEm: DateTime.now().toIso8601String()));
  });

  //DEMO - TIPO LINK
  await putCategoria(CategoriaModel(
          id: 0,
          nome: 'LINKS',
          tipo: 'LINK',
          icone: 0xe6dd,
          qtdeItens: 0,
          qtdeCompartilhados: 0,
          criadoEm: DateTime.now().toIso8601String()))
      .then((value) {
    putCategoriaItem(CategoriaItemModel(
        id: 0,
        categoriaId: value.id,
        tipo: value.tipo,
        nome: 'GOOGLE',
        descricao: 'Sistema de busca.',
        ref01: 'https://www.google.com',
        ref02: '',
        ref03: '',
        ref04: '',
        favoritado: false,
        validade: DateTime(1999, 12, 31).toIso8601String(),
        tags: 'TAG05,TAG06',
        criadoEm: DateTime.now().toIso8601String()));

    putCategoriaItem(CategoriaItemModel(
        id: 0,
        categoriaId: value.id,
        tipo: value.tipo,
        nome: 'TREINAMENTOS',
        descricao: 'Sistema de treinamentos.',
        ref01: 'https://www.udemy.com/',
        ref02: '',
        ref03: '',
        ref04: '',
        favoritado: false,
        validade: DateTime(1999, 12, 31).toIso8601String(),
        tags: 'TAG03,TAG04',
        criadoEm: DateTime.now().toIso8601String()));
  });

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
