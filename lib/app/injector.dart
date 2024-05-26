import 'package:auto_injector/auto_injector.dart';
import 'package:handocs_app/app/data/repositories/shared_perfil_repository.dart';
import 'interactor/repositories/perfil_repository.dart';

final injector = AutoInjector();

void registerInstances() {
  injector.add<PerfilRepository>(SharedPerfilRepository.new);
  injector.commit();
}
