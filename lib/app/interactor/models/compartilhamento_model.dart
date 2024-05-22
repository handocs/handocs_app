class CompartilhamentoModel {
  final int categoriaId;
  final String emailProprietario;
  final String emailCompartilhado;
  final DateTime aceiteEm;
  final DateTime criadoEm;
  final DateTime atualizadoEm;
  final DateTime deletadoEm;

  CompartilhamentoModel(
      {required this.categoriaId,
      required this.emailProprietario,
      required this.emailCompartilhado,
      required this.aceiteEm,
      required this.criadoEm,
      required this.atualizadoEm,
      required this.deletadoEm});

  CompartilhamentoModel copyWith(
      {int? categoriaId,
      String? emailProprietario,
      String? emailCompartilhado,
      DateTime? aceiteEm,
      DateTime? criadoEm,
      DateTime? atualizadoEm,
      DateTime? deletadoEm}) {
    return CompartilhamentoModel(
        categoriaId: categoriaId ?? this.categoriaId,
        emailProprietario: emailProprietario ?? this.emailProprietario,
        emailCompartilhado: emailCompartilhado ?? this.emailCompartilhado,
        aceiteEm: aceiteEm ?? this.aceiteEm,
        criadoEm: criadoEm ?? this.criadoEm,
        atualizadoEm: atualizadoEm ?? this.atualizadoEm,
        deletadoEm: deletadoEm ?? this.deletadoEm);
  }
}
