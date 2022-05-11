import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:itskalendar/constants/strings.dart';
import 'package:itskalendar/models/course_hours.dart';

class ApiService {

  late Dio httpClient;
  
  ApiService() {
    httpClient = Dio();
  }



  Future<List<String>> getCourses() async{

   final res = await httpClient.get<List<String>>("${AppStrings.ApiUrl}/courseList"); 
    
    return res.data ?? [];
  }


  Future<List<CourseHours>> getLessons(String course, DateTime startDate) async {

    final dateFormat = DateFormat("yyyy-MM-dd");
    final startDay = dateFormat.format(startDate);


    final res = await httpClient.get<List<CourseHours>>("${AppStrings.ApiUrl}/$course?startDay=$startDay");

    if(res.statusCode != 200) {
      throw Exception("Response failed");
    }



    return res.data ?? [];
  }
}