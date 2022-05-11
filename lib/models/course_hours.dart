class CourseHours {

  final int id;
  final List<Day> days;

  CourseHours({
    required this.id,
    required this.days,
  });


  factory CourseHours.fromJson(Map<String, dynamic> json) => CourseHours(
        id: json["_id"],
        days: List<Day>.from(json["days"].map((x) => Day.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "days": List<dynamic>.from(days.map((x) => x.toJson())),
      };
}

class Day {

  final String id;
  final String courseName;
  final String timeStart;
  final String timeEnd;
  final DateTime date;
  final bool required;
  final String? module;
  final String professor;
  final String? room;
  final int v;

  
  Day({
    required this.id,
    required this.courseName,
    required this.timeStart,
    required this.timeEnd,
    required this.date,
    required this.required,
    required this.module,
    required this.professor,
    required this.room,
    required this.v,
  });


  factory Day.fromJson(Map<String, dynamic> json) => Day(
        id: json["_id"],
        courseName: json["courseName"],
        timeStart: json["timeStart"],
        timeEnd: json["timeEnd"],
        date: DateTime.parse(json["date"]),
        required: json["required"],
        module: json["module"],
        professor: json["professor"],
        room: json["room"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "courseName": courseName,
        "timeStart": timeStart,
        "timeEnd": timeEnd,
        "date": date.toIso8601String(),
        "required": required,
        "module": module,
        "professor": professor,
        "room": room,
        "__v": v,
      };
}
