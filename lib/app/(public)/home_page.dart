import 'package:asp/asp.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:handocs_app/app/components/card_itemcategory.dart';
import 'package:handocs_app/app/interactor/actions/categoria_action.dart';
import 'package:handocs_app/app/interactor/atoms/categoria_atom.dart';
import 'package:handocs_app/app/interactor/models/categoria_model.dart';
import 'package:routefly/routefly.dart';
import '../components/appbar.dart';
import '../components/grid_categories.dart';
import '../helpers/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _editCards = false;
  bool _deleteCards = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      fetchCategorias().then((value) {
        if (categoriaState.value.isEmpty) putCategoriasDemo();
      });
    });
  }

  Widget build(BuildContext context) {
    return RxBuilder(builder: (_) {
      final categorias = categoriaState.value;
      return Scaffold(
        appBar: HDAppBar.defaultAppBar(
          context,
          'HOME',
          true,
          false,
          [
            IconButton(
                icon: Icon(Icons.add, color: HDColor.bronzeLight),
                onPressed: () {
                  Routefly.push('category_edit', arguments: null);
                }),
            IconButton(
                icon: Icon(Icons.edit, color: HDColor.bronzeLight),
                onPressed: () {
                  setState(() {
                    _editCards = !_editCards;
                    _deleteCards = false;
                  });
                }),
            IconButton(
                icon: Icon(Icons.delete, color: HDColor.bronzeLight),
                onPressed: () {
                  setState(() {
                    _deleteCards = !_deleteCards;
                    _editCards = false;
                  });
                })
          ],
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              Container(
                constraints: const BoxConstraints(maxHeight: 150.0),
                child: Material(
                  color: HDColor.bodyBackground,
                  child: TabBar(
                    indicatorColor: HDColor.bronzeLight,
                    tabs: const [
                      Tab(text: 'CATEGORIAS'),
                      Tab(text: 'COMPARTILHADOS'),
                    ],
                    labelColor: HDColor.bronzeLight,
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    HDGridCategories.defaultGridCategories(
                        categorias, _editCards, _deleteCards, _onTapItem),
                    HDGridCategories.defaultGridCategories(
                        categorias, _editCards, _deleteCards, _onTapItem),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  void _onTapItem(CategoriaModel model) {
    if (_editCards) {
      _deleteCards = false;
      _editCards = false;
      Routefly.push('category_edit', arguments: model);
    } else if (_deleteCards) {
      confirm(context,
              title: HDConfirm.confTitle,
              content: HDConfirm.confContent,
              textOK: HDConfirm.confOK,
              textCancel: HDConfirm.confCANCELAR)
          .then((value) {
        setState(() {
          if (value) {
            deleteCategoria(model.id);
          }
          _deleteCards = false;
          _editCards = false;
        });
      });
    } else {
      Routefly.push('category');
    }
  }
}
