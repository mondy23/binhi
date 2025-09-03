class CustomerResponse {
  final List<Customer> data;
  final int limit;
  final int page;
  final bool success;
  final int total;
  final int totalPages;

  CustomerResponse({
    required this.data,
    required this.limit,
    required this.page,
    required this.success,
    required this.total,
    required this.totalPages,
  });

  factory CustomerResponse.fromJson(Map<String, dynamic> json) {
    return CustomerResponse(
      data: (json['data'] as List)
          .map((e) => Customer.fromJson(e))
          .toList(),
      limit: json['limit'],
      page: json['page'],
      success: json['success'],
      total: json['total'],
      totalPages: json['total_pages'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'limit': limit,
      'page': page,
      'success': success,
      'total': total,
      'total_pages': totalPages,
    };
  }
}

class Customer {
  final String accountIdentifier;
  final int primaryBusinessId;
  final int totalPoints;
  final DateTime updatedAt;
  final DateTime createdAt;

  Customer({
    required this.accountIdentifier,
    required this.primaryBusinessId,
    required this.totalPoints,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      accountIdentifier: json['account_identifier'],
      primaryBusinessId: json['primary_business_id'],
      totalPoints: json['total_points'],
      updatedAt: DateTime.parse(json['updated_at']),
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'account_identifier': accountIdentifier,
      'primary_business_id': primaryBusinessId,
      'total_points': totalPoints,
      'updated_at': updatedAt.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
    };
  }
}
