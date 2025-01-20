import 'package:cubestation_flutter/route/routes.dart';
import 'package:get/get.dart';
import 'package:wakelock/wakelock.dart';

class Home2Controller extends GetxController {
  @override
  void onInit() {
    Wakelock.enable();
    super.onInit();
  }

  @override
  void onClose() {
    Wakelock.disable();
    super.onClose();
  }

  void toColor() async {
    Get.toNamed(Routes.COLOR);
  }

  void toSkin() {
    Get.toNamed(Routes.PASTE);
  }
}
