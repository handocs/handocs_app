import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:handocs_app/app/components/card_itemcategory.dart';
import 'package:handocs_app/app/helpers/constants.dart';
import 'package:handocs_app/app/interactor/actions/categoria_item_action.dart';
import 'package:handocs_app/app/interactor/atoms/categoria_item_atom.dart';
import 'package:handocs_app/app/interactor/models/categoria_model.dart';
import 'package:routefly/routefly.dart';
import '../components/appbar.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final _categoriaModel = Routefly.query.arguments as CategoriaModel;

  @override
  void initState() {
    super.initState();
    setState(() {
      fetchCategoriaItens(_categoriaModel.id).then((value) {
        //TODO: Anything
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return RxBuilder(builder: (_) {
      final itens = categoriaItemState.value;

      return Scaffold(
          appBar: HDAppBar.defaultAppBar(
              context, _categoriaModel.nome, true, true, [
            IconButton(
                icon: Icon(Icons.add, color: HDColor.bronzeLight),
                onPressed: () {
                  Routefly.push('category_item_edit', arguments: null);
                })
          ]),
          body: Container(
              color: HDColor.bodyBackground,
              child: ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: itens.length,
                itemBuilder: (context, index) {
                  return HDCardItemCategory.defaultCardItemCategory(
                      itens[index]);
                },
              )));
    });
  }
}
