
import 'package:binhi/core/layout/layout.dart';
import 'package:binhi/features/admin/screens/admin_screen.dart';
import 'package:binhi/features/customer/screens/customer_screen.dart';
import 'package:binhi/features/dashboard/screens/dashboard_layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter routes = GoRouter(
  routes: [
    ShellRoute(
      pageBuilder: (context, state, child) =>
          MaterialPage(child: Layout(child: child)),
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => _fadeTransitionPage(
            key: state.pageKey,
            child: const DashboardLayout(),
          ),
        ),
        GoRoute(
          path: '/customers',
          pageBuilder: (context, state) {
            return _fadeTransitionPage(
              key: state.pageKey,
              child: CustomerScreen(),
            );
          },
        ),
          GoRoute(
          path: '/reports',
          pageBuilder: (context, state) {
            return _fadeTransitionPage(
              key: state.pageKey,
              child: CustomerScreen(),
            );
          },
        ),
          GoRoute(
          path: '/merchants',
          pageBuilder: (context, state) {
            return _fadeTransitionPage(
              key: state.pageKey,
              child: MerchantScreen(),
            );
          },
        ),
      ],
    ),
  ],
);

/// Reusable fade transition page
CustomTransitionPage _fadeTransitionPage({
  required LocalKey key,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: key,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
