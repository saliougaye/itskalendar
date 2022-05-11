import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:itskalendar/blocs/theme/theme_bloc.dart';
import 'package:itskalendar/constants/theme.dart';
import 'package:itskalendar/utils/add_space.dart';
import 'package:itskalendar/widgets/select.dart';

class Header extends StatelessWidget {
  final List<String> courses;
  final String? courseSelected;
  final void Function(String?) onSelectChange;


  const Header({Key? key, required this.courses, required this.courseSelected, required this.onSelectChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {




    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Theme.of(context).secondaryHeaderColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BlocBuilder<ThemeBloc, ThemeState>(
                    builder: (context, state) {
                      final isDark = state.appTheme == AppTheme.dark;
                      return CircleAvatar(
                        radius: 25,
                        backgroundColor: Theme.of(context).backgroundColor,
                        child: IconButton(
                          onPressed: () {
                            context
                              .read<ThemeBloc>()
                              .add(
                                ThemeEvent(
                                  appTheme: isDark ? AppTheme.light : AppTheme.dark 
                                )
                              );
                          },
                          icon: FaIcon(
                            isDark ? Icons.nightlight_rounded : Icons.wb_sunny,
                            color: Theme.of(context).iconTheme.color
                          ),
                        ),
                      );
                    },
                  )
                ]
              ),
              addSpace(5, 0),
               Text(
                'ITS\nKALENDAR',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              addSpace(10, 0),
              Select(
                items: courses,
                value: courseSelected,
                onChange: onSelectChange,
              ),
              addSpace(15, 0),
            ],
          ),
        );
      },
    );
  }
}
