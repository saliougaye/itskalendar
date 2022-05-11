import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:itskalendar/constants/strings.dart';
import 'package:itskalendar/models/course_hours.dart';
import 'package:itskalendar/services/api_service.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final ApiService apiService;
  final SharedPreferences sharedPreferences;

  HomeBloc({ required this.apiService, required this.sharedPreferences }) : super(HomeLoading()) {
    on<AppLoaded>(_onAppLoaded);
    on<CourseChanged>(_onCourseChanged);
  }

  FutureOr<void> _onAppLoaded(AppLoaded event, Emitter<HomeState> emit)  async {

    try {

      final courses = await apiService.getCourses();

      List<CourseHours> courseHours = List.empty(growable: true);
      final course = event.initialCourse ?? sharedPreferences.getString(AppStrings.CourseSharedPreferenceKey);



      if(course != null) {
        courseHours = await apiService.getLessons(course, _getFirstDayOfTheWeek());
        sharedPreferences.setString(AppStrings.CourseSharedPreferenceKey, course);
      }


      emit(
        HomeLoaded(
          course: course,
          courseHours: courseHours, 
          courses: courses
        )
      );

    } catch (e) {
      emit(
        const HomeLoadingFailed(message: 'Failed to laod')
      );
    }

  }

  DateTime _getFirstDayOfTheWeek() {
    final now = DateTime.now();

    return now.subtract(Duration(days: now.weekday -1 ));
  }

  FutureOr<void> _onCourseChanged(CourseChanged event, Emitter<HomeState> emit) async {

    // TODO fix widget when loading
    // emit(
    //   HomeLoading()
    // );


    try {
      final courses = await apiService.getCourses();

      final course = event.course;

      final courseHours = await apiService.getLessons(course, _getFirstDayOfTheWeek());


      emit(
        HomeLoaded(
          course: course,
          courseHours: courseHours, 
          courses: courses
        )
      );

      sharedPreferences.setString(AppStrings.CourseSharedPreferenceKey, course);

    } catch (e) {
      emit(
        const HomeLoadingFailed(message: 'Failed to laod')
      );
    }
  }
}
