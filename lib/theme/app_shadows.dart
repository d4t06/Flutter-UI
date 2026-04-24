import 'package:flutter/material.dart';

class AppShadows {
  AppShadows._();

  static const sm = [
    BoxShadow(color: Color(0x1A000000), blurRadius: 2, offset: Offset(0, 1)),
  ];

  static const md = [
    BoxShadow(color: Color(0x26000000), blurRadius: 6, offset: Offset(0, 4)),
  ];

  static const lg = [
    BoxShadow(color: Color(0x33000000), blurRadius: 15, offset: Offset(0, 10)),
  ];

  static const xl = [
    BoxShadow(color: Color(0x40000000), blurRadius: 25, offset: Offset(0, 20)),
  ];
}

extension ThemeContext on BuildContext {
  List<BoxShadow> get shadowSm => AppShadows.sm;
  List<BoxShadow> get shadowMd => AppShadows.md;
  List<BoxShadow> get shadowLg => AppShadows.lg;
  List<BoxShadow> get shadowXl => AppShadows.xl;
}
