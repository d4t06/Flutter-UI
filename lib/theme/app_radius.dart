import 'package:flutter/widgets.dart';

class AppRadius {
  const AppRadius();

  // Tailwind-like scale
  Radius get none => Radius.circular(0);
  Radius get xs => Radius.circular(2);
  Radius get sm => Radius.circular(4);
  Radius get md => Radius.circular(6);
  Radius get lg => Radius.circular(8);
  Radius get xl => Radius.circular(12);
  Radius get x2l => Radius.circular(16);
  Radius get x3l => Radius.circular(24);
  Radius get full => Radius.circular(9999);

  // BorderRadius helpers
  BorderRadius all(Radius radius) => BorderRadius.all(radius);

  BorderRadius circular(double value) => BorderRadius.circular(value);

  BorderRadius only({
    Radius topLeft = Radius.zero,
    Radius topRight = Radius.zero,
    Radius bottomLeft = Radius.zero,
    Radius bottomRight = Radius.zero,
  }) {
    return BorderRadius.only(
      topLeft: topLeft,
      topRight: topRight,
      bottomLeft: bottomLeft,
      bottomRight: bottomRight,
    );
  }
}

extension AppRadiusContextExt on BuildContext {
  AppRadius get radius => const AppRadius();
}
