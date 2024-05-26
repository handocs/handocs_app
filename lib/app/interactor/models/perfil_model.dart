class PerfilModel {
  final String email;
  final String nome;
  final String senha;
  final String? codigoAcesso;
  final String? codigoAcessoValidade;
  final bool biometria;
  final String? criadoEm;
  final String? atualizadoEm;

  PerfilModel(
      {required this.nome,
      required this.email,
      required this.senha,
      this.codigoAcesso,
      this.codigoAcessoValidade,
      required this.biometria,
      this.criadoEm,
      this.atualizadoEm});

  PerfilModel copyWith(
      {String? email,
      String? nome,
      String? senha,
      String? codigoAcesso,
      String? codigoAcessoValidade,
      bool? biometria,
      String? criadoEm,
      String? atualizadoEm}) {
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
