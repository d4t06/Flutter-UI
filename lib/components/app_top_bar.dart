import 'package:flutter/material.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar({required this.title, this.actions, super.key});

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
      actions: actions,
      // bottom: PreferredSize(
      //   preferredSize: const Size.fromHeight(2),
      //   child: Container(height: 2, color: Theme.of(context).colorScheme.secondary),
      // ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 2);
}
