import 'package:flutter/material.dart';

class AppTextStyles {
  const AppTextStyles();

  TextStyle get textXs => TextStyle(fontSize: 12, height: 1.333);
  TextStyle get textSm => TextStyle(fontSize: 14, height: 1.428);

  static const textBase = TextStyle(fontSize: 16, height: 1.5); //bodyMedium
  
  TextStyle get textLg => TextStyle(fontSize: 18, height: 1.555);
  TextStyle get textXl => TextStyle(fontSize: 20, height: 1.4);
  TextStyle get text2Xl => TextStyle(fontSize: 24, height: 1.333);
  TextStyle get text3Xl => TextStyle(fontSize: 30, height: 1.2);
  TextStyle get text4Xl => TextStyle(fontSize: 36, height: 1.111);
}

// class TailwindText {
//   const TailwindText();

//   TextStyle get textXs => AppTextStyles.textXs;
//   TextStyle get textSm => AppTextStyles.textSm;
//   TextStyle get textBase => AppTextStyles.textBase;
//   TextStyle get textLg => AppTextStyles.textLg;
//   TextStyle get textXl => AppTextStyles.textXl;
//   TextStyle get text2Xl => AppTextStyles.text2Xl;
//   TextStyle get text3Xl => AppTextStyles.text3Xl;
//   TextStyle get text4Xl => AppTextStyles.text4Xl;
// }

extension TailwindTypography on TextStyle {
  TextStyle get black => copyWith(fontWeight: FontWeight.w800);
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
  TextStyle withColor(Color color) => copyWith(color: color);
}

extension AppTextStylesContextExt on BuildContext {
  // TextStyle get textXs => AppTextStyles.textXs;
  // TextStyle get textSm => AppTextStyles.textSm;
  // TextStyle get textBase => AppTextStyles.textBase;
  // TextStyle get textLg => AppTextStyles.textLg;
  // TextStyle get textXl => AppTextStyles.textXl;
  // TextStyle get text2xl => AppTextStyles.text2Xl;
  // TextStyle get text3xl => AppTextStyles.text3Xl;
  // TextStyle get text4xl => AppTextStyles.text4Xl;

  AppTextStyles get text => const AppTextStyles();
}
