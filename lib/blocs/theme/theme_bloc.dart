import 'package:bloc/bloc.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:itskalendar/constants/strings.dart';
import 'package:itskalendar/constants/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {

  final SharedPreferences sharedPreferences;


  ThemeBloc({ required this.sharedPreferences })
    : super(ThemeState(
          appThemeData: 
            sharedPreferences.getString(AppStrings.ThemeSharedPreferenceKey) != null 
            ?  
            AppThemes.appThemeData[
              EnumToString.fromString(AppTheme.values, sharedPreferences.getString(AppStrings.ThemeSharedPreferenceKey)!)
            ]!
            :
            AppThemes.appThemeData[AppTheme.light]!,
          appTheme: sharedPreferences.getString(AppStrings.ThemeSharedPreferenceKey) != null 
          ?
          EnumToString.fromString(AppTheme.values, sharedPreferences.getString(AppStrings.ThemeSharedPreferenceKey)!)!
          :
          AppTheme.light,
          ))  
  {
    on<ThemeEvent>((event, emit) {
      emit(
        ThemeState(
          appThemeData: AppThemes.appThemeData[event.appTheme]!,
          appTheme: event.appTheme)
        );
      
      sharedPreferences.setString(AppStrings.ThemeSharedPreferenceKey, EnumToString.convertToString(event.appTheme));
    });
  }
}