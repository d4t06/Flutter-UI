import 'package:flutter/material.dart';
import 'package:my_app/components/app_sidebar.dart';
import 'package:my_app/components/app_top_bar.dart';
import 'package:my_app/pages/animations/widgets/explicit/animated_builder_example.dart';
import 'package:my_app/pages/animations/widgets/explicit/scale_transition_example.dart';
import 'package:my_app/pages/animations/widgets/implicit/animated_list_example.dart';
import 'package:my_app/pages/animations/widgets/special/hero_animation.dart';
import 'package:my_app/pages/animations/widgets/implicit/animated_container_example.dart';
import 'package:my_app/pages/animations/widgets/implicit/animated_opacity_example.dart';
import 'package:my_app/pages/animations/widgets/implicit/tween_animation_builder_example.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(title: "hehe"),
      drawer: AppSidebar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TweenAnimationBuilderExample(),

            AnimatedOpacityExample(),

            AnimatedContainerExample(),

            HeroAnimation(),

            ScaleTransitionExample(),

            AnimatedBuilderExample(),

            SizedBox(height: 600, child: AnimatedListExample()),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
