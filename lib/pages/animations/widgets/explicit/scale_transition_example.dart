import 'package:flutter/material.dart';

class ScaleTransitionExample extends StatefulWidget {
  const ScaleTransitionExample({super.key});

  @override
  State<ScaleTransitionExample> createState() => _ScaleTransitionExampleState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class _ScaleTransitionExampleState extends State<ScaleTransitionExample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 350),
    vsync: this,
  );

  late final Animation<double> _animation = Tween<double>(
    begin: 0.8,
    end: 1.0,
  ).animate(_controller);
  // ).animate(CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScaleTransition(
          scale: _controller,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: FlutterLogo(size: 150.0),
          ),
        ),

        ElevatedButton(
          child: Text("Toggle"),
          onPressed: () {
            _controller.isCompleted
                ? _controller.reverse()
                : _controller.forward();
          },
        ),
      ],
    );
  }
}
