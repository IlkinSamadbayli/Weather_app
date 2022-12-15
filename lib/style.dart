import 'package:flutter/material.dart';

class Customstyle {
  static dynamic get kButtonStyle => ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      );
}
