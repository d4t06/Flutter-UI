import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/pages/animations/animation_page.dart';
// import 'package:my_app/pages/choose-location.dart';
// import 'package:my_app/pages/dialog/DialogPage.dart';
import 'package:my_app/pages/form/form_page.dart';
import 'package:my_app/pages/home.dart';
import 'package:my_app/pages/layout/layout_page.dart';
import 'package:my_app/pages/provider/provider_page.dart';
import 'package:my_app/pages/riverpod/async_riverpod_page.dart';
import 'package:my_app/pages/riverpod/riverpod_page.dart';
import 'package:my_app/pages/sheet/sheet_page.dart';
import 'package:my_app/pages/snack_bar/snack_bar_page.dart';

// import 'package:my_app/pages/tabbar/TabBarPage.dart';
import 'package:my_app/theme/app_theme.dart';

class RouteItem {
  final String title;
  final String path;
  final WidgetBuilder builder;

  RouteItem({required this.title, required this.path, required this.builder});
}

// dart format off
List<RouteItem> routes = [
  RouteItem(title: 'Home',path: "/", builder: (ct) => Home()),
  RouteItem(title: 'Provider',path: "/todo", builder: (ct) => ProviderPage()),
  RouteItem(title: 'Riverpod',path: "/riverpod", builder: (ct) => RiverpodPage()),
  RouteItem(title: 'Asyn Riverpod',path: "/async-verpod", builder: (ct) => AsyncRiverpodPage()),
  RouteItem(title: 'Animation',path: "/animation", builder: (ct) => AnimationPage()),
  RouteItem(title: 'Layout',path: "/layout", builder: (ct) => LayoutPage()),
  RouteItem(title: 'Form',path: "/form", builder: (ct) => FormPage()),
  RouteItem(title: 'Sheet',path: "/sheet", builder: (ct) => SheetPage()),
  RouteItem(title: 'Snack bar',path: "/snack-bar", builder: (ct) => SnackBarPage()),
];


void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        initialRoute: '/',
        routes: {for (var item in routes) item.path: item.builder},
      ),
    ),
  );
}
