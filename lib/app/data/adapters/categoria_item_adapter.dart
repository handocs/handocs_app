import '../../interactor/models/categoria_item_model.dart';

class CategoriaItemAdapter {
  static Map<String, dynamic> toMap(CategoriaItemModel model) {
    return {
      'id': model.id,
      'categoriaId': model.categoriaId,
      'tipo': model.tipo,
      'nome': model.nome,
      'descricao': model.descricao,
      'ref01': model.ref01,
      'ref02': model.ref02,
      'ref03': model.ref03,
      'ref04': model.ref04,
      'img01': model.img01,
      'img02': model.img02,
      'img03': model.img03,
      'favoritado': model.favoritado,
      'validade': model.validade,
      'tags': model.tags,
      'criadoEm': model.criadoEm,
      'atualizadoEm': model.atualizadoEm,
      'deletadoEm': model.deletadoEm
    };
  }

  static CategoriaItemModel fromMap(Map<String, dynamic> map) {
    return CategoriaItemModel(
        id: map['id'],
        categoriaId: map['categoriaId'],
        tipo: map['tipo'],
        nome: map['nome'],
        descricao: map['descricao'],
        ref01: map['ref01'],
        ref02: map['ref02'],
        ref03: map['ref03'],
        ref04: map['ref04'],
        img01: map['img01'],
        img02: map['img02'],
        img03: map['img03'],
        favoritado: map['favoritado'],
        validade: map['validade'],
        tags: map['tags'],
        criadoEm: map['criadoEm'],
        atualizadoEm: map['atualizadoEm'],
        deletadoEm: map['deletadoEm']);
  }
}
