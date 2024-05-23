class PerfilModel {
  final String email;
  final String nome;
  final String senha;
  final String? codigoAcesso;
  final String? codigoAcessoValidade;
  final bool biometria;
  final DateTime criadoEm;
  final DateTime? atualizadoEm;

  PerfilModel(
      {required this.email,
      required this.nome,
      required this.senha,
      required this.codigoAcesso,
      required this.codigoAcessoValidade,
      required this.biometria,
      required this.criadoEm,
      required this.atualizadoEm});

  PerfilModel copyWith(
      {String? email,
      String? nome,
      String? senha,
      String? codigoAcesso,
      String? codigoAcessoValidade,
      bool? biometria,
      DateTime? criadoEm,
      DateTime? atualizadoEm}) {
    return PerfilModel(
        email: email ?? this.email,
        nome: nome ?? this.nome,
        senha: senha ?? this.senha,
        codigoAcesso: codigoAcesso ?? this.codigoAcesso,
        codigoAcessoValidade: codigoAcessoValidade ?? this.codigoAcessoValidade,
        biometria: biometria ?? this.biometria,
        criadoEm: criadoEm ?? this.criadoEm,
        atualizadoEm: atualizadoEm ?? this.atualizadoEm);
  }
}
