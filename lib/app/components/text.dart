import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handocs_app/app/helpers/constants.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HDText {
  static Widget defaultInputText(String label, bool obscureText,
      EdgeInsets padding, TextEditingController textController,
      [TextCapitalization textCap = TextCapitalization.none]) {
    return Padding(
        padding: padding,
        child: TextFormField(
          textCapitalization: textCap,
          controller: textController,
          obscureText: obscureText,
          decoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.grey),
              labelText: label,
              contentPadding: const EdgeInsets.all(8.0),
              labelStyle: TextStyle(
                  color: HDColor.buttonBronze,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),
              border: const OutlineInputBorder()),
          style: TextStyle(color: HDColor.buttonBronze, fontSize: 14.0),
        ));
    //Text(textButton, style: const TextStyle(color: Colors.white));
  }

  static Widget defaultInputMaskText(
      String label,
      bool obscureText,
      EdgeInsets padding,
      TextEditingController textController,
      MaskTextInputFormatter formatter,
      FormFieldValidator<String>? validator,
      String hint,
      TextInputType textInputType,
      [TextCapitalization textCap = TextCapitalization.none]) {
    return Padding(
        padding: padding,
        child: TextFormField(
          keyboardType: textInputType,
          textCapitalization: textCap,
          controller: textController,
          inputFormatters: [const UpperCaseTextFormatter(), formatter],
          validator: validator,
          obscureText: obscureText,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                  color: HDColor.buttonBronze,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),
              labelText: label,
              contentPadding: const EdgeInsets.all(8.0),
              labelStyle: TextStyle(
                  color: HDColor.buttonBronze,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),
              border: const OutlineInputBorder()),
          style: TextStyle(color: HDColor.buttonBronze, fontSize: 14.0),
        ));
    //Text(textButton, style: const TextStyle(color: Colors.white));
  }
}

class UpperCaseTextFormatter implements TextInputFormatter {
  const UpperCaseTextFormatter();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
        text: newValue.text.toUpperCase(), selection: newValue.selection);
  }
}
