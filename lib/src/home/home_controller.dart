import 'dart:async';
import 'package:cuber/cuber.dart';
import 'package:cubestation_flutter/cube/scramble/scramble_controller.dart';
import 'package:cubestation_flutter/handler/ble_data_handler.dart';
import 'package:cubestation_flutter/handler/cuber_handler.dart';
import 'package:cubestation_flutter/route/routes.dart';
import 'package:cubestation_flutter/src/demo/demo.dart';
import 'package:cubestation_flutter/src/device_info/device_info_model.dart';
import 'package:cubestation_flutter/src/find_devices/ble_off_dialog.dart';
import 'package:cubestation_flutter/src/find_devices/find_devices.dart';
import 'package:cubestation_flutter/src/find_devices/find_devices_controller.dart';
import 'package:cubestation_flutter/src/record/record_model.dart';
import 'package:cubestation_flutter/src/solved_settlement_dialog/solved_settlement_dialog.dart';
import 'package:cubestation_flutter/utils/eventbus_utils.dart';
import 'package:cubestation_flutter/utils/time_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nordic_dfu/nordic_dfu.dart';
import 'package:wakelock/wakelock.dart';
import 'package:cubestation_flutter/common/dialog.dart';

class HomeController extends GetxController {
  var deviceConnected = false.obs;
  var power = 0.obs;
  final deviceInfoModel = DeviceInfoModel();
  bool cubeDisplay = false;
  final _dfuProgress = 0.obs;

  ScrambleController? scrambleController;
  StreamSubscription? _scrambleSubscription;
  StreamSubscription? _solvedSubscription;
  StreamSubscription? _rotateSubscription;
  Timer? _timer;
  late int countTime;
  var showText = ''.obs;
  var isScrambling = false.obs;
  var isPlaying = false.obs;
  String get scrambleText => _getScrambleText();
  late List<MethodModel> _cfops;
  RecordModel? _record;
  bool _isC = false;
  bool _isF = false;
  bool _isO = false;
  bool _isP = false;
  Stopwatch? stopwatch;

