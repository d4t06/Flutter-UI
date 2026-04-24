import 'dart:math' as math;

import 'package:flutter/material.dart';

class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({super.key});

  @override
  State<AnimatedBuilderExample> createState() => _AnimatedBuilderExampleState();
}

/// AnimationControllers can be created with `vsync: this` because of
/// TickerProviderStateMixin.
class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  );

  late final Animation<double> _scale = Tween<double>(
    begin: 1,
    end: 0.5,
  ).animate(_controller);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller.stop();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: InkWell(
        onTap: () {
          if (_controller.isAnimating) {
            _controller.reset();
          } else {
            _controller.repeat(reverse: true);
          }
        },
        child: Container(
          width: 200.0,
          height: 200.0,
          color: Colors.blue,
          child: const Center(child: Text('sdfsd!')),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _controller.value * 2 * math.pi,
          child: Transform.scale(scale: _scale.value, child: child),
        );
      },
    );
  }
}
