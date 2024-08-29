import 'package:get/get.dart';
import 'package:pulpo_line/app/data/implementations/home_repository_implementation.dart';
import 'package:pulpo_line/app/domain/repositories/home_repository.dart';

Future<void> injectDependencies() async {
  Get.lazyPut<HomeRepository>(
    () => HomeRepositoryImplementation(),
  );
}
