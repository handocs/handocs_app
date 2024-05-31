import 'package:flutter/material.dart';

class HDTag {
  static Widget defaultTag(String label) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.yellow, width: 5.0),
        borderRadius: BorderRadius.circular(3.0),
        shape: BoxShape.rectangle,
      ),
      child: const Text(
        'Create an account',
        style: TextStyle(color: Colors.black, fontSize: 12),
      ),
    );
  }
}
