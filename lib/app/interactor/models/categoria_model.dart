class CategoriaModel {
  final int id;
  final String nome;
  final int icone;
  final int qtdeItens;
  final int qtdeCompartilhados;
  final String criadoEm;
  final String? atualizadoEm;
  final String? deletadoEm;

  CategoriaModel(
      {required this.id,
      required this.nome,
      required this.icone,
      required this.qtdeItens,
      required this.qtdeCompartilhados,
      required this.criadoEm,
      this.atualizadoEm,
      this.deletadoEm});

  CategoriaModel copyWith(
      {int? id,
      String? nome,
      int? icone,
      int? qtdeItens,
      int? qtdeCompartilhados,
      String? criadoEm,
      String? atualizadoEm,
      String? deletadoEm}) {
    return CategoriaModel(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        icone: icone ?? this.icone,
        qtdeItens: qtdeItens ?? this.qtdeItens,
        qtdeCompartilhados: qtdeCompartilhados ?? this.qtdeCompartilhados,
        criadoEm: criadoEm ?? this.criadoEm,
        atualizadoEm: atualizadoEm ?? this.atualizadoEm,
        deletadoEm: deletadoEm ?? this.deletadoEm);
  }
}
