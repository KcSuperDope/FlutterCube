import 'dart:async';
import 'package:cuber/cuber.dart';
import 'package:cubestation_flutter/cube/box/box.dart';
import 'package:cubestation_flutter/cube/cube_constant.dart';
import 'package:cubestation_flutter/cube/cube_controller.dart';
import 'package:cubestation_flutter/handler/ble_data_handler.dart';
import 'package:cubestation_flutter/handler/cuber_handler.dart';
import 'package:cubestation_flutter/utils/eventbus_utils.dart';
import 'package:cubestation_flutter/utils/taskqueue_utils.dart';
import 'package:get/get.dart';
import 'package:zflutter/zflutter.dart';

class ScrambleController extends GetxController with GetTickerProviderStateMixin {
  late ZVector translate = ZVector.zero;
  late ZVector rotate = ZVector.zero;

  late TaskQueueUtils _scrambleQueueUtils;
  Completer? completer;
  late List<String> _sequence;
  var showSequence = <String>[].obs;
  StreamSubscription? _subscription;
  late Cube _cube;
  Completer? _scrambleOkCompleter;

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }

  Future<List<String>> _getSequence() async {
    List<Move> moves = await CuberHandler.getSequence(_cube);
    print('moves=$moves');
    return Future.value(moves.map((e) => e.toString()).toList());
  }

  void cancelScramble() {
    Get.find<CubeController>().isScrambling = false;
    _subscription?.cancel();
  }

  Future<bool> scramble(Cube targetCube) {
    _cube = targetCube;
    return _scramble();
  }

  Future<bool> _scramble() async {
    List<String> sequence = await _getSequence();
    if (sequence.isEmpty) {
      return Future.value(true);
    }

    _scrambleQueueUtils = TaskQueueUtils();
    _subscription = eventBus.on<RotateSliceEvent>().listen((event) {
      if (completer != null && !completer!.isCompleted) {
        completer?.complete(event.id);
      }
    });
    showSequence.value = sequence;
    Get.find<CubeController>().isScrambling = true;
    _sequence = [];
    for (var s in sequence) {
      if (s.contains('2')) {
        _sequence.add(s[0]);
        _sequence.add(s[0]);
      } else {
        _sequence.add(s);
      }
    }

    while (_sequence.isNotEmpty) {
      await _scrambleTask(_sequence.first);
    }
    return Future.value(false);
  }

  Future _scrambleTask(String index) {
    Future task() {
      completer = Completer();
      _setArrowPosition(index);
      return completer!.future;
    }

    return _scrambleQueueUtils.addTask(task).then((value) async {
      if (value != index) {
        _subscription?.cancel();
        await _scramble();
      } else {
        _sequence.removeAt(0);
      }
      showSequence.clear();
      //打乱完成
      if (_sequence.isEmpty) {
        Get.find<CubeController>().isScrambling = false;
        eventBus.fire(ScrambleOkEvent());
        _subscription?.cancel();
        completer = null;
        if (_scrambleOkCompleter != null && !_scrambleOkCompleter!.isCompleted) {
          _scrambleOkCompleter!.complete();
        }
      } else {
        //统计显示的打乱序列
        int k = 1;
        for (int i = 0; i < _sequence.length - 1; i++) {
          if (_sequence[i] == _sequence[i + 1]) {
            k++;
          } else {
            showSequence.add('${_sequence[i]}${k > 1 ? k.toString() : ''}');
            k = 1;
          }
        }
        showSequence.add('${_sequence.last}${k > 1 ? k.toString() : ''}');
      }
    });
  }

  Future<bool> scrambleWithQueue(String queue) async {
    if (queue.isEmpty) {
      return Future.value(true);
    }
    List<String> sequence = queue.split(' ');
    _cube = BleDataHandler().cube;
    _scrambleQueueUtils = TaskQueueUtils();
    _subscription = eventBus.on<RotateSliceEvent>().listen((event) {
      if (!completer!.isCompleted) {
        completer?.complete(event.id);
      }
    });
    Get.find<CubeController>().isScrambling = true;
    _sequence = [];
    for (var s in sequence) {
      if (s.contains('2')) {
        _sequence.add(s[0]);
        _sequence.add(s[0]);
      } else {
        _sequence.add(s);
      }
    }

    while (_sequence.isNotEmpty) {
      await _scrambleTaskWithQueue(_sequence.first, queue);
    }
    return Future.value(false);
  }

  Future _scrambleTaskWithQueue(String index, String queue) {
    Future task() {
      completer = Completer();
      _setArrowPosition(index);
      return completer!.future;
    }

    return _scrambleQueueUtils.addTask(task).then((value) async {
      if (value != index) {
        _subscription?.cancel();
        Future task() {
          _scrambleOkCompleter = Completer();
          _scramble();
          return _scrambleOkCompleter!.future;
        }

        await task();
        await scrambleWithQueue(queue);
      } else {
        _sequence.removeAt(0);
      }
      //打乱完成
      if (_sequence.isEmpty) {
        Get.find<CubeController>().isScrambling = false;
        _subscription?.cancel();
        completer = null;
        _scrambleOkCompleter = null;
      }
    });
  }

  void _setArrowPosition(String index) {
    switch (index) {
      case L:
        translate = const ZVector.only(x: -boxOffset);
        rotate = const ZVector.only(z: tau / 4);
        break;
      case L_:
        translate = const ZVector.only(x: -boxOffset);
        rotate = const ZVector.only(z: -tau / 4);
        break;
      case R:
        translate = const ZVector.only(x: boxOffset);
        rotate = const ZVector.only(z: -tau / 4);
        break;
      case R_:
        translate = const ZVector.only(x: boxOffset);
        rotate = const ZVector.only(z: tau / 4);
        break;
      case F:
        translate = const ZVector.only(z: boxOffset);
        rotate = const ZVector.only(x: tau / 4);
        break;
      case F_:
        translate = const ZVector.only(z: boxOffset);
        rotate = const ZVector.only(x: -tau / 4);
        break;
      case B:
        translate = const ZVector.only(z: -boxOffset);
        rotate = const ZVector.only(x: -tau / 4);
        break;
      case B_:
        translate = const ZVector.only(z: -boxOffset);
        rotate = const ZVector.only(x: tau / 4);
        break;
      case U:
        translate = const ZVector.only(y: -boxOffset);
        rotate = const ZVector.only(z: tau / 2);
        break;
      case U_:
        translate = const ZVector.only(y: -boxOffset);
        rotate = ZVector.zero;
        break;
      case D:
        translate = const ZVector.only(y: boxOffset);
        rotate = ZVector.zero;
        break;
      case D_:
        translate = const ZVector.only(y: boxOffset);
        rotate = const ZVector.only(z: tau / 2);
        break;
      default:
    }
  }
}
