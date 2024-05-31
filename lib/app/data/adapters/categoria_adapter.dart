import '../../interactor/models/categoria_model.dart';

class CategoriaAdapter {
  static Map<String, dynamic> toMap(CategoriaModel model) {
    return {
      'id': model.id,
      'nome': model.nome,
      'tipo': model.tipo,
      'icone': model.icone,
      'qtdeItens': model.qtdeItens,
      'qtdeCompartilhados': model.qtdeCompartilhados,
      'criadoEm': model.criadoEm,
      'atualizadoEm': model.atualizadoEm,
      'deletadoEm': model.deletadoEm
    };
  }

  static CategoriaModel fromMap(Map<String, dynamic> map) {
    return CategoriaModel(
        id: map['id'],
        nome: map['nome'],
        tipo: map['tipo'],
        icone: map['icone'],
        qtdeItens: map['qtdeItens'],
        qtdeCompartilhados: map['qtdeCompartilhados'],
        criadoEm: map['criadoEm'],
        atualizadoEm: map['atualizadoEm'],
        deletadoEm: map['deletadoEm']);
  }
}
