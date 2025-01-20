import 'dart:async';
import 'package:cuber/cuber.dart';
import 'package:cubestation_flutter/common/button.dart';
import 'package:cubestation_flutter/common/pop_tips.dart';
import 'package:cubestation_flutter/cube/cube_controller.dart';
import 'package:cubestation_flutter/cube/scramble/scramble_controller.dart';
import 'package:cubestation_flutter/handler/ble_data_handler.dart';
import 'package:cubestation_flutter/handler/cuber_handler.dart';
import 'package:cubestation_flutter/src/teaching/teaching_controller.dart';
import 'package:cubestation_flutter/src/teaching/teaching_model.dart';
import 'package:cubestation_flutter/src/teaching_dialog/teaching_dialog.dart';
import 'package:cubestation_flutter/src/teaching_level/teaching_level_controller.dart';
import 'package:cubestation_flutter/src/teaching_level_play/orientation_dialog.dart';
import 'package:cubestation_flutter/src/teaching_level_play/pass_level_bottomsheet.dart';
import 'package:cubestation_flutter/common/dialog.dart';
import 'package:cubestation_flutter/utils/eventbus_utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:zflutter/zflutter.dart';

class TeachingLevelPlayController extends GetxController {
  late ScrambleController _scrambleController;
  late CubeController _cubeController;
  late GlobalKey popKey = GlobalKey();
  StreamSubscription? _rotateSubscription;
  StreamSubscription? _scrambleSubscription;
  final TeachingLevelController _teachingLevelController = Get.find<TeachingLevelController>();
  TeachingModel get model => _teachingLevelController.selectedTeachingModel;
  bool get isBasicLevel => model.level!.startsWith('基础知识');
  var isPlaying = false.obs;
  var currentQuestion = 0.obs;
  var currentSelectedOption = RxInt(-1);
  var order = ''.obs;
  var question = ''.obs;
  final List<String> _rotateQueue = [];
  int _answerRightCount = 0;
  int get _getStar => _answerRightCount < 4 ? 0 : _answerRightCount - 3;
  bool _bottomSheetExpand = false;
  var aiTips = ''.obs;
  var openAiTeaching = false.obs;

  @override
  void onInit() {
    initConfig();
    showBubbleTips();
    _rotateListen();
    super.onInit();
  }

  @override
  void onClose() {
    isPlaying.value = false;
    _rotateSubscription?.cancel();
    _scrambleSubscription?.cancel();
    closeAiTeach();
    super.onClose();
  }

