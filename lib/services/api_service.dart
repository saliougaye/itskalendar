import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:itskalendar/constants/strings.dart';
import 'package:itskalendar/models/course_hours.dart';

class ApiService {
  late Dio httpClient;

  ApiService() {
    httpClient =
        Dio(BaseOptions(connectTimeout: 60 * 1000, receiveTimeout: 60 * 1000));
  }

  Future<List<String>> getCourses() async {
    final res = await httpClient.get("${AppStrings.ApiUrl}/courseList");

    final courses = res.data.cast<String>().toList();

    return courses;
  }

  Future<List<CourseHours>> getLessons(
      String course, DateTime startDate) async {
    final dateFormat = DateFormat("yyyy-MM-dd");
    final startDay = dateFormat.format(startDate);

    final res = await httpClient.get(
        "${AppStrings.ApiUrl}/$course?startDay=$startDay");

    if (res.statusCode != 200) {
      throw Exception("Response failed");
    }


    final lessons = (res.data as List).map((e) => CourseHours.fromJson(e)).toList();

    return lessons;
  }
}
