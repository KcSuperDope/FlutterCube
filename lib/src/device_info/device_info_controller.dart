import 'package:cubestation_flutter/common/dialog.dart';
import 'package:cubestation_flutter/handler/ble_data_handler.dart';
import 'package:cubestation_flutter/src/device_info/device_info_model.dart';
import 'package:cubestation_flutter/src/home/home_controller.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class DeviceInfoController extends GetxController {
  late DeviceInfoModel deviceInfoModel;
  final double _firmwareLatestVersion = 4.7;
  bool get hasNewVersion => double.parse(deviceInfoModel.softwareVersion) < _firmwareLatestVersion;

  @override
  void onInit() {
    deviceInfoModel = Get.find<HomeController>().deviceInfoModel;
    super.onInit();
  }

  void connectDevice() {}

  void factoryReset() async {
    BleDataHandler().writeFactoryResetApi();
  }

  void disconnect() async {
    List<BluetoothDevice> connectedDevices = await FlutterBluePlus.connectedDevices;
    if (connectedDevices.isNotEmpty) {
      BluetoothDevice device = connectedDevices.first;
      Fluttertoast.showToast(msg: '正在断开连接ing');
      await device.disconnect();
      Get.back();
    }
  }

  void updateFirmWare() {
    DialogUtils.twoButton(
        title: '固件升级',
        content: '是否将固件版本升级至V$_firmwareLatestVersion',
        onConfirm: () {
          Get.back();
          Get.find<HomeController>().doDfu();
        });
  }
}
