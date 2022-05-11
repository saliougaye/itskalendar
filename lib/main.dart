import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:itskalendar/home.dart';
import 'package:itskalendar/models/course_hours.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final List<Day> days = [
    Day(
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
    Day(
        id: "2",
        timeStart: "14.00",
        timeEnd: "18.00",
        required: false,
        module: "PROJECT WORK E AGILE MANAGEMENT - ANNO 2",
        professor: "GOBBO DANIELE",
        room: "Ed.S - L10",
        v: 0,
        courseName: "DevO-2",
        date: DateTime.parse("2022-05-13T00:00:00.000Z")),
    Day(
        id: "3",
        timeStart: "9.00",
        timeEnd: "13.00",
        required: false,
        module: "PROJECT WORK E AGILE MANAGEMENT - ANNO 2",
        professor: "GOBBO DANIELE",
        room: "Ed.S - L10",
        v: 0,
        courseName: "DevO-2",
        date: DateTime.parse("2022-05-13T00:00:00.000Z")),
    Day(
        id: "4",
        timeStart: "9.00",
        timeEnd: "13.00",
        required: false,
        module: "PROJECT WORK E AGILE MANAGEMENT - ANNO 2",
        professor: "GOBBO DANIELE",
        room: "Ed.S - L10",
        v: 0,
        courseName: "DevO-2",
        date: DateTime.parse("2022-05-14T00:00:00.000Z"))
  ];

  @override
  Widget build(BuildContext context) {
    final grouped = groupBy(days, (Day d) => d.date);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: Scaffold(
          body: Home(grouped: grouped),
        ),
      ),
    );
  }
}
