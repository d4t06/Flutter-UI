import 'package:flutter/material.dart';

class AppSpacing {
  const AppSpacing();

  double get s1 => 4;
  double get s2 => 8;
  double get s3 => 12;
  double get s4 => 16;
  double get s5 => 20;
  double get s6 => 24;
  double get s8 => 32;

  double get xs => s1;
  double get sm => s2;
  double get md => s4;
  double get lg => s6;
  double get xl => s8;
}

extension AppSpacingContextExt on BuildContext {
  AppSpacing get spacing => const AppSpacing();
}
