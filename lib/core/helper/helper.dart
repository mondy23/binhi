import 'dart:ui';

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

  String getRank(int points) {
    if (points >= 1000) return "Platinum";
    if (points >= 750) return "Gold";
    if (points >= 500) return "Silver";
    return "Bronze";
  }

 Color getRankColor(String rank) {
  switch (rank) {
    case "Platinum":
      return const Color(0xFF6A5ACD); // soft royal purple
    case "Gold":
      return const Color(0xFFFFC107); // warm gold
    case "Silver":
      return const Color(0xFF9E9E9E); // sleek silver gray
    case "Bronze":
    default:
      return const Color(0xFFCD7F32); // bronze copper
  }
}


  double getProgress(int points) {
    const maxPoints = 1000; // adjustable threshold
    return (points / maxPoints).clamp(0, 1).toDouble();
  }
