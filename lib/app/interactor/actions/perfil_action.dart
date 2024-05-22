import '../atoms/perfil_atom.dart';
import '../models/perfil_model.dart';

var _autoIncrement = 4;

Future<void> fetchPerfils() async {
  perfilState.value = [];
}

Future<void> putPerfil(PerfilModel model) async {}

Future<void> deletePerfil(String email) async {
  perfilState.value = perfilState.value.where((e) => e.email != email).toList();
}
