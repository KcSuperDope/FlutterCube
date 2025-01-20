import 'dart:convert';

import 'package:cuber/cuber.dart';
import 'package:cubestation_flutter/cube/cube_constant.dart';
import 'package:cubestation_flutter/cube/cube_controller.dart';
import 'package:cubestation_flutter/src/home/home_controller.dart';
import 'package:cubestation_flutter/src/record/record_model.dart';
import 'package:cubestation_flutter/utils/eventbus_utils.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class BleDataHandler {
  static BleDataHandler? _instance;

  BleDataHandler._internal() {
    _instance = this;
  }

  factory BleDataHandler() => _instance ?? BleDataHandler._internal();

  final Map<String, String> _rotateIndexMap = {
    '0000': D,
    '0001': D_,
    '0010': U,
    '0011': U_,
    '0100': B,
    '0101': B_,
    '0110': F,
    '0111': F_,
    '1000': L,
    '1001': L_,
    '1010': R,
    '1011': R_,
    '1111': "NULL",
  };

  late List<int> _curPose;
  late List<double> _curPoseMatrix;

  //final HomeController _homeController = Get.find<HomeController>();
  final _orderNum = 0.obs;
  late bool _needUpdateStatus;
  BluetoothCharacteristic? _characteristic;

  late bool recordStep;
  late List<MoveModel> moves;
  // int startIndex;
  // late Cube cube;
  Cube cube = Cube.solved;

  void onInit() {
    _curPose = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    _curPoseMatrix = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    recordStep = false;
    _needUpdateStatus = true;
    debounce(_orderNum, (value) {
      // if (Get.find<CubeController>().needFrameSync) {
      Get.find<CubeController>().frameSync();
      //  _needUpdateStatus = true;
      //}
    }, time: 300.milliseconds);
  }

  ///初始化蓝牙写信道
  void initCharacteristic(BluetoothCharacteristic characteristic) {
    _characteristic = characteristic;
  }

  ///解析蓝牙notify返回数据
  void decode(List<int> data) {
    // data = EncryptUtil.decrypt(data);
    // if (!_homeController.cubeDisplay) {
    //   return;
    // }
    for (int i = 1; i < data.length; i++) {
      switch (data[i]) {
        //转动0x01
        case 0x01:
          if (i + 8 < data.length && data[i + 1] == 0x07) {
            _rotateSliceApi(data.sublist(i + 2, i + 9));
            i += 8;
          }
          break;
        //魔方状态0x02
        case 0x02:
          if (i + 15 < data.length && data[i + 1] == 0x0E) {
            _cubeStatusApi(data.sublist(i + 2, i + 16));
            i += 15;
          }
          break;
        //姿态角0x03
        case 0x03:
          if (i + 10 < data.length && data[i + 1] == 0x09) {
            _poseApi(data.sublist(i + 2, i + 11));
            i += 10;
          }
          break;
        //状态信息0x04
        case 0x04:
          if (i + 2 < data.length && data[i + 1] == 0x01) {
            _statusInfoApi(data[i + 2]);
            i += 2;
          }
          break;
        //最近转动步骤查询0x06
        case 0x06:
          if (i + 1 < data.length && i + data[i + 1] + 1 < data.length) {
            _rotateIndexQueryApi(data.sublist(i + 2, i + data[i + 1] + 2));
            i += (data[i + 1] + 1);
          }
          break;
        //设备信息0x07
        case 0x07:
          if (i + 15 < data.length && data[i + 1] == 0x0E) {
            _deviceInfoApi(data.sublist(i + 2, i + 16));
            i += 15;
          }
          break;
        //魔方重置0x08
        case 0x08:
          if (i + 2 < data.length && data[i + 1] == 0x01) {
            _cubeResetApi(data[i + 2]);
            i += 2;
          }
          break;
        //绑定账号id 0x09
        case 0x09:
          if (i + 2 < data.length && data[i + 1] == 0x01) {
            _bindIdApi(data[i + 2]);
            i += 2;
          }
          break;
        //电量上报0x10
        case 0x10:
          if (i + 2 < data.length && data[i + 1] == 0x01) {
            _powerApi(data[i + 2]);
            i += 2;
          }
          break;
        //蓝牙配置0x11
        case 0x11:
          if (i + 2 < data.length && data[i + 1] == 0x01) {
            _bluetoothConfigApi(data[i + 2]);
            i += 2;
          }
          break;
        //低功耗配置0x12
        case 0x12:
          if (i + 2 < data.length && data[i + 1] == 0x01) {
            _lowEnergyConfigApi(data[i + 2]);
            i += 2;
          }
          break;
        //低功耗配置查询0x13
        case 0x13:
          if (i + 3 < data.length && data[i + 1] == 0x02) {
            _lowEnergyConfigQueryApi(data.sublist(i + 2, i + 4));
            i += 3;
          }
          break;
        //魔方复原0x14
        case 0x14:
          if (i + 5 < data.length && data[i + 1] == 0x04) {
            _cubeRecoveredApi(data.sublist(i + 2, i + 6));
            i += 5;
          }
          break;
        //恢复出厂设置0x15
        case 0x15:
          if (i + 2 < data.length && data[i + 1] == 0x01) {
            _factoryResetApi(data[i + 2]);
            i += 2;
          }
          break;
        default:
          break;
      }
    }
  }

  //转动协议
  void _rotateSliceApi(List<int> list) {
    // int order = list[5] * 256 + list[4];
    if (_orderNum.value == 255) {
      _orderNum.value = 0;
    } else {
      _orderNum.value++;
    }
    int order = list[4];
    if (_orderNum.value != order) {
      // 查步
      int index = order - 1;
      int total = order - _orderNum.value;
      if (total < 0) {
        writeRotateIndexQueryApi(index, order);
        if (255 - _orderNum.value > 0) {
          writeRotateIndexQueryApi(255, 255 - _orderNum.value);
        }
      } else {
        writeRotateIndexQueryApi(index, total);
      }
      //同步状态
      _orderNum.value = order;
      _needUpdateStatus = true;
      print('发生丢步并同步最新状态');
    }

    int rotateSlice = list[6];
    switch (rotateSlice) {
      case 0x02:
        _notify(U, order);
        break;
      case 0x42:
        _notify(U_, order);
        break;
      case 0x08:
        _notify(F, order);
        break;
      case 0x48:
        _notify(F_, order);
        break;
      case 0x20:
        _notify(R, order);
        break;
      case 0x60:
        _notify(R_, order);
        break;
      case 0x41:
        _notify(D_, order);
        break;
      case 0x01:
        _notify(D, order);
        break;
      case 0x50:
        _notify(L_, order);
        break;
      case 0x10:
        _notify(L, order);
        break;
      case 0x44:
        _notify(B_, order);
        break;
      case 0x04:
        _notify(B, order);
        break;

      default:
    }
  }

  void _notify(String slice, int order) {
    if (recordStep) {
      moves.add(MoveModel(move: slice, timeStamp: DateTime.now().millisecondsSinceEpoch));
      // moves[order] = MoveModel(move: slice, timeStamp: DateTime.now().millisecondsSinceEpoch);
    }
    cube = cube.move(Move.parse(slice));
    Get.find<CubeController>().rotateSliceApi(slice);
    eventBus.fire(RotateSliceEvent(slice));
  }

  void updateCubeStatus() {
    _needUpdateStatus = true;
  }

  ///魔方状态同步协议
  void _cubeStatusApi(List<int> list) {
    List<int> data = list.sublist(2);
    if (_orderNum.value != list[0]) {
      _needUpdateStatus = true;
    }

    if (_needUpdateStatus) {
      _orderNum.value = list[0];
      String status = '';
      for (var e in data) {
        status = status + e.toRadixString(2).padLeft(8, '0');
      }
      List<String> statusList = status.split('');
      List<Corner> cp = [];
      List<int> co = [];
      List<Edge> ep = [];
      List<int> eo = [];
      for (int i = 0; i < statusList.length - 3; i++) {
        if (0 <= i && i < 21) {
          String corP = statusList.sublist(i, i + 3).join();
          cp.add(corMap[corP]!);
          i += 2;
        }
        if (21 <= i && i < 37) {
          String corD = statusList.sublist(i, i + 2).join();
          co.add(int.parse(corD, radix: 2));
          i += 1;
        }
        if (37 <= i && i < 81) {
          String edgeP = statusList.sublist(i, i + 4).join();
          ep.add(edgeMap[edgeP]!);
          i += 3;
        }
        if (81 <= i && i < 93) {
          String edgeD = statusList[i];
          eo.add(int.parse(edgeD));
        }
      }
      cp.add(_getMissedCor(cp));
      ep.add(_getMissedEdge(ep));
      Map<String, dynamic> json = {
        'cp': [for (final item in cp) item.index],
        'co': co,
        'ep': [for (final item in ep) item.index],
        'eo': eo,
      };
      cube = Cube.fromJson(json);
      Get.find<CubeController>().updateCubeStatus();
      _needUpdateStatus = false;
    }
  }

  ///姿态角协议
  void _poseApi(List<int> newPose) {
    bool poseChanged = false;
    for (int j = 0; j < newPose.length; j++) {
      if ((newPose[j] - _curPose[j]).abs() > 1) {
        _curPose[j] = newPose[j];
        _curPoseMatrix[j] = _getPoseAngle(_curPose[j]);
        if (!poseChanged) poseChanged = true;
      }
    }
    if (poseChanged) {
      //改变姿态角
      vector.Matrix3 transformMatrix = rToLMatrix.clone()
        ..multiply(vector.Matrix3.fromList(_curPoseMatrix))
        ..multiply(rToLMatrix)
        ..multiply(xMatrix);
      Get.find<CubeController>().updatePitch(transformMatrix);
    }
  }

  ///状态信息协议
  void _statusInfoApi(int value) {
    switch (value) {
      case 0x20:
        Fluttertoast.showToast(msg: '传输数据过载');
        break;
      case 0xFA:
        Fluttertoast.showToast(msg: '低电量');
        break;
      case 0xFB:
        Fluttertoast.showToast(msg: '正常重启');
        break;
      case 0xFC:
        Fluttertoast.showToast(msg: '异常重启');
        break;
      case 0xFD:
        Fluttertoast.showToast(msg: 'G-Sensor异常');
        break;
      case 0xFE:
        Fluttertoast.showToast(msg: '霍尔元件异常');
        break;
      default:
        break;
    }
  }

  ///设备信息
  void _deviceInfoApi(List<int> info) {
    String resetReason = '';
    switch (info[0]) {
      case 0x01:
        resetReason = 'Reset from pin-reset detected';
        break;
      case 0x02:
        resetReason = 'Reset from watchdog detected';
        break;
      case 0x04:
        resetReason = 'Reset from soft reset detected';
        break;
      case 0x08:
        resetReason = 'Reset from CPU lock-up detected';
        break;
      default:
        resetReason = 'N/A';
        break;
    }
    String cubeModel = const Utf8Codec().decode(info.sublist(1, 6));
    String softwareVersion = info[6].toRadixString(16).split('').join('.');
    String hardwareVersion = info[7].toRadixString(16).split('').join('.');
    String compileTime =
        '${info[9] * 256 + info[8]}.${info[10]}.${info[11]} ${info[12]}:${info[13].toString().padLeft(2, '0')}';
    // _homeController.deviceInfoModel.set(
    //     softwareVersion: softwareVersion,
    //     hardwareVersion: hardwareVersion,
    //     resetReason: resetReason,
    //     cubeModel: cubeModel,
    //     compileTime: compileTime);
  }

  ///最近转动步骤查询-上位机下发
  void writeRotateIndexQueryApi(int index, int total) async {
    // int index = _orderNum.value;
    // int total = 255;
    print('index=$index, total=$total');
    print('objectList=${[0x68, 0x03, index % 256, index ~/ 256, total % 256, total ~/ 256]}');
    await _characteristic!
        .write([0x68, 0x03, index % 256, index ~/ 256, total % 256, total ~/ 256]);
  }

  ///最近转动步骤查询协议
  void _rotateIndexQueryApi(List<int> list) {
    print('List = $list');
    List<String> indexList = [];
    for (var e in list) {
      String str = e.toRadixString(2).padLeft(8, '0');
      indexList.add(_rotateIndexMap[str.substring(0, 4)] ?? 'N');
      indexList.add(_rotateIndexMap[str.substring(4)] ?? 'N');
    }
    print('查步indexList = $indexList');
  }

  ///电量上报协议
  void _powerApi(int value) {
    //_homeController.deviceInfoModel.set(power: value);
  }

  ///蓝牙配置协议-上位机下发
  void writeBluetoothConfigApi() async {
    await _characteristic!.write([0x68, 0x08, 0x00]);
  }

  ///蓝牙配置协议
  void _bluetoothConfigApi(int value) {
    if (value == 0x01) {
      Fluttertoast.showToast(msg: '关闭成功');
    } else if (value == 0xFF) {
      Fluttertoast.showToast(msg: '关闭失败');
    }
  }

  ///蓝牙配置协议-上位机下发
  ///Operation	        Data
  ///0x01：休眠时间	      0x00：1min
  ///                   0x01：30s
  ///                   0x02：10s
  ///0x02：休眠唤醒模式	  0x00：转动白色面唤醒
  ///                   0x01：抬起唤醒
  void writeLowEnergyConfigApi(int operation, int data) async {
    await _characteristic!.write([0x68, 0x09, operation, data]);
  }

  ///蓝牙配置协议
  void _lowEnergyConfigApi(int value) async {
    if (value == 0x01) {
      Fluttertoast.showToast(msg: '低功耗设置成功');
    } else if (value == 0xFF) {
      Fluttertoast.showToast(msg: '低功耗设置失败');
    }
  }

  //低功耗模式查询协议-上位机下发
  //0x01:休眠时间查询;0x02:休眠唤醒模式查询
  void writeLowEnergyConfigQueryApi(int operation) async {
    await _characteristic!.write([0x68, 0x0A, operation]);
  }

  ///低功耗模式查询协议
  void _lowEnergyConfigQueryApi(List<int> list) async {
    if (list[0] == 0x01) {
      // _DemoController.sleepTime.value = list[1];
      Fluttertoast.showToast(msg: '休眠时间${list[1]}');
    } else if (list[0] == 0x02) {
      // _DemoController.awakeMode.value = list[1];
      Fluttertoast.showToast(msg: '休眠唤醒模式${list[1]}');
    }
  }

  ///魔方重置协议-上位机下发
  void writeCubeResetApi(List<int> valueList) async {
    valueList.insert(0, 0x05);
    valueList.insert(0, 0x68);
    await _characteristic!.write(valueList);
    print('valueList=$valueList');
  }

  ///魔方重置协议
  void _cubeResetApi(int value) async {
    if (value == 0x01) {
      _needUpdateStatus = true;
      Fluttertoast.showToast(msg: '同步成功');
    } else if (value == 0xFF) {
      Fluttertoast.showToast(msg: '同步失败');
    }
  }

  ///绑定账号id协议-上位机下发 0-取消绑定 范围1～4294967296
  void writeBindIdApi(int value) async {
    await _characteristic!.write([0x68, 0x06, value]);
  }

  ///绑定账号id协议
  void _bindIdApi(int value) async {
    if (value == 0x01) {
      Fluttertoast.showToast(msg: '绑定成功');
    } else if (value == 0xFF) {
      Fluttertoast.showToast(msg: '绑定失败');
    }
  }

  ///魔方复原协议
  void _cubeRecoveredApi(List<int> list) async {
    print('t=${int.parse('0x${list.reversed.join("")}')}');
    eventBus.fire(SolvedEvent());
  }

  ///恢复出厂设置协议-上位机下发
  void writeFactoryResetApi() async {
    await _characteristic!.write([0x68, 0x0B, 0x01]);
  }

  ///恢复出厂设置协议
  void _factoryResetApi(int value) {
    if (value == 0x01) {
      Fluttertoast.showToast(msg: '恢复成功');
    } else if (value == 0xFF) {
      Fluttertoast.showToast(msg: '恢复失败');
    }
  }

  ///找到缺少的角块
  Corner _getMissedCor(List<Corner> cur) {
    List<Corner> cors = Corner.values.map((e) => e).toList();
    for (Corner element in cur) {
      cors.remove(element);
    }
    return cors.first;
  }

  ///找到缺少的棱块
  Edge _getMissedEdge(List<Edge> cur) {
    List<Edge> edges = Edge.values.map((e) => e).toList();
    for (Edge element in cur) {
      edges.remove(element);
    }
    return edges.first;
  }

  //姿态角数据解析
  double _getPoseAngle(int value) {
    int v = value.toSigned(8);
    return v / 120;
  }
}
