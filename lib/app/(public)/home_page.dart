import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:handocs_app/app/interactor/actions/todo_action.dart';
import '../components/appbar.dart';
import '../components/grid_categories.dart';
import '../helpers/constants.dart';
import '../interactor/atoms/todo_atom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    fetchTodos();
  }

  Widget build(BuildContext context) {
    return RxBuilder(builder: (_) {
      final todos = todoState.value;
      return Scaffold(
        appBar: HDAppBar.defaultAppBar(context, 'HOME', true, true),
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
                      Tab(text: 'PESQUISA'),
                    ],
                    labelColor: HDColor.bronzeLight,
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    HDGridCategories.defaultGridCategories(todos),
                    HDGridCategories.defaultGridCategories(todos),
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
