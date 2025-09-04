import 'package:binhi/core/helper/helper.dart';
import 'package:binhi/models/business_summary_model.dart';
import 'package:binhi/models/customer_table_model.dart';
import 'package:binhi/models/navbar_items.dart';
import 'package:binhi/models/points_entry_model.dart';
import 'package:binhi/models/recent_activity.dart';
import 'package:binhi/services/dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioClientProvider = Provider<DioClient>((ref) => DioClient());

final CurrentScreenPage = StateProvider<String>((ref) => 'Dashboard');


final isNavBarOpenProvider = StateProvider<bool>((ref) => true);
final navbarItemsProvider = FutureProvider<List<NavbarItem>>((ref) async {
  final dio = ref.watch(dioClientProvider);
  final response = await dio.get("/api/private/v1/menu");
  final List<dynamic> data = response.data;
  return data.map((e) => NavbarItem.fromJson(e)).toList();
});

// Dashboard UI
final businessSummaryProvider = FutureProvider<BusinessSummary>((ref) async {
  final dio = ref.watch(dioClientProvider);
  final response = await dio.get('/api/private/v1/businesses/1/summary');
  final data = response.data as Map<String, dynamic>;
  return BusinessSummary.fromJson(data);
});

final recentActivityProvider = FutureProvider<ActivityResponse>((ref) async {
  final dio = ref.watch(dioClientProvider);
  final response = await dio.get(
    '/api/private/v1/admin/recent-activity?business_id=1&limit=10',
  );
  final data = response.data as Map<String, dynamic>;
  return ActivityResponse.fromJson(data);
});

final redeemChartProvider = FutureProvider<List<PointsEntry>>((ref) async {
  final dio = ref.watch(dioClientProvider);
  final dates = DateUtils.currentWeekDates();
  final startDate = dates[0];
  final endDate = dates[1];

  final response = await dio.get(
    '/api/private/v1/linechart/redeemed',
    queryParams: {
      'start_date': startDate,
      'end_date': endDate,
      'business_id': 1,
    },
  );

  final data = response.data as List<dynamic>;
  return data
      .map((e) => PointsEntry.fromJson(e as Map<String, dynamic>))
      .toList();
});

final releaseChartProvider = FutureProvider<List<PointsEntry>>((ref) async {
  final dio = ref.watch(dioClientProvider);
  final dates = DateUtils.currentWeekDates();
  final startDate = dates[0];
  final endDate = dates[1];

  final response = await dio.get(
    '/api/private/v1/linechart/released',
    queryParams: {
      'start_date': startDate,
      'end_date': endDate,
      'business_id': 1,
    },
  );

  final data = response.data as List<dynamic>;
  return data
      .map((e) => PointsEntry.fromJson(e as Map<String, dynamic>))
      .toList();
});

final customerChartProvider = FutureProvider<List<PointsEntry>>((ref) async {
  final dio = ref.watch(dioClientProvider);

  // Get the current year
  final now = DateTime.now();
  final startDate = DateTime(now.year, 1, 1); // Jan 1
  final endDate = DateTime(now.year, 12, 31); // Dec 31

  final response = await dio.get(
    '/api/private/v1/linechart/customer',
    queryParams: {
      'start_date': startDate
          .toIso8601String()
          .split('T')
          .first, // 'YYYY-MM-DD'
      'end_date': endDate.toIso8601String().split('T').first,
      'business_id': 1,
    },
  );

  final data = response.data as List<dynamic>;
  return data
      .map((e) => PointsEntry.fromJson(e as Map<String, dynamic>))
      .toList();
});

// Customer UI

final customerLineChartProvider = FutureProvider<List<PointsEntry>>((ref) async {
  final dio = ref.watch(dioClientProvider);

  // Get the current year
  final now = DateTime.now();
  final startDate = DateTime(now.year, 1, 1); // Jan 1
  final endDate = DateTime(now.year, 12, 31); // Dec 31

  final response = await dio.get(
    '/api/private/v1/linechart/customer',
    queryParams: {
      'start_date': startDate
          .toIso8601String()
          .split('T')
          .first, // 'YYYY-MM-DD'
      'end_date': endDate.toIso8601String().split('T').first,
      'business_id': 1,
    },
  );

  final data = response.data as List<dynamic>;
  return data
      .map((e) => PointsEntry.fromJson(e as Map<String, dynamic>))
      .toList();
});

final customerCurrentPage = StateProvider<int>((ref) => 1);

final customerProvider = FutureProvider.family<CustomerResponse, int>((ref, page) async {
  final dio = ref.watch(dioClientProvider);

  final response = await dio.get(
    '/api/private/v1/search/businesses/1/users',
    queryParams: {
      'q': '',
      'page': page,      // use the page parameter
      'limit': 5,        // keep limit configurable if needed
    },
  );

  return CustomerResponse.fromJson(response.data as Map<String, dynamic>);
});
