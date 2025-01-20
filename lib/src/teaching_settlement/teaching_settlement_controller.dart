import 'package:cubestation_flutter/src/teaching/teaching_model.dart';
import 'package:cubestation_flutter/src/teaching_level/teaching_level_controller.dart';
import 'package:cubestation_flutter/src/teaching_level_play/teaching_level_play_controller.dart';
import 'package:get/get.dart';

class TeachingSettlementController extends GetxController {
  final TeachingModel teachingModel = Get.find<TeachingLevelController>().selectedTeachingModel;
  TeachingLevelPlayController teachingLevelPlayController = Get.find<TeachingLevelPlayController>();
  void playAgain() {
    teachingLevelPlayController.initConfig();
    Get.back();
  }
}
