// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pulpo_line/app/ui/home/home_creen.dart';

import 'ui/splash/splash_screen.dart';

abstract class Routes {
  static const HOME = '/';
  static const TRANSACTION = '/transaction';
  static const SPLASH = '/splash';
}

Map<String, Widget Function(BuildContext)> appRoutes = {
  Routes.HOME: (_) => const HomeScreen(),
  Routes.SPLASH: (_) => const SplashScreen(),
};
