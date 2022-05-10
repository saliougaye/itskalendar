
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:itskalendar/models/course_hours.dart';
import 'package:intl/intl.dart';

class LessonCard extends StatelessWidget {

  final Day morning;
  final Day? afternoon;

  const LessonCard({Key? key, required this.morning, this.afternoon}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    List<Widget> widgets = [_lessonCard(morning)];
    if(afternoon != null) {
      widgets.add(const Divider(
        color: Colors.grey, 
      ));
      widgets.add(const SizedBox(height: 10,));
      widgets.add(_lessonCard(afternoon!));
      
    }


    return Container(
      height: afternoon != null ? 260 : 130,
       padding: const EdgeInsets.all(15),
       decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3)
            )
          ]
       ),
       child: Column(
         children: widgets,
       )
    );
  }

  Widget _lessonCard(Day day) {
    return Column(
      children: [
        _titleCard(_getDateString(day.date)),
        const SizedBox(height: 10,),
        _lesson(day),
        const SizedBox(height: 10,),
      ],
    );
  }


  String _getDateString(DateTime date) {

    if(DateTime.now().difference(date).inDays == 0) {
      return "Oggi";
    }

    if(DateTime.now().difference(date).inDays == 1) {
      return  "Domani";
    }

    final dateFormatter = DateFormat("EEEE d MMMM");



    return dateFormatter.format(date);
  }

  Widget _titleCard(String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const FaIcon(FontAwesomeIcons.calendarDay),
        const SizedBox(width: 10,),
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
                  padding: EdgeInsets.fromLTRB(10, 0, 3, 0),
                  child: Text(
                    day.module,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
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
                    const SizedBox(width: 5,),
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
          SizedBox(height: 10,),
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
                    const SizedBox(width: 5,),
                    Text(
                      day.room,
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