import 'package:binhi/core/theme/binhi_theme.dart';
import 'package:binhi/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: BinhiTheme.lightTheme,
      darkTheme: BinhiTheme.darkTheme,
      themeMode: ThemeMode.light,
      routerConfig: routes,
    );
  }
}
