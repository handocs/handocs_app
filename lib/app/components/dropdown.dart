import 'package:flutter/material.dart';

class HDDropdown {
  static String? _dropdownListValue;

  static Widget defaultDropdownList(
    Function(String?) fOnChanged,
  ) {
    return DropdownButton(
      items: const [
        DropdownMenuItem(value: '01', child: Text('Teste 01')),
        DropdownMenuItem(value: '02', child: Text('Teste 02'))
      ],
      value: _dropdownListValue,
      onChanged: fOnChanged,
      isExpanded: true,
    );
  }
}
