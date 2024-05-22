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
  final DateTime validade;
  final String tags;
  final DateTime criadoEm;
  final DateTime atualizadoEm;
  final DateTime deletadoEm;

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
      required this.atualizadoEm,
      required this.deletadoEm});

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
      DateTime? validade,
      String? tags,
      DateTime? criadoEm,
      DateTime? atualizadoEm,
      DateTime? deletadoEm}) {
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
