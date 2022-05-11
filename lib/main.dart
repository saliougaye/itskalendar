import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itskalendar/blocs/home/home_bloc.dart';
import 'package:itskalendar/blocs/theme/theme_bloc.dart';
import 'package:itskalendar/home.dart';
import 'package:itskalendar/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final shared = await SharedPreferences.getInstance();

  runApp(MyApp(
    apiService: ApiService(),
    sharedPreferences: shared,
  ));
}

class MyApp extends StatelessWidget {
  final ApiService apiService;
  final SharedPreferences sharedPreferences;

  const MyApp({Key? key, required this.apiService, required this.sharedPreferences}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                HomeBloc(apiService: apiService, sharedPreferences: sharedPreferences)..add(const AppLoaded())),
        BlocProvider(create: (context) => ThemeBloc(sharedPreferences: sharedPreferences))
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'ITS Kalendar',
            theme: state.appThemeData,
            home: const SafeArea(
              child: Home(),
            ),
          );
        },
      ),
    );
  }
}
