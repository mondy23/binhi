class ActivityResponse {
  final List<Activity> data;

  ActivityResponse({required this.data});

  factory ActivityResponse.fromJson(Map<String, dynamic> json) {
    final items = json['data'] as List<dynamic>;
    return ActivityResponse(
      data: items.map((e) => Activity.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class Activity {
  final String referenceID;
  final String activityType;
  final int points;
  final DateTime activityTime;
  final String businessID;
  final String businessName;
  final String rewardAccountID;

  Activity({
    required this.referenceID,
    required this.activityType,
    required this.points,
    required this.activityTime,
    required this.businessID,
    required this.businessName,
    required this.rewardAccountID,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      referenceID: json['ReferenceID'] as String,
      activityType: json['ActivityType'] as String,
      points: json['Points'] as int,
      activityTime: DateTime.parse(json['ActivityTime'] as String),
      businessID: json['BusinessID'] as String,
      businessName: json['BusinessName'] as String,
      rewardAccountID: json['RewardAccountID'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ReferenceID': referenceID,
      'ActivityType': activityType,
      'Points': points,
      'ActivityTime': activityTime.toIso8601String(),
      'BusinessID': businessID,
      'BusinessName': businessName,
      'RewardAccountID': rewardAccountID,
    };
  }
}
