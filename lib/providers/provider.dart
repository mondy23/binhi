import 'package:binhi/models/navbar_items.dart';
import 'package:binhi/services/dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioClientProvider = Provider<DioClient>((ref) => DioClient());

final navbarItemsProvider = FutureProvider<List<NavbarItem>>((ref) async {
  final dio = ref.watch(dioClientProvider);

  final response = await dio.get("/draweItems");
  final List<dynamic> data = response.data;

  return data.map((e) => NavbarItem.fromJson(e)).toList();
});

final isNavBarOpenProvider = StateProvider<bool>((ref) => true);
