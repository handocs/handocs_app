import 'package:flutter/material.dart';
import 'package:handocs_app/app/helpers/constants.dart';

class HDButton {
  static Widget defaultButton(String textButton, Function() function,
      [IconData? icon]) {
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
                stops: const [0.20, 0.50, 0.90],
                transform: const GradientRotation(1)),
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
          onPressed: function,
          child: _textButton(icon, textButton),
        ),
      ),
    );
  }

  static Widget defaultButtonShort(String textButton, Function() function,
      [IconData? icon]) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
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
                stops: const [0.20, 0.50, 0.90],
                transform: const GradientRotation(1)),
            borderRadius: BorderRadius.circular(5),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                  blurRadius: 5) //blur radius of shadow
            ]),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(60, 60),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: const EdgeInsets.all(5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: function,
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Icon(
              icon,
              color: HDColor.buttonText,
              size: 36.0,
            ),
          ]),
        ),
      ),
    );
  }

  static Widget _textButton(IconData? icon, String textButton) {
    if (icon != null) {
      return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Icon(
          icon,
          color: HDColor.buttonText,
          size: 36.0,
        ),
        //const SizedBox(          width: 10,        ),
        Text(
          '        $textButton',
          style: TextStyle(fontSize: 16, color: HDColor.buttonText),
        )
      ]);
    } else {
      return Text(
        textButton,
        style: TextStyle(fontSize: 12, color: HDColor.buttonText),
      );
    }
  }
}
