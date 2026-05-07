import 'package:flutter/material.dart';
import 'package:my_app/theme/theme.dart';

class DotIndicator extends StatelessWidget {
  final int count;
  final double size;

  final int current;
  final Color color;
  final Color activeColor;

  const DotIndicator({
    super.key,
    required this.count,
    required this.current,
    required this.size,
    this.color = Colors.grey,
    this.activeColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Row(
      spacing: context.spacing.md,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == current;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: isActive ? size * 2 : size,
          height: size,
          decoration: BoxDecoration(
            color: isActive ? activeColor : color,
            shape: BoxShape.rectangle,
            borderRadius: context.radius.all(context.radius.full),
          ),
        );
      }),
    );
  }
}
