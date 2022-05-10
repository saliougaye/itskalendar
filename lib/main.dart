import 'package:flutter/material.dart';
import 'package:itskalendar/models/course_hours.dart';
import 'package:itskalendar/widgets/card.dart';
import 'package:itskalendar/widgets/select.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Select(items: [
                  "CloD-2",
                  "DevO-2",
                  "DiQu-2",
                  "iUCs-2",
                  "CpeR",
                  "QZer",
                  "CyBe",
                  "AMar"
                ]),
                SizedBox(height: 20,),
                LessonCard(
                  morning: Day(
                      id: "1",
                      timeStart: "9.00",
                      timeEnd: "13.00",
                      required: false,
                      module: "PROJECT WORK E AGILE MANAGEMENT - ANNO 2",
                      professor: "GOBBO DANIELE",
                      room: "Ed.S - L10",
                      v: 0,
                      courseName: "DevO-2",
                      date: DateTime.parse("2022-05-11T00:00:00.000Z")),
                  afternoon: Day(
                      id: "1",
                      timeStart: "9.00",
                      timeEnd: "13.00",
                      required: false,
                      module: "PROJECT WORK E AGILE MANAGEMENT - ANNO 2",
                      professor: "GOBBO DANIELE",
                      room: "Ed.S - L10",
                      v: 0,
                      courseName: "DevO-2",
                      date: DateTime.parse("2022-05-15T00:00:00.000Z")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
