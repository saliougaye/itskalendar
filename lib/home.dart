import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itskalendar/blocs/home/home_bloc.dart';
import 'package:itskalendar/models/course_hours.dart';
import 'package:itskalendar/utils/add_space.dart';
import 'package:itskalendar/widgets/header.dart';
import 'package:itskalendar/widgets/lesson_list.dart';
import 'package:itskalendar/widgets/loading.dart';
import 'package:itskalendar/widgets/widget_either.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        Widget widgetToSee = Container();
        String? initialCourse;
        if (state is HomeLoading) {
          widgetToSee = const Loading();
        }

        if (state is HomeLoadingFailed) {
          widgetToSee = _failedLoadingWidget(context, state);
        }

        if (state is HomeLoaded) {
          widgetToSee = _bodyWidget(context, state.courses, state.course, state.courseHours);
          initialCourse = state.course;
        }

        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: widgetToSee,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Refreshing...'),
                  behavior: SnackBarBehavior.floating,
                  width: 110,
                  duration: const Duration(seconds: 1),
                  backgroundColor: Theme.of(context).secondaryHeaderColor,
                  
                )
              );
              context.read<HomeBloc>()
                .add(AppLoaded(initialCourse: initialCourse ));
            },
            child: const Icon(Icons.refresh),
            backgroundColor: Theme.of(context).secondaryHeaderColor,
          ),
        );
      },
    );
  }

  Widget _bodyWidget(
    BuildContext context, 
    List<String> courses,
    String? courseSelected,
    List<CourseHours> courseWeeks
  ) {
    return Column(
      children: [
        Header(
          courses: courses, 
          courseSelected: courseSelected, 
          onSelectChange: (value) {
            if (value != null) {
              context.read<HomeBloc>().add(CourseChanged(course: value));
            }
          }
        ),
        addSpace(20, 0),
        textWidgetEither(context, courseSelected),
        addSpace(10, 0),
        LessonList(courseWeeks: courseWeeks),
      ],
    );
  }

  Widget _failedLoadingWidget(BuildContext context,HomeLoadingFailed state) {
    return Center(
      child: Text(
        "${state.message} 😣",
        style: Theme.of(context).textTheme.headline2,
        textAlign: TextAlign.center,
      ),
    );
  }
}
