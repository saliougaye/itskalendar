part of 'home_bloc.dart';


abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class AppLoaded extends HomeEvent {

  final String? initialCourse;

  const AppLoaded({ this.initialCourse });

  @override
  List<Object> get props => [];
}

class CourseChanged extends HomeEvent {
  final String course;

  const CourseChanged({ required this.course });

  @override
  List<Object> get props => [course];
}
