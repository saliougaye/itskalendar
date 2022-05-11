import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:itskalendar/models/course_hours.dart';
import 'package:intl/intl.dart';
import 'package:itskalendar/utils/add_space.dart';

class LessonCard extends StatelessWidget {
  final DateTime day;
  final List<Day> lessons;

  const LessonCard({Key? key, required this.day, required this.lessons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

      final cards = lessons.map((e) => _lessonCard(context, e)).toList();

      if (cards.length == 2) {
        cards.insert(
            1,
            const Divider(
              color: Colors.grey,
            ));
        cards.insert(2, addSpace(10, 0));
      }
      return Container(
          height: lessons.length == 2 ? 230 : 130,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).shadowColor,
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3))
              ]),
          child: Column(
            children: [_titleCard(context,_getDateString(day)), ...cards],
          ));
  }

  Widget _lessonCard(BuildContext context, Day day) {
    return Column(
      children: [
        addSpace(10, 0),
        _lesson(context, day),
        addSpace(10, 0),
      ],
    );
  }

  String _getDateString(DateTime date) {
    final dateReformat = DateTime(date.year, date.month, date.day);

    final now = DateTime.now();

    final dateDiff =
        DateTime(dateReformat.year, dateReformat.month, dateReformat.day)
            .difference(DateTime(now.year, now.month, now.day));

    if (dateDiff.inDays == 0) {
      return "Oggi";
    }

    if (dateDiff.inDays == 1) {
      return "Domani";
    }

    final dateFormatter = DateFormat("EEEE d MMMM");

    return dateFormatter.format(dateReformat);
  }

  Widget _titleCard(BuildContext context, String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FaIcon(
          FontAwesomeIcons.calendarDay,
          color: Theme.of(context).iconTheme.color,
        ),
        addSpace(0, 10),
        Text(
          title,
          style: Theme.of(context).textTheme.headline3
        )
      ],
    );
  }

  Widget _lesson(BuildContext context, Day day) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 0,
                  child: FaIcon(
                    FontAwesomeIcons.bookmark,
                    size: 22,
                    color: Theme.of(context).iconTheme.color,
                  )),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 3, 0),
                  child: Text(
                    day.module ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.clock,
                      size: 15,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    addSpace(0, 5),
                    Text(
                      '${day.timeStart} - ${day.timeEnd}',
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  ],
                ),
              )
            ],
          ),
          addSpace(10, 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 0,
                  child: FaIcon(
                    FontAwesomeIcons.user,
                    size: 22,
                    color: Theme.of(context).iconTheme.color,
                  )),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 3, 0),
                  child: Text(
                    day.professor,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.locationDot,
                      size: 15,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    addSpace(0, 5),
                    Text(
                      day.room ?? "",
                      style: Theme.of(context).textTheme.bodyText2,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
