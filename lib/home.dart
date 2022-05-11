import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itskalendar/blocs/home/home_bloc.dart';
import 'package:itskalendar/models/course_hours.dart';
import 'package:itskalendar/utils/add_space.dart';
import 'package:itskalendar/widgets/card.dart';
import 'package:itskalendar/widgets/select.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is HomeLoadingFailed) {
          return Center(
            child: Text(state.message),
          );
        }

        final loadedState = state as HomeLoaded;

        Map<DateTime, List<Day>>? grouped;

        if(loadedState.courseHours.isNotEmpty) {
          grouped = groupBy(loadedState.courseHours.first.days,
            (Day d) => d.date); // TODO change with button with weeks
        }

        if(loadedState.courseHours.isEmpty && loadedState.course != null) {
          grouped = {};
        }
        



        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Column(
                children: [
                  addSpace(10, 0),
                  const Text(
                    'ITS\nKALENDAR',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  addSpace(10, 0),
                  Select(
                    items: loadedState.courses,
                    onChange: (value) {
                      if(value != null) {
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
              if (state.course != null) {
                return Text(state.course!,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500));
              }

              return SizedBox.shrink();
            }()),
            (() {

              if(grouped == null) {
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
                      day: grouped!.keys.elementAt(index),
                      lessons: grouped[grouped.keys.elementAt(index)] ?? [],
                    ),
                  ),
                ),
              );
            }()),
          ],
        );
      },
    );
  }
}
