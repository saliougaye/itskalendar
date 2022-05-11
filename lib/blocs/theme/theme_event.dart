part of 'theme_bloc.dart';

class ThemeEvent extends Equatable {
  
  final AppTheme appTheme;
  
  const ThemeEvent({ required this.appTheme });

  @override
  List<Object> get props => [appTheme];
}
