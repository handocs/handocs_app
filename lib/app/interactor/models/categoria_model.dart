class CategoriaModel {
  final int id;
  final String nome;
  final String tipo;
  final int icone;
  final int qtdeItens;
  final int qtdeCompartilhados;
  final String criadoEm;
  final String? atualizadoEm;
  final String? deletadoEm;

  CategoriaModel(
      {required this.id,
      required this.nome,
      required this.tipo,
      required this.icone,
      required this.qtdeItens,
      required this.qtdeCompartilhados,
      required this.criadoEm,
      this.atualizadoEm,
      this.deletadoEm});

  static CategoriaModel copyInit() {
    return CategoriaModel(
        id: -1,
        nome: '',
        tipo: '',
        icone: 0,
        qtdeItens: 0,
        qtdeCompartilhados: 0,
        criadoEm: DateTime.now().toIso8601String(),
        atualizadoEm: null,
        deletadoEm: null);
  }

  CategoriaModel copyWith(
      {int? id,
      String? nome,
      String? tipo,
      int? icone,
      int? qtdeItens,
      int? qtdeCompartilhados,
      String? criadoEm,
      String? atualizadoEm,
      String? deletadoEm}) {
    return CategoriaModel(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        tipo: tipo ?? this.tipo,
        icone: icone ?? this.icone,
        qtdeItens: qtdeItens ?? this.qtdeItens,
        qtdeCompartilhados: qtdeCompartilhados ?? this.qtdeCompartilhados,
        criadoEm: criadoEm ?? this.criadoEm,
        atualizadoEm: atualizadoEm ?? this.atualizadoEm,
        deletadoEm: deletadoEm ?? this.deletadoEm);
  }
}
