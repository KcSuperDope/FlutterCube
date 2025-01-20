import 'package:cubestation_flutter/route/routes.dart';
import 'package:cubestation_flutter/src/home/home_controller.dart';
import 'package:get/get.dart';

class ChallengeController extends GetxController {
  ///0-计时排位，1-计时练习
  void toPlay(int type) {
    Get.find<HomeController>().isConnectDevice(() {
      Get.toNamed(Routes.TIMING_PLAY, arguments: type);
    });
  }
}
