import 'package:flutter/material.dart';
import 'package:itskalendar/constants/colors.dart';

enum AppTheme {
  light,
  dark
}


class AppThemes {
  AppThemes._();

   static final appThemeData = {
     AppTheme.light: ThemeData(
       backgroundColor: AppColors.BackgroundColorLightMode, 
       cardColor: AppColors.CardColorLightMode,
       textTheme: TextTheme(
         headline1: TextStyle(
           color: AppColors.TitleColorLightMode,
           fontSize: 40,
           fontWeight: FontWeight.bold
         ),
         headline2: TextStyle(
           fontSize: 22,
           fontWeight: FontWeight.bold,
           color: AppColors.TextColorLightMode
         ),
         headline3: TextStyle(
           fontSize: 18,
           fontWeight: FontWeight.w500,
           color: AppColors.TextColorLightMode
         ),
         bodyText1: TextStyle(
           fontSize: 16,
           fontWeight: FontWeight.bold,
           color: AppColors.TextColorLightMode
         ),
         subtitle1: TextStyle(
           fontSize: 15,
           fontWeight: FontWeight.bold,
           color: AppColors.TextColorLightMode
         ),
         bodyText2: TextStyle(
           fontSize: 14,
           color: AppColors.TextColorLightMode
         ),
         subtitle2: TextStyle(
           fontSize: 14,
           color: AppColors.TextColorLightMode
         ),
         button: TextStyle(
           color: AppColors.TextColorLightMode,
           fontSize: 16,
           fontWeight: FontWeight.bold,
         ),
         caption: TextStyle(
           fontSize: 16,
           color: AppColors.TextColorLightMode
         ),

       ),
       iconTheme: IconThemeData(
         color: AppColors.TextColorLightMode
       ),
       secondaryHeaderColor: AppColors.HeaderColorLightMode,
       focusColor: AppColors.BackgroundColorLightMode,
       shadowColor: AppColors.ShadowColorLightMode,
       colorScheme: ColorScheme.light(secondary: AppColors.HeaderColorLightMode),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white
        )
     ),
     AppTheme.dark: ThemeData(
       backgroundColor: AppColors.BackgroundColorDarkMode,
       cardColor: AppColors.CardColorDarkMode,
       textTheme: TextTheme(
         headline1: TextStyle(
           color: AppColors.TitleColorDarkMode,
           fontSize: 40,
           fontWeight: FontWeight.bold
         ),
         headline2: TextStyle(
           fontSize: 22,
           fontWeight: FontWeight.bold,
           color: AppColors.TextColorDarkMode
         ),
         headline3: TextStyle(
           fontSize: 18,
           fontWeight: FontWeight.w500,
           color: AppColors.TextColorDarkMode
         ),
         bodyText1: TextStyle(
           fontSize: 16,
           fontWeight: FontWeight.bold,
           color: AppColors.TextColorDarkMode
         ),
         subtitle1: TextStyle(
           fontSize: 15,
           fontWeight: FontWeight.bold,
           color: AppColors.TextColorDarkMode
         ),
         bodyText2: TextStyle(
           fontSize: 14,
           color: AppColors.TextColorDarkMode
         ),
         subtitle2: TextStyle(
           fontSize: 14,
           color: AppColors.TextColorDarkMode
         ),
         button: TextStyle(
           color: AppColors.TextColorDarkMode,
           fontSize: 16,
           fontWeight: FontWeight.bold,
         ),
         caption: TextStyle(
           fontSize: 16,
           color: AppColors.TextColorDarkMode
         ),

       ),
       iconTheme: IconThemeData(
         color: AppColors.TextColorDarkMode
       ),
       secondaryHeaderColor: AppColors.HeaderColorDarkMode,
       focusColor: AppColors.BackgroundColorDarkMode,
       shadowColor: AppColors.ShadowColorDarkmode,
       colorScheme: ColorScheme.dark(
         secondary: AppColors.HeaderColorLightMode,

        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white
        )
     )
   };
}