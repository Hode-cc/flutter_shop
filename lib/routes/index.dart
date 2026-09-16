import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Login/index.dart';
import 'package:hm_shop/pages/Main/index.dart';

Widget getRouteWidget() {
  return MaterialApp(
    initialRoute: '/',
    routes: getRootRoutes(),
    scrollBehavior: const MaterialScrollBehavior().copyWith(
      dragDevices: {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown,
      },
    ),
  );
}

Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {'/': (context) => MainPage(), '/login': (context) => LoginPage()};
}