  void initConfig() {
    isPlaying.value = false;
    currentQuestion.value = 0;
    currentSelectedOption.value = -1;
    order.value = '';
    question.value = '';
    _answerRightCount = 0;
    refreshGetStar();
    _scrambleController = Get.find<ScrambleController>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _cubeController = Get.find<CubeController>();
      _cubeController.initRotateAll();
    });
  }

  void _rotateListen() async {
    _rotateSubscription = eventBus.on<RotateSliceEvent>().listen((event) {
      if (_bottomSheetExpand) {
        toNextLevel();
      }

      if (isPlaying.value && !isBasicLevel) {
        _cubeStatusListen();
      }

      if (order.value == '第八题') {
        _rotateQueue.add(event.id);
        if (_rotateQueue.length == 4) {
          if (_rotateQueue.join().contains("D'R'DR")) {
            model.teachingDialogModels![2].teachingDialogItemModels!.first.getStarCount++;

            if (model.teachingDialogModels!.first.teachingDialogItemModels!.first.getStarCount <
                _getStar) {
              model.teachingDialogModels!.first.teachingDialogItemModels!.first.getStarCount =
                  _getStar;
            }
            _showLevelSettlementBottomSheet();
          }
          _rotateQueue.clear();
        }
      }

      if (order.value == '第七题') {
        _rotateQueue.add(event.id);
        if (_rotateQueue.length == 4) {
          if (_rotateQueue.join().contains("DLD'L'")) {
            model.teachingDialogModels![1].teachingDialogItemModels!.first.getStarCount++;
            Fluttertoast.showToast(msg: '已完成右手公式');
            order.value = '第八题';
            question.value = '使用1次左手公式（勾 上 回 下）';
          }
          _rotateQueue.clear();
        }
      }
    });
  }

  void toTeachingDialog() {
    Get.dialog(TeachingDialog(), arguments: {});
  }

  void completeCheck() async {
    List<Move> moves = await CuberHandler.getSequence(Cube.solved);
    if (moves.length < 20) {
      DialogUtils.titleOnly(title: '您的魔方还不够混乱，请继续打乱');
      return;
    }
    switch (_teachingLevelController.selectedLevel.value) {
      case 1:
        if (CuberHandler.isLevel1_3(BleDataHandler().cube.definition)) {
          DialogUtils.titleOnly(title: '您的魔方还不够混乱，请继续打乱');
          return;
        }
        break;
      case 2:
        if (CuberHandler.isLevel2_2(BleDataHandler().cube.definition)) {
          DialogUtils.titleOnly(title: '您的魔方还不够混乱，请继续打乱');
          return;
        }
        break;
      default:
    }
    isPlaying.value = true;
    showCustomGuidePop(context: Get.context!, popKey: popKey, title: '可查看教程学习');
  }

  void _cubeStatusListen() async {
    String definition = BleDataHandler().cube.definition;
    switch (_teachingLevelController.selectedLevel.value) {
      case 1:
        _level1(definition);
        break;
      case 2:
        _level2(definition);
        break;

      default:
    }
  }

  void refreshGetStar() {
    for (TeachingDialogModel m in model.teachingDialogModels!) {
      for (TeachingDialogItemModel e in m.teachingDialogItemModels!) {
        e.getStar = false;
      }
    }
  }

  void _level1(String definition) {
    if (CuberHandler.isLevel1_1_1(definition)) {
      if (!model.teachingDialogModels![0].teachingDialogItemModels![0].getStar) {
        model.teachingDialogModels![0].teachingDialogItemModels![0].getStarCount++;
        model.teachingDialogModels![0].teachingDialogItemModels![0].getStar = true;
      }
    }

    if (CuberHandler.isLevel1_1_2(definition)) {
      if (!model.teachingDialogModels![0].teachingDialogItemModels![1].getStar) {
        model.teachingDialogModels![0].teachingDialogItemModels![1].getStarCount++;
        model.teachingDialogModels![0].teachingDialogItemModels![1].getStar = true;
      }
    }

    if (CuberHandler.isLevel1_1_3(definition)) {
      if (!model.teachingDialogModels![0].teachingDialogItemModels![2].getStar) {
        model.teachingDialogModels![0].teachingDialogItemModels![2].getStarCount++;
        model.teachingDialogModels![0].teachingDialogItemModels![2].getStar = true;
      }
    }

    if (CuberHandler.isLevel1_2(definition)) {
      if (!model.teachingDialogModels![1].teachingDialogItemModels!.first.getStar) {
        model.teachingDialogModels![1].teachingDialogItemModels!.first.getStarCount++;
        model.teachingDialogModels![1].teachingDialogItemModels!.first.getStar = true;
      }
    }

    if (CuberHandler.isLevel1_3(definition)) {
      model.teachingDialogModels![2].teachingDialogItemModels!.first.getStarCount++;
      _showLevelSettlementBottomSheet();
    }
  }

  void _level2(String definition) {
    if (CuberHandler.isLevel2_1_1(definition)) {
      if (!model.teachingDialogModels![0].teachingDialogItemModels![0].getStar) {
        model.teachingDialogModels![0].teachingDialogItemModels![0].getStarCount++;
        model.teachingDialogModels![0].teachingDialogItemModels![0].getStar = true;
      }
    }

    if (CuberHandler.isLevel2_1_2(definition)) {
      if (!model.teachingDialogModels![0].teachingDialogItemModels![1].getStar) {
        model.teachingDialogModels![0].teachingDialogItemModels![1].getStarCount++;
        model.teachingDialogModels![0].teachingDialogItemModels![1].getStar = true;
      }
    }

    if (CuberHandler.isLevel2_1_3(definition)) {
      if (!model.teachingDialogModels![0].teachingDialogItemModels![2].getStar) {
        model.teachingDialogModels![0].teachingDialogItemModels![2].getStarCount++;
        model.teachingDialogModels![0].teachingDialogItemModels![2].getStar = true;
      }
    }

    if (CuberHandler.isLevel2_2(definition)) {
      model.teachingDialogModels![1].teachingDialogItemModels!.first.getStarCount++;
      _showLevelSettlementBottomSheet();
    }
  }

  void _showLevelSettlementBottomSheet() {
    isPlaying.value = false;
    if (openAiTeaching.value) {
      closeAiTeach();
    }
    if (_teachingLevelController.selectedLevel.value != 2) {
      _bottomSheetExpand = true;
    }
    Get.bottomSheet(PassLevelBottomSheet(),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            backgroundColor: Colors.white,
            isScrollControlled: true,
            isDismissible: false,
            enableDrag: false)
        .then((value) => _bottomSheetExpand = false);

    TeachingController teachingController = Get.find<TeachingController>();
    List getStars = teachingController.list
        .map((i) => i.teachingDialogModels!
            .map((j) => j.teachingDialogItemModels!.map((k) => k.getStarCount).toList())
            .toList())
        .toList();
    teachingController.localStorage.write('getStars', getStars);
  }

  void toNextLevel() {
    Get.back();
    _teachingLevelController.selectedLevel.value++;
    if (_teachingLevelController.selectedLevel.value == 1) {
      isPlaying.value = false;
    } else {
      isPlaying.value = true;
    }
  }

  void selectOption(int index) {
    if (ButtonUtils.isDoubleClick()) {
      return;
    }
    currentSelectedOption.value = index;
    if (model.teachingDialogModels!.first.teachingDialogItemModels![currentQuestion.value]
        .teachingBasicsPlayModel!.options![index].right!) {
      _answerRightCount++;
    }
    Future.delayed(2.seconds, () {
      if (currentQuestion.value < 5) {
        currentQuestion.value++;
        currentSelectedOption.value = -1;
      } else {
        if (!Get.isDialogOpen!) {
          Get.dialog(OrientationDialog(onTapStart: () {
            order.value = '第七题';
            question.value = '使用1次右手公式（勾 上 回 下）';
            isPlaying.value = true;
          }), barrierDismissible: false);
        }
      }
    });
  }

  void showBubbleTips() {
    if (isBasicLevel) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) =>
          showCustomGuidePop(context: Get.context!, popKey: popKey, title: '可查看教程学习'));
    }
  }

  void openAiTeach() {
    Get.dialog(OrientationDialog(
      onTapStart: () async {
        _cubeController.initRotateAll();
        //_cubeController.needFrameSync = false;
        openAiTeaching.value = true;
        switch (_teachingLevelController.selectedLevel.value) {
          case 1:
            await scrambleTask('复原白色小花', 'RFFRUDUBFULLRRDBBRLDRDFBDLDFULUDUUUBBFBBLFLRRDLDRBLUFF');
            await rotateSliceTask('将 “白橙棱块” 转到正确位置，使橙色块相对', "D'");
            await rotateSliceTask('顺时针旋转180°，使 “白橙棱块” 归位', "L2");
            await rotateAllTask('转动魔方，使橙色中心块朝前', false, angle: tau / 4);
            await rotateSliceTask('将 “白蓝棱块” 转到正确位置，使蓝色块相对', "D2");
            await rotateSliceTask('再顺时针旋转180°，使 “白蓝棱块” 归位', "B2");
            await rotateAllTask('转动魔方，使蓝色中心块朝前', false, angle: tau / 4);
            await rotateSliceTask('将 “白红棱块” 转到正确位置，使红色块相对', "D");
            await rotateSliceTask('再顺时针旋转180°，使 “白红棱块” 归位', "R2");
            await rotateAllTask('转动魔方，使红色中心块朝前', false, angle: tau / 4);
            await rotateSliceTask('顺时针旋转180°，使 "白绿棱块" 归位', "F2");
            break;
          case 2:
            await scrambleTask('复原白色十字', 'RUUUUUBUFDRLBRRDLURFLDFLBDRUBFFDDLRFBLUDLFBLLFBDBBRRFD');
            await rotateAllTask('转动魔方，使红色中心块朝前', true, angle: tau / 4);
            await rotateSliceTask('将 “白红绿角块” 转到正确位置', "D'");
            await rotateAllTask('调整视角使绿色中心块朝向自己', false, angle: tau / 8);
            await rotateSliceTask('使用1次左手公式（勾 上 回 下）', "D' R' D R");
            await rotateAllTask('转动魔方，使橙色中心块朝前', false, angle: tau * 3 / 8);
            await rotateSliceTask('将 “白蓝橙角块” 转到正确位置', "D");
            await rotateSliceTask('使用3次右手公式（勾 上 回 下 x3）', "D B D' B' D B D' B' D B D' B'");
            await rotateAllTask('转动魔方，使蓝色中心块朝前', false, angle: tau / 4);
            await rotateSliceTask('使用1次右手公式（勾 上 回 下）', "D R D' R'");
            await rotateAllTask('转动魔方，使绿色中心块朝前', false, angle: tau / 2);
            await rotateSliceTask('将 “白绿橙角块” 转到正确位置', "D2");
            await rotateAllTask('调整视角使橙色中心块朝向自己', false, angle: tau / 8);
            await rotateSliceTask('使用1次左手公式（勾 上 回 下）', "D' F' D F");
            await rotateAllTask('转动魔方，使蓝色中心块朝前', false, angle: tau * 3 / 8);
            await rotateSliceTask('将 “白红蓝角块” 转到正确位置', "D2");
            await rotateAllTask('调整视角使红色中心块朝向自己', false, angle: tau / 8);
            await rotateSliceTask('使用1次左手公式（勾 上 回 下）', "D' B' D B");
            break;
          default:
        }
      },
    ), barrierDismissible: false);
  }

  Future scrambleTask(String tips, String definition) async {
    aiTips.value = tips;
    Cube cube = Cube.from(definition);
    await _scrambleController.scramble(cube);
  }

  Future rotateSliceTask(String tips, String queue) async {
    aiTips.value = tips;
    await _scrambleController.scrambleWithQueue(queue);
  }

  Future rotateAllTask(String tips, bool direction, {double angle = tau / 4}) async {
    aiTips.value = tips;
    _cubeController.rotateAll(direction, angle: angle);
    await Future.delayed(3.seconds);
  }

  void closeAiTeach() {
    openAiTeaching.value = false;
    _scrambleController.cancelScramble();
    _cubeController.initRotateAll();
    //_cubeController.needFrameSync = true;
  }

  Future<bool> onWillPop() {
    DialogUtils.twoButton(
      title: '',
      content: '您的挑战未结束，中途退出将不保留通关进度，是否继续？',
      onConfirm: () {
        Get.back();
      },
    );
    return Future.value(false);
  }
}
