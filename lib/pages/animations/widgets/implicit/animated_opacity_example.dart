import 'package:flutter/material.dart';

class AnimatedOpacityExample extends StatefulWidget {
  const AnimatedOpacityExample({super.key});

  @override
  State<AnimatedOpacityExample> createState() => AnimatedOpacityExampleState();
}

class AnimatedOpacityExampleState extends State<AnimatedOpacityExample> {
  bool _isShow = false;

  void _changeOpacity() {
    setState(() => _isShow = !_isShow);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedOpacity(
          curve: Curves.easeIn,
          opacity: _isShow ? 1 : 0,
          duration: const Duration(seconds: 1),
          child: FlutterLogo(size: 100),
        ),

        ElevatedButton(
          onPressed: _changeOpacity,
          child: Text(_isShow ? 'hide' : 'show'),
        ),
      ],
    );
  }
}
