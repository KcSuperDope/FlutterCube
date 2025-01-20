import 'package:cubestation_flutter/src/teaching/teaching_controller.dart';
import 'package:cubestation_flutter/src/teaching/teaching_model.dart';
import 'package:get/get.dart';

class TeachingLevelController extends GetxController {
  var currentIndex = 0.obs;
  var selectedLevel = 0.obs;
  List<TeachingModel> list = Get.find<TeachingController>().list;
  TeachingModel get selectedTeachingModel => list[selectedLevel.value];

  @override
  void onInit() {
    selectedLevel.value = Get.arguments;
    super.onInit();
  }
}
