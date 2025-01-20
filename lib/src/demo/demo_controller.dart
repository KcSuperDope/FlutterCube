import 'dart:async';

import 'package:cubestation_flutter/network/network_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../handler/ble_data_handler.dart';

class DemoController extends GetxController {
  var sleepTime = 0.obs;
  var awakeMode = 0.obs;

  void rotateIndexQuery() async {
    List<BluetoothDevice> connectedDevices = await FlutterBluePlus.connectedDevices;
    if (connectedDevices.isNotEmpty) {
      //BleDataHandler().writeRotateIndexQueryApi();
    } else {
      Fluttertoast.showToast(msg: '未连接设备');
    }
  }

  void bindId() async {
    List<BluetoothDevice> connectedDevices = await FlutterBluePlus.connectedDevices;
    if (connectedDevices.isNotEmpty) {
      BleDataHandler().writeBindIdApi(1234567890);
    } else {
      Fluttertoast.showToast(msg: '未连接设备');
    }
  }

  void lowEnergyConfig() async {
    List<BluetoothDevice> connectedDevices = await FlutterBluePlus.connectedDevices;
    if (connectedDevices.isNotEmpty) {
      BleDataHandler().writeLowEnergyConfigQueryApi(0x01);
      // BleDataHandler().writeLowEnergyConfigQueryApi(0x02);
      // Get.dialog(_lowEnergyDialog());
    } else {
      Fluttertoast.showToast(msg: '未连接设备');
    }
  }

  void closeCubeBluetooth() async {
    List<BluetoothDevice> connectedDevices = await FlutterBluePlus.connectedDevices;
    if (connectedDevices.isNotEmpty) {
      BleDataHandler().writeBluetoothConfigApi();
    } else {
      Fluttertoast.showToast(msg: '未连接设备');
    }
  }

  Widget _lowEnergyDialog() {
    return AlertDialog(
        content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('休眠时间'),
        Row(children: [
          Obx(() => Radio(
              value: 0,
              groupValue: sleepTime.value,
              onChanged: (val) {
                sleepTime.value = val!;
                BleDataHandler().writeLowEnergyConfigApi(0x01, 0x00);
              })),
          const Text('1min')
        ]),
        Row(children: [
          Obx(() => Radio(
              value: 1,
              groupValue: sleepTime.value,
              onChanged: (val) {
                sleepTime.value = val!;
                BleDataHandler().writeLowEnergyConfigApi(0x01, 0x01);
              })),
          const Text('30s')
        ]),
        Row(children: [
          Obx(() => Radio(
              value: 2,
              groupValue: sleepTime.value,
              onChanged: (val) {
                sleepTime.value = val!;
                BleDataHandler().writeLowEnergyConfigApi(0x01, 0x02);
              })),
          const Text('10s')
        ]),
        const Text('休眠唤醒模式'),
        Row(children: [
          Obx(() => Radio(
              value: 0,
              groupValue: awakeMode.value,
              onChanged: (val) {
                awakeMode.value = val!;
                BleDataHandler().writeLowEnergyConfigApi(0x02, 0x00);
              })),
          const Text('抬起唤醒')
        ]),
        Row(children: [
          Obx(() => Radio(
              value: 1,
              groupValue: awakeMode.value,
              onChanged: (val) {
                awakeMode.value = val!;
                BleDataHandler().writeLowEnergyConfigApi(0x02, 0x01);
              })),
          const Text('转动白色面唤醒')
        ])
      ],
    ));
  }

  StreamSubscription? _subscription;

  @override
  void onInit() {
    NetWorkManager().initSocket();
    super.onInit();
  }

  @override
  void onClose() {
    _subscription?.cancel();
    NetWorkManager().dispose();
    super.onClose();
  }

  void test() {
    GetStorage localStorage = GetStorage();
    var iUserID = localStorage.read('iUserID');
    var iToken = localStorage.read('iToken');
    print('iUserID:$iUserID;iToken:$iToken');
  }
}
