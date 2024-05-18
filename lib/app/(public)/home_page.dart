import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
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
                  HDGridCategories.defaultGridCategories(),
                  HDGridCategories.defaultGridCategories(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
