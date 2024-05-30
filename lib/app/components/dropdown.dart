import 'package:flutter/material.dart';

class HDDropdown {

  static String? _dropdownvalue = null;

  static Widget defaultDropdownList(Function(String?) fOnChanged, ) {
    return DropdownButton(
      items: [
        const DropdownMenuItem(child: Text('Teste 01'), value: '01'),
        const DropdownMenuItem(child: Text('Teste 02'), value: '02')
      ],
      value: _dropdownvalue,
      onChanged: fOnChanged,
      isExpanded: true,
    );
  }
}
