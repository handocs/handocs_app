import 'package:flutter/material.dart';
import 'package:handocs_app/app/helpers/constants.dart';
import 'package:routefly/routefly.dart';

class HDAppBar {
  static PreferredSizeWidget defaultAppBar(
      BuildContext context, String title, bool showActions, bool showBack,
      [List<Widget> actions = const []]) {
    return AppBar(
        backgroundColor: HDColor.appBarBackground,
        leading: _showBack(showBack, context),
        centerTitle: true,
        actions: actions,
        title: Text(
          title,
          style: TextStyle(
              fontSize: 16,
              color: HDColor.appBarText,
              fontWeight: FontWeight.bold),
        ));
  }

  static Widget _showBack(bool showBack, BuildContext context) {
    if (showBack) {
      return IconButton(
          icon: Icon(Icons.arrow_back, color: HDColor.bronzeLight),
          onPressed: () {
            Routefly.pop(context);
          });
    } else {
      return const Icon(Icons.abc);
    }
  }
}
