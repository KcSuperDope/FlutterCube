
import 'package:cubestation_flutter/src/timing_play/timing_play_controller.dart';
import 'package:get/get.dart';

class SolvedSettlementController extends GetxController {
  final String time = Get.arguments;
  void playAgain() {
    Get.find<TimingPlayController>().scramble();
    Get.back();
  }
}
