import 'package:flutter/material.dart';

class AppShadows {
  const AppShadows();

  List<BoxShadow> get sm => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.05),
      blurRadius: 4,
      offset: const Offset(0, 1),
    ),
  ];

  List<BoxShadow> get md => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.08),
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
  ];

  List<BoxShadow> get lg => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.12),
      blurRadius: 16,
      offset: const Offset(0, 8),
    ),
  ];
}

extension AppShadowsContextExt on BuildContext {
  AppShadows get shadow => const AppShadows();
}
