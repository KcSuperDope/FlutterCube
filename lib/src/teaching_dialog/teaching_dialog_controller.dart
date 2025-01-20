
import 'package:cubestation_flutter/src/teaching/teaching_model.dart';
import 'package:cubestation_flutter/src/teaching_dialog/teach_cube/teach_cube_controller.dart';
import 'package:cubestation_flutter/src/teaching_level/teaching_level_controller.dart';
import 'package:get/get.dart';

class TeachingDialogController extends GetxController {
  TeachingModel get model => Get.find<TeachingLevelController>().selectedTeachingModel;
  var currentStep = 0.obs;
  var currentItem = 0.obs;
  var startedPlaying = false.obs;
  bool get isBasicLevel => model.level!.startsWith('基础知识');

  Future<bool> started() async {
    List<String> queue = model.teachingDialogModels![currentStep.value]
        .teachingDialogItemModels![currentItem.value].teachingCubeModel!.animationQueue!
        .split(' ');
    String? level = model.teachingDialogModels![currentStep.value]
        .teachingDialogItemModels![currentItem.value].statusImage!;
    Get.find<TeachCubeController>(tag: level).startPlay(queue);
    startedPlaying.value = true;
    return true;
  }

  void onSegementChanged(int? value) {
    if (value != null) {
      currentItem.value = value;
    }
  }

  void onStepChanged(int i) {
    currentItem.value = 0;
    currentStep.value = i;
  }
}
