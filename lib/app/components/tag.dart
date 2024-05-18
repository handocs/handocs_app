import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:handocs_app/app/helpers/constants.dart';

class HDTag {
  static Widget defaultTag(String label) {
    return Container(
      padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.yellow, width: 5.0),
        borderRadius: BorderRadius.circular(3.0),
        shape: BoxShape.rectangle,
      ),
      child: Text(
        'Create an account',
        style: TextStyle(color: Colors.black, fontSize: 12),
      ),
    );
  }
}
