class BusinessSummary {
  final int businessId;
  final int totalReleased;
  final int totalRedeemed;
  final int totalUsers;

  BusinessSummary({
    required this.businessId,
    required this.totalReleased,
    required this.totalRedeemed,
    required this.totalUsers,
  });

  factory BusinessSummary.fromJson(Map<String, dynamic> json) {
    return BusinessSummary(
      businessId: json['business_id'] as int,
      totalReleased: json['total_released'] as int,
      totalRedeemed: json['total_redeemed'] as int,
      totalUsers: json['total_users'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'business_id': businessId,
      'total_released': totalReleased,
      'total_redeemed': totalRedeemed,
      'total_users': totalUsers,
    };
  }
}
