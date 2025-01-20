import 'dart:async';
import 'package:cuber/cuber.dart';
import 'package:cubestation_flutter/common/dialog.dart';
import 'package:cubestation_flutter/cube/scramble/scramble_controller.dart';
import 'package:cubestation_flutter/route/routes.dart';
import 'package:cubestation_flutter/src/status_check/status_check.dart';
import 'package:cubestation_flutter/utils/eventbus_utils.dart';
import 'package:cubestation_flutter/utils/time_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TimingPlayController extends GetxController {
  //0-计时排位，1-计时练习
  final int type = Get.arguments;
  GetStorage localStorage = GetStorage();
  late ScrambleController scrambleController;
  StreamSubscription? _scrambleSubscription;
  StreamSubscription? _solvedSubscription;
  StreamSubscription? _rotateSubscription;
  Timer? _timer;
  late int countTime;
  var showText = ''.obs;
  var isScrambling = false.obs;

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.dialog(const StatusCheckDialog(), arguments: scramble, barrierDismissible: false);
    });
    scrambleController = Get.find<ScrambleController>();
    super.onInit();
  }

  @override
  void onClose() {
    _timer?.cancel();
    _timer = null;
    _scrambleSubscription?.cancel();
    _solvedSubscription?.cancel();
    _rotateSubscription?.cancel();
    super.onClose();
  }

  Future<bool> onWillPop() {
    DialogUtils.twoButton(
      title: '',
      content: '比赛正在进行中，是否放弃挑战',
      onConfirm: () {
        Get.back();
      },
    );
    return Future.value(false);
  }

  void scramble() {
    // var count = localStorage.read('scrambleCount') ?? 0;
    // String sequence = scrambleSets[count];
    // scrambleController.scramble(sequence.split(' '));
    // count++;
    // localStorage.write('scrambleCount', count);
    Algorithm algorithm = Algorithm.scramble();
    Cube cube = algorithm.apply(Cube.solved);
    scrambleController.scramble(cube);
    _scrambleSubscription = eventBus.on<ScrambleOkEvent>().listen((event) => _observeCountDown());
    _scrambleCountDown();
  }

  void _scrambleCountDown() {
    isScrambling.value = true;
    countTime = 60;
    showText.value = '打乱中 $countTime';
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countTime <= 0) {
        _dnf();
        return;
      }
      countTime--;
      showText.value = '打乱中 $countTime';
    });
  }

  void _observeCountDown() {
    isScrambling.value = false;
    _timer?.cancel();
    countTime = 15;
    showText.value = '观察中 $countTime';

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countTime <= 0) {
        timer.cancel();
        _timeing();
        return;
      }
      countTime--;
      showText.value = '观察中 $countTime';
    });
    _rotateSubscription = eventBus.on<RotateSliceEvent>().listen((event) {
      _timer?.cancel();
      _timeing();
      _rotateSubscription?.cancel();
    });
  }

  void _timeing() {
    _solvedSubscription = eventBus.on<SolvedEvent>().listen((event) => _solved());
    showText.value = TimeUtils.formatTime(countTime);
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      if (countTime >= 300000) {
        _dnf();
        return;
      }
      countTime += 10;
      showText.value = TimeUtils.formatTime(countTime);
    });
  }

  void _solved() {
    if (Get.isDialogOpen!) return;
    _timer?.cancel();
    _timer = null;
    // BleDataHandler().writeRotateIndexQueryApi();
    Get.toNamed(Routes.SOLVED_SETTLEMENT, arguments: showText.value);
  }

  void _dnf() {
    _timer?.cancel();
    _timer = null;
    showText.value = '';
    scrambleController.cancelScramble();
    scrambleController.showSequence.clear();
    Get.toNamed(Routes.DNF, arguments: () {
      scramble();
      Get.back();
    });
  }
}
