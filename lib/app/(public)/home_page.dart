import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:handocs_app/app/interactor/actions/categoria_action.dart';
import 'package:handocs_app/app/interactor/atoms/categoria_atom.dart';
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
        appBar: HDAppBar.defaultAppBar(context, 'HOME', true, true, [
          IconButton(
              icon: Icon(Icons.add, color: HDColor.bronzeLight),
              onPressed: () {
                Routefly.push('category_edit');
              })
        ]),
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
                    HDGridCategories.defaultGridCategories(categorias),
                    HDGridCategories.defaultGridCategories(categorias),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
