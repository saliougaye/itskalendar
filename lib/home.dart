import 'package:flutter/material.dart';
import 'package:itskalendar/models/course_hours.dart';
import 'package:itskalendar/widgets/card.dart';
import 'package:itskalendar/widgets/select.dart';

class Home extends StatelessWidget {
  final Map<DateTime, List<Day>> grouped;
  const Home({Key? key, required this.grouped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            children: const [
              SizedBox(
                height: 10,
              ),
              Text(
                'ITS\nKALENDAR',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Select(
                items: [
                  "CloD-2",
                  "DevO-2",
                  "DiQu-2",
                  "iUCs-2",
                  "CpeR",
                  "QZer",
                  "CyBe",
                  "AMar"
                ],
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text("Orari per CloD-2",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        (() {
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
}
