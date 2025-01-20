import 'package:cubestation_flutter/src/record/record_model.dart';
import 'package:cubestation_flutter/src/solved_settlement_dialog/solved_settlement_dialog.dart';
import 'package:get/get.dart';
import 'package:reliable_interval_timer/reliable_interval_timer.dart';
import 'replay_cube/replay_cube_controller.dart';

class ReplayController extends GetxController {
  var playing = false.obs;
  var sliderValue = 0.0.obs;
  RecordModel record = Get.arguments;
  var currentStep = 0.obs;
  var ticks = 0.obs;
  late ReliableIntervalTimer timer;

  @override
  void onInit() {
    super.onInit();
    timer = ReliableIntervalTimer(
        interval: const Duration(milliseconds: 1),
        callback: (elapsedMilliseconds) async {
          if (ticks.value == record.useTime!) {
            await timer.stop();
            playing.value = false;
          }

          if (record.moves![currentStep.value].timeStamp! - record.moves!.first.timeStamp! ==
              ticks.value) {
            Get.find<ReplayCubeController>().rotateSliceApi(record.moves![currentStep.value].move!);
            if (currentStep.value != record.moves!.length - 1) {
              currentStep.value++;
            }
          }
          if (playing.value) {
            ticks.value++;
          }
        });
  }

  @override
  void onClose() async {
    super.onClose();
    await timer.stop();
  }

  void started() {
    playing.value = true;
    timeCount();
  }

  void timeCount() async {
    await timer.start().then((_) {
      print('Timer started');
    });
  }

  void pause() async {
    await timer.stop();
    playing.value = false;
  }

  void stepsDetail() {
    Get.dialog(SolvedSettlementDialog(), arguments: record);
  }
}
