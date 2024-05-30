import 'package:flutter/material.dart';
import 'package:handocs_app/app/components/card_category.dart';
import 'package:handocs_app/app/helpers/constants.dart';
import '../interactor/models/categoria_model.dart';

class HDGridCategories {
  static Widget defaultGridCategories(List<CategoriaModel> categorias) {
    return Container(
      color: HDColor.bodyBackground,
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: categorias.length,
        itemBuilder: (ctx, i) {
          final categoria = categorias[i];
          return HDCardCategory.defaultCardCategory(
              categoria.nome,
              IconData(categoria.icone, fontFamily: 'MaterialIcons'),
              categoria.qtdeItens,
              categoria.qtdeCompartilhados);
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 5,
          mainAxisExtent: 120,
        ),
      ),
    );
  }
}
