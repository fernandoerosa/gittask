import 'package:get/get.dart';
import 'package:gittask/app/repositories/user_repository.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getUsers() {
    UserRepository.openBox();
  }

  String getCount() {
    String string = count.toString();
    return string;
  }

  void increment() => count.value++;
}
