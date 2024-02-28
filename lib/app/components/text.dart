import 'package:flutter/material.dart';
import 'package:handocs_app/app/helpers/constants.dart';

class HDText {
  static Widget defaultInputText(String label, EdgeInsets padding) {
    return Padding(
        padding: padding,
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(
                  color: HDColor.buttonBronze,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),
              border: const OutlineInputBorder()),
          style: TextStyle(color: HDColor.buttonBronze, fontSize: 10.0),
        ));
    //Text(textButton, style: const TextStyle(color: Colors.white));
  }
}
