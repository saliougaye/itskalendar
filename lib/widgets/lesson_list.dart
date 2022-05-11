import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:itskalendar/models/course_hours.dart';
import 'package:itskalendar/utils/add_space.dart';
import 'package:itskalendar/widgets/card.dart';

class LessonList extends StatefulWidget {

  final List<CourseHours> courseWeeks;

  const LessonList({Key? key, required this.courseWeeks}) : super(key: key);

  @override
  State<LessonList> createState() => _LessonListState();
}

class _LessonListState extends State<LessonList> {
  int numberOfWeeksToTake = 1;



  @override
  Widget build(BuildContext context) {

    final nullSafetyLessons = widget.courseWeeks;
    if (nullSafetyLessons.isEmpty) {
      return const Text('No Data');
    }

    final w = widget.courseWeeks.take(numberOfWeeksToTake).toList();

    final List<Day> days = [];

    for (var element in w) {
      days.addAll(element.days);
    }

    final grouped = groupBy(days, (Day d) => d.date);

    final List<Widget> cards = List.empty(growable: true);

    grouped.forEach((d, l) {

      cards.add(Padding(
        padding: const EdgeInsets.all(15),
        child: LessonCard(day: d, lessons: l),
      ));

    });
    return Expanded(
      child: ListView(
        children: [
          ...cards,
          addSpace(20, 0),
          _nextWeekButton(),
          addSpace(30, 0)
        ],
      ),
    );
  }


  Widget _nextWeekButton() {

    if(widget.courseWeeks.length <= 1 || widget.courseWeeks.length == numberOfWeeksToTake+1) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(left: 120, right: 120),
      child: InkWell(
        onTap: () {
          if(numberOfWeeksToTake+1 < widget.courseWeeks.length) {
            setState(() {
              numberOfWeeksToTake += 1;
            });
          }
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor,
            borderRadius: BorderRadius.circular(13.0),
          ),
          child: Text(
            "Next Week",
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ),
    );

  }
}