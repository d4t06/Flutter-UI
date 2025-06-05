import 'package:flutter/material.dart';
import 'package:my_app/pages/choose-location.dart';
import 'package:my_app/pages/dialog/DialogPage.dart';
import 'package:my_app/pages/home.dart';

import 'package:my_app/pages/tabbar/TabBarPage.dart';
import 'package:my_app/pages/todo-list/Todo.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (ct) => Home(),
        '/todo': (ct) => TodoPage(),
        '/dialog': (ct) => DialogPage(),
        '/tab-bar': (ct) => TabBarPage(),
        '/choose-location': (ct) => ChooseLocation(),
      },
    ),
  );
}
