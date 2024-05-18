import 'package:flutter/material.dart';
import 'package:handocs_app/app/components/card_itemcategory.dart';
import 'package:handocs_app/app/helpers/constants.dart';
import '../components/appbar.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HDAppBar.defaultAppBar(context, 'ITENS', false, true),
        body: Container(
            color: HDColor.bodyBackground,
            child: ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: 10,
              itemBuilder: (context, index) {
                return HDCardItemCategory.defaultCardItemCategory(
                    'text', Icons.insert_invitation, 1, 2);
              },
            )));
  }
}
