import 'package:flutter/material.dart';

class TweenAnimationBuilderExample extends StatelessWidget {
  const TweenAnimationBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(seconds: 2),
      curve: Curves.linear,
      builder: (BuildContext context, double val, Widget? child) {
        return Opacity(
          opacity: val,
          child: Container(
            width: 200,
            height: 100,
            color: Colors.blue,
            child: child, // The static child passed below
          ),
        );
      },
      child: const Center(
        child: Text(
          'TweenAnimationBuilder!',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
