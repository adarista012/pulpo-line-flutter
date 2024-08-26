import 'package:get/get.dart';
import 'package:pulpo_line/app/app_navigation.dart';

class SplashController extends GetxController {
  SplashController() {
    _init();
  }

  _init() async {
    await Future.delayed(const Duration(seconds: 2));

    Get.offAllNamed(Routes.HOME);
  }
}
