class CategoriaItemModel {
  final int id;
  final int categoriaId;
  final String tipo;
  final String nome;
  final String descricao;
  final String ref01;
  final String ref02;
  final String ref03;
  final String ref04;
  final bool favoritado;
  final String validade;
  final String tags;
  final String criadoEm;
  final String? atualizadoEm;
  final String? deletadoEm;

  CategoriaItemModel(
      {required this.id,
      required this.categoriaId,
      required this.tipo,
      required this.nome,
      required this.descricao,
      required this.ref01,
      required this.ref02,
      required this.ref03,
      required this.ref04,
      required this.favoritado,
      required this.validade,
      required this.tags,
      required this.criadoEm,
      this.atualizadoEm,
      this.deletadoEm});

  CategoriaItemModel copyWith(
      {int? id,
      int? categoriaId,
      String? tipo,
      String? nome,
      String? descricao,
      String? ref01,
      String? ref02,
      String? ref03,
      String? ref04,
      bool? favoritado,
      String? validade,
      String? tags,
      String? criadoEm,
      String? atualizadoEm,
      String? deletadoEm}) {
    return CategoriaItemModel(
        id: id ?? this.id,
        categoriaId: categoriaId ?? this.categoriaId,
        tipo: tipo ?? this.tipo,
        nome: nome ?? this.nome,
        descricao: descricao ?? this.descricao,
        ref01: ref01 ?? this.ref01,
        ref02: ref02 ?? this.ref02,
        ref03: ref03 ?? this.ref03,
        ref04: ref04 ?? this.ref04,
        favoritado: favoritado ?? this.favoritado,
        validade: validade ?? this.validade,
        tags: tags ?? this.tags,
        criadoEm: criadoEm ?? this.criadoEm,
        atualizadoEm: atualizadoEm ?? this.atualizadoEm,
        deletadoEm: deletadoEm ?? this.deletadoEm);
  }
}
