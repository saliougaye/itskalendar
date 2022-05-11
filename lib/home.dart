import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:itskalendar/blocs/home/home_bloc.dart';
import 'package:itskalendar/blocs/theme/theme_bloc.dart';
import 'package:itskalendar/constants/theme.dart';
import 'package:itskalendar/models/course_hours.dart';
import 'package:itskalendar/utils/add_space.dart';
import 'package:itskalendar/widgets/card.dart';
import 'package:itskalendar/widgets/select.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  // TODO when change course loading only the list
  // TODO refactor
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        Widget widgetToSee = Container();
        String? initialCourse;
        if (state is HomeLoading) {
          widgetToSee = _loadingWidget();
        }

        if (state is HomeLoadingFailed) {
          widgetToSee = _failedLoadingWidget(state);
        }

        if (state is HomeLoaded) {
          Map<DateTime, List<Day>>? grouped;

          if (state.courseHours.isNotEmpty) {
            grouped = groupBy(state.courseHours.first.days,
                (Day d) => d.date); // TODO change with button with next weeks
          }

          if (state.courseHours.isEmpty && state.course != null) {
            grouped = {};
          }

          widgetToSee = _bodyWidget(context, state.courses, state.course, grouped);
          initialCourse = state.course;
        }

        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: widgetToSee,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Refreshing...'),
                  behavior: SnackBarBehavior.floating,
                  width: 110,
                  duration: const Duration(seconds: 1),
                  backgroundColor: Theme.of(context).secondaryHeaderColor,
                  
                )
              );
              context.read<HomeBloc>()
                .add(AppLoaded(initialCourse: initialCourse ));
              // ScaffoldMessenger.of(context).clearSnackBars();
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
    Map<DateTime, List<Day>>? grouped
  ) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Theme.of(context).secondaryHeaderColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BlocBuilder<ThemeBloc, ThemeState>(
                    builder: (context, state) {
                      final isDark = state.appTheme == AppTheme.dark;
                      return CircleAvatar(
                        radius: 25,
                        backgroundColor: Theme.of(context).backgroundColor,
                        child: IconButton(
                          onPressed: () {
                            context
                              .read<ThemeBloc>()
                              .add(
                                ThemeEvent(
                                  appTheme: isDark ? AppTheme.light : AppTheme.dark 
                                )
                              );
                          },
                          icon: FaIcon(
                            isDark ? Icons.nightlight_rounded : Icons.wb_sunny,
                            color: Theme.of(context).iconTheme.color
                          ),
                        ),
                      );
                    },
                  )
                ]
              ),
              addSpace(10, 0),
               Text(
                'ITS\nKALENDAR',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              addSpace(10, 0),
              Select(
                items: courses,
                value: courseSelected,
                onChange: (value) {
                  if (value != null) {
                    context.read<HomeBloc>().add(CourseChanged(course: value));
                  }
                },
              ),
              addSpace(15, 0),
            ],
          ),
        ),
        addSpace(20, 0),
        (() {
          if (courseSelected != null) {
            return Text(
              courseSelected,
              style: Theme.of(context).textTheme.headline2
            );
          }

          return const SizedBox.shrink();
        }()),
        (() {
          if (grouped == null) {
            return addSpace(0, 0);
          }

          if (grouped.isEmpty) {
            return const Text('No Data');
          }

          return Expanded(
            child: ListView.builder(
              itemCount: grouped.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(15),
                child: LessonCard(
                  day: grouped.keys.elementAt(index),
                  lessons: grouped[grouped.keys.elementAt(index)] ?? [],
                ),
              ),
            ),
          );
        }()),
      ],
    );
  }

  Center _failedLoadingWidget(HomeLoadingFailed state) {
    return Center(
      child: Text(state.message), // TODO fix error page
    );
  }

  Center _loadingWidget() {
    return const Center(
      child: CircularProgressIndicator(), // TODO fix loading
    );
  }
}