  @override
  void onInit() {
    Wakelock.enable();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      deviceConnected.value = false;
    });
    super.onInit();
  }

  @override
  void onClose() {
    giveUp();
    Wakelock.disable();
    super.onClose();
  }

  void deviceInfo() {
    isConnectDevice(() => Get.toNamed(Routes.DEVICE_INFO));
  }

  void connectDevice() {
    FlutterBluePlus.adapterState.listen((state) {
      if (state == BluetoothAdapterState.on) {
        if (!Get.isDialogOpen!) {
          Get.dialog(FindDevicesDialog()).then((value) => Get.delete<FindDevicesController>());
        }
      } else if (state == BluetoothAdapterState.off) {
        if (!Get.isDialogOpen!) {
          Get.dialog(const BleOffDialog());
        }
        //Platform.isAndroid ? FlutterBluePlus.instance.turnOn() : null;
      }
    });
  }

  Future<bool> onWillPop() {
    if (isPlaying.value) {
      DialogUtils.twoButton(
        title: '',
        content: '练习正在进行中，是否放弃本次练习',
        onConfirm: () {
          giveUp();
          GetStorage localStorage = GetStorage();
          List<RecordModel> records = [];
          if (localStorage.read('practiceRecord') != null) {
            localStorage.read('practiceRecord').forEach((v) {
              records.add(RecordModel.fromJson(v));
            });
          }
          _record?.playTime = DateTime.now().toString().substring(0, 16);
          _record?.definition = null;
          records.insert(0, _record!);
          localStorage.write('practiceRecord', records.map((e) => e.toJson()).toList());
        },
      );
      return Future.value(false);
    }
    return Future.value(true);
  }

  void giveUp() {
    isScrambling.value = false;
    isPlaying.value = false;
    stopwatch?.stop();
    _timer?.cancel();
    _timer = null;
    scrambleController?.cancelScramble();
    scrambleController?.showSequence.clear();
    _scrambleSubscription?.cancel();
    _solvedSubscription?.cancel();
    _rotateSubscription?.cancel();
    BleDataHandler().recordStep = false;
    BleDataHandler().moves.clear();
  }

  void startPractice() {
    isPlaying.value = true;
    _record = RecordModel(steps: 0, useTime: 0);
    scrambleController = Get.find<ScrambleController>();
    _scramble();
    //Get.dialog(const StatusCheckDialog(), arguments: _scramble, barrierDismissible: false);
  }

  void _scramble() {
    Algorithm algorithm = Algorithm.scramble();
    Cube cube = algorithm.apply(Cube.solved);
    scrambleController?.scramble(cube);
    _scrambleSubscription = eventBus.on<ScrambleOkEvent>().listen((event) {
      scrambleController?.cancelScramble();
      scrambleController?.showSequence.clear();
      _scrambleSubscription?.cancel();
      _observeCountDown();
    });
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
    _rotateSubscription = eventBus.on<RotateSliceEvent>().listen((event) async {
      _timer?.cancel();
      _rotateSubscription?.cancel();
      _timeing();
    });
  }

  void _timeing() async {
    _cfops = [
      MethodModel(steps: 0, useTime: 0),
      MethodModel(steps: 0, useTime: 0),
      MethodModel(steps: 0, useTime: 0),
      MethodModel(steps: 0, useTime: 0)
    ];
    _isC = false;
    _isF = false;
    _isO = false;
    _isP = false;
    _solvedSubscription = eventBus.on<SolvedEvent>().listen((event) => _solved());
    _rotateListen();
    BleDataHandler().moves = [];
    BleDataHandler().recordStep = true;
    showText.value = TimeUtils.formatTime(countTime);
    stopwatch = Stopwatch();
    stopwatch?.start();
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      if (countTime >= 300000) {
        _dnf();
        return;
      }
      countTime = stopwatch!.elapsedMilliseconds;
      showText.value = TimeUtils.formatTime(countTime);
    });
  }

  void _rotateListen() async {
    _record?.definition = BleDataHandler().cube.definition;
    _rotateSubscription = eventBus.on<RotateSliceEvent>().listen((event) {
      String definition = BleDataHandler().cube.definition;
      _cfopTiming(definition);
      // _layerTiming(definition);
    });
  }

  void _cfopTiming(String definition) {
    if (CuberHandler.isC(definition)) {
      if (!_isC) {
        _cfops[0].useTime = countTime;
        _cfops[0].steps = BleDataHandler().moves.length;
        _isC = true;
      }
    }

    if (CuberHandler.isF(definition)) {
      if (!_isF) {
        _cfops[1].useTime = countTime - _cfops[0].useTime!;
        _cfops[1].steps = BleDataHandler().moves.length - _cfops[0].steps!;
        _isF = true;
      }
    }

    if (CuberHandler.isO(definition)) {
      if (!_isO) {
        _cfops[2].useTime = countTime - _cfops[1].useTime! - _cfops[0].useTime!;
        _cfops[2].steps = BleDataHandler().moves.length - _cfops[1].steps! - _cfops[0].steps!;
        _isO = true;
      }
    }

    if (CuberHandler.isSolved(definition)) {
      if (!_isP) {
        _cfops[3].useTime =
            countTime - _cfops[2].useTime! - _cfops[1].useTime! - _cfops[0].useTime!;
        _cfops[3].steps =
            BleDataHandler().moves.length - _cfops[2].steps! - _cfops[1].steps! - _cfops[0].steps!;
        _isP = true;
      }
    }
  }

  void _solved() {
    GetStorage localStorage = GetStorage();
    List<RecordModel> records = [];
    if (localStorage.read('practiceRecord') != null) {
      localStorage.read('practiceRecord').forEach((v) {
        records.add(RecordModel.fromJson(v));
      });
    }
    //List<MoveModel> moves = BleDataHandler().moves.
    _record?.steps = BleDataHandler().moves.length;
    _record?.useTime = countTime;
    _record?.playTime = DateTime.now().toString().substring(0, 16);
    _record?.cfops = _cfops;
    _record?.moves = BleDataHandler().moves;
    records.insert(0, _record!);
    localStorage.write('practiceRecord', records.map((e) => e.toJson()).toList());

    Get.dialog(SolvedSettlementDialog(), arguments: _record!);
    giveUp();
  }

  void _dnf() {
    giveUp();

    GetStorage localStorage = GetStorage();
    List<RecordModel> records = [];
    if (localStorage.read('practiceRecord') != null) {
      localStorage.read('practiceRecord').forEach((v) {
        records.add(RecordModel.fromJson(v));
      });
    }
    _record?.playTime = DateTime.now().toString().substring(0, 16);
    _record?.definition = null;
    records.insert(0, _record!);
    localStorage.write('practiceRecord', records.map((e) => e.toJson()).toList());

    DialogUtils.twoButton(
        title: '',
        content: '挑战失败',
        textCancel: '返回首页',
        textConfirm: '再来一次',
        onConfirm: () {
          _scramble();
          isPlaying.value = true;
        });
  }

  String _getScrambleText() {
    return scrambleController?.showSequence.join(' ') ?? '';
  }

  void statusSync() async {
    isConnectDevice(() => Get.toNamed(Routes.STATUS_SYNC));
  }

  void toDemo() {
    Get.to(() => DemoPage());
  }

  void toFastSolution() {
    isConnectDevice(() => Get.toNamed(Routes.FAST_SOLUTION));
  }

  void isConnectDevice(VoidCallback callback) {
    deviceConnected.value
        ? callback()
        : DialogUtils.twoButton(
            title: '',
            content: '请先连接智能魔方',
            onConfirm: () {
              Get.back();
              connectDevice();
            },
          );
  }

  Future<void> doDfu() async {
    String deviceId = deviceInfoModel.deviceId;
    Get.dialog(
        Obx(() =>
            DialogUtils.progress(title: '固件升级中', content: '请勿关闭应用', progress: _dfuProgress.value)),
        barrierDismissible: false);
    try {
      final s =
          await NordicDfu().startDfu(deviceId, 'assets/file.zip', fileInAsset: true, onError: (
        String address,
        int error,
        int errorType,
        String message,
      ) {
        Fluttertoast.showToast(msg: '固件升级失败');
        debugPrint('address: $address, error: $error, errorType: $errorType, message: $message');
      }, onProgressChanged: (
        deviceAddress,
        percent,
        speed,
        avgSpeed,
        currentPart,
        partsTotal,
      ) {
        _dfuProgress.value = percent;
        debugPrint('deviceAddress: $deviceAddress, percent: $percent');
      }, onDfuCompleted: (string) {
        Get.back();
        Fluttertoast.showToast(msg: '固件已升级至最新版本');
        debugPrint('onDfuCompleted: $string');
      });
      debugPrint('NordicDfu().startDfu:$s');
    } catch (e) {
      Fluttertoast.showToast(msg: '固件升级失败');
      debugPrint('catch error:$e');
    }
  }
}
