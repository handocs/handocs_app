import 'package:flutter/material.dart';
import 'package:handocs_app/app/components/card_category.dart';
import 'package:handocs_app/app/helpers/constants.dart';
import '../interactor/models/todo_model.dart';

class HDGridCategories {
  static Widget defaultGridCategories(List<TodoModel> todos) {
    return Container(
      color: HDColor.bodyBackground,
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: todos.length,
        itemBuilder: (ctx, i) {
          final todo = todos[i];
          return HDCardCategory.defaultCardCategory(
              todo.title, Icons.credit_card, 3, 25);
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
