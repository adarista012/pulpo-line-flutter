import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulpo_line/app/ui/splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width / 2;
    return GetBuilder(
      init: SplashController(),
      builder: (_) {
        return Container(
          color: Theme.of(context).colorScheme.inverseSurface,
          child: Center(
            child: Image.asset(
              'images/Logo.png',
              width: width,
              height: width,
            ),
          ),
        );
      },
    );
  }
}
