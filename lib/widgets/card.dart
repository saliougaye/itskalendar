
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:itskalendar/models/course_hours.dart';
import 'package:intl/intl.dart';
import 'package:itskalendar/utils/add_space.dart';

class LessonCard extends StatelessWidget {

  final DateTime day;
  final List<Day> lessons;

  const LessonCard({Key? key, required this.day, required this.lessons}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final cards = lessons.map((e) => _lessonCard(e)).toList();

    if(cards.length == 2) {
      cards.insert(1, const Divider(
         color: Colors.grey, 
      ));
      cards.insert(2, addSpace(10, 0));
    }


    return Container(
      height: lessons.length == 2 ? 230 : 130,
       padding: const EdgeInsets.all(15),
       decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3)
            )
          ]
       ),
       child: Column(
         children: [_titleCard(_getDateString(day)), ...cards],
       )
    );
  }

  Widget _lessonCard(Day day) {
    return Column(
      children: [
        addSpace(10, 0),
        _lesson(day),
        addSpace(10, 0),
      ],
    );
  }


  String _getDateString(DateTime date) {

    final dateReformat = DateTime(
      date.year,
      date.month,
      date.day
    );

    final now = DateTime.now();

    final dateDiff = DateTime(dateReformat.year, dateReformat.month, dateReformat.day)
      .difference(
        DateTime(now.year, now.month, now.day)
      );

    if(dateDiff.inDays == 0) {
      return "Oggi";
    }

    if(dateDiff.inDays == 1) {
      return  "Domani";
    }

    final dateFormatter = DateFormat("EEEE d MMMM");



    return dateFormatter.format(dateReformat);
  }

  Widget _titleCard(String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const FaIcon(FontAwesomeIcons.calendarDay),
        addSpace(0, 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500
          ),
        )
      ],
    );
  }


  Widget _lesson(Day day) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 0,
                child: FaIcon(
                  FontAwesomeIcons.bookmark,
                  size: 22,
                )
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 3, 0),
                  child: Text(
                    day.module ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Row(
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.clock,
                      size: 15,
                    ),
                    addSpace(0, 5),
                    Text(
                      '${day.timeStart} - ${day.timeEnd}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold
                      ),)
                  ],
                ),
              )
            ],
          ),
          addSpace(10, 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               const Expanded(
                flex: 0,
                child: FaIcon(
                  FontAwesomeIcons.user,
                  size: 22,
                )
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 3, 0),
                  child: Text(
                    day.professor,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Row(
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.locationDot,
                      size: 15,
                    ),
                    addSpace(0, 5),
                    Text(
                      day.room ?? "",
                      style: const TextStyle(
                        
                      ),)
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