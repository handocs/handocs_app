import 'package:handocs_app/app/interactor/models/perfil_model.dart';

class PerfilAdapter {
  static Map<String, dynamic> toMap(PerfilModel perfil) {
    return {
      'email': perfil.email,
      'nome': perfil.nome,
      'senha': perfil.senha,
      'codigoAcesso': perfil.codigoAcesso,
      'codigoAcessoValidade': perfil.codigoAcessoValidade,
      'biometria': perfil.biometria,
      'criadoEm': perfil.criadoEm,
      'atualizadoEm': perfil.atualizadoEm
    };
  }

  static PerfilModel fromMap(Map<String, dynamic> map) {
    return PerfilModel(
        email: map['email'],
        nome: map['nome'],
        senha: map['senha'],
        codigoAcesso: map['codigoAcesso'],
        codigoAcessoValidade: map['codigoAcessoValidade'],
        biometria: map['biometria'],
        criadoEm: map['criadoEm'],
        atualizadoEm: map['atualizadoEm']);
  }
}
