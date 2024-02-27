import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handocs_app/app/helpers/constants.dart';

class HDButton {
  static Widget defaultButton(String textButton) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: FractionalOffset.topRight,
                end: FractionalOffset.bottomLeft,
                colors: [
                  HDColor.buttonBronzeLight,
                  HDColor.buttonBronze,
                  HDColor.buttonBronzeLight,
                ],
                stops: [0.20, 0.50, 0.90],
                transform: GradientRotation(1)),
            borderRadius: BorderRadius.circular(5),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                  blurRadius: 5) //blur radius of shadow
            ]),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(300, 60),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {},
          child: Text(
            textButton,
            style: TextStyle(fontSize: 12, color: HDColor.buttonText),
          ),
        ),
      ),
    );
  }
}
