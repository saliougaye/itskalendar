part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}



class HomeLoading extends HomeState {}


class HomeLoaded extends HomeState {
  final String? course;
  final List<CourseHours> courseHours;
  final List<String> courses;

  const HomeLoaded({ this.course, required this.courseHours, required this.courses });

  @override
  List<Object> get props => [courseHours, courses];
}


class HomeLoadingFailed extends HomeState {
  final String message;

  const HomeLoadingFailed({ required this.message });

  @override
  List<Object> get props => [message];
}