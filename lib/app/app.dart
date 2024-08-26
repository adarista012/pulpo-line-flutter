import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulpo_line/app/app_navigation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      navigatorObservers: [GetObserver()],
      routes: appRoutes,
      initialRoute: Routes.SPLASH,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
