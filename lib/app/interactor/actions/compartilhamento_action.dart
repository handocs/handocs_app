import '../atoms/compartilhamento_atom.dart';
import '../models/compartilhamento_model.dart';

Future<void> fetchCompartilhamentos() async {
  compartilhamentoState.value = [];
}

Future<void> putCompartilhamento(CompartilhamentoModel model) async {}

Future<void> deleteCompartilhamento(int categoriaId) async {
  compartilhamentoState.value = compartilhamentoState.value
      .where((e) => e.categoriaId != categoriaId)
      .toList();
}
