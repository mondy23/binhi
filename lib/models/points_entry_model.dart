class PointsEntry {
  final DateTime date;
  final int points;

  PointsEntry({
    required this.date,
    required this.points,
  });

  factory PointsEntry.fromJson(Map<String, dynamic> json) {
    return PointsEntry(
      date: DateTime.parse(json['Date'] as String),
      points: json['Points'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Date': date.toIso8601String(),
      'Points': points,
    };
  }
}
