import 'package:handocs_app/app/injector.dart';
import 'package:handocs_app/app/interactor/repositories/perfil_repository.dart';
import '../atoms/perfil_atom.dart';
import '../models/perfil_model.dart';

Future<void> fetchPerfils() async {
  final repository = injector.get<PerfilRepository>();
  perfilState.value = await repository.getAll();
}

Future<void> putPerfil(PerfilModel model) async {
  final repository = injector.get<PerfilRepository>();
  if (model.email == "") {
    await repository.insert(model);
  } else {
    await repository.update(model);
  }
  fetchPerfils();
}

Future<void> deletePerfil(String email) async {
  final repository = injector.get<PerfilRepository>();
  await repository.delete(email);
  fetchPerfils();
}
