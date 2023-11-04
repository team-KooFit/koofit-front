import 'package:flutter/material.dart';
import 'package:exercisemain/presentation/k0_screen/k0_screen.dart';
import 'package:exercisemain/presentation/k1_screen/k1_screen.dart';
import 'package:exercisemain/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String k0Screen = '/k0_screen';

  static const String k1Screen = '/k1_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    k0Screen: (context) => K0Screen(),
    k1Screen: (context) => K1Screen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
