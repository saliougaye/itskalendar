import 'package:flutter/material.dart';

Color hexToColor(String hexCode) {
  return Color(
    int.parse(
      hexCode.substring(1, 7),
      radix: 16
    )
    +
    0xFF000000
  );
}