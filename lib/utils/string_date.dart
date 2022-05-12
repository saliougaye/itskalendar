import 'package:intl/intl.dart';

String getDateString(DateTime date) {
    final dateReformat = DateTime(date.year, date.month, date.day);

    final now = DateTime.now();

    final dateDiff =
        DateTime(dateReformat.year, dateReformat.month, dateReformat.day)
            .difference(DateTime(now.year, now.month, now.day));

    if (dateDiff.inDays == 0) {
      return "Today";
    }

    if (dateDiff.inDays == 1) {
      return "Tomorrow";
    }

    final dateFormatter = DateFormat("EEEE d MMMM");

    return dateFormatter.format(dateReformat);
  }