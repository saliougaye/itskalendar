import 'package:flutter/material.dart';

enum AppTheme {
  light,
  dark
}


class AppThemes {
  AppThemes._();

   static final appThemeData = {
     AppTheme.light: ThemeData(
       backgroundColor: Colors.white, // #f4f0ec
       cardColor: Colors.white, // #f4f0ec
       textTheme: const TextTheme(),
     ),
     AppTheme.dark: ThemeData(
       backgroundColor: Colors.white, // #333333
       cardColor: Colors.white, // #444444
       textTheme: const TextTheme(),
     )
   };
}