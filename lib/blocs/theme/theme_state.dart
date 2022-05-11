part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  
  final ThemeData appThemeData;
  final AppTheme appTheme;
  
  const ThemeState({ required this.appThemeData, required this.appTheme });
  
  @override
  List<Object> get props => [appThemeData, appTheme];
}
