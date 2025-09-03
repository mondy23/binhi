import 'package:intl/intl.dart';
final Numberformatter = NumberFormat.compact();

String formatActivityTime(DateTime dateTime) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(const Duration(days: 1));
  final activityDate = DateTime(dateTime.year, dateTime.month, dateTime.day);

  String dayText;
  if (activityDate == today) {
    dayText = "Today";
  } else if (activityDate == yesterday) {
    dayText = "Yesterday";
  } else {
    dayText = DateFormat('d MMM').format(dateTime); // e.g., 2 Sep
  }

  final timeText = DateFormat('h:mm a').format(dateTime); // e.g., 1:30 PM
  return "$dayText, $timeText";
}


class DateUtils {
  /// Returns a tuple with [startOfWeek, endOfWeek] in 'yyyy-MM-dd' format
  static List<String> currentWeekDates() {
    final now = DateTime.now();

    // Get Monday of current week
    final monday = now.subtract(Duration(days: now.weekday - 1));

    // Get Sunday of current week
    final sunday = monday.add(const Duration(days: 6));

    final formatter = DateFormat('yyyy-MM-dd');
    return [formatter.format(monday), formatter.format(sunday)];
  }
}
