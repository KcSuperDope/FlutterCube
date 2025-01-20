import 'package:cubestation_flutter/utils/encrypt_utils.dart';
import 'package:get/get.dart';

class DeviceInfoModel {
  String deviceName = 'N/A';
  String deviceId = 'N/A';
  var power = 0.obs;
  String resetReason = 'N/A';
  String cubeModel = 'N/A';
  String softwareVersion = 'N/A';
  String hardwareVersion = 'N/A';
  String compileTime = 'N/A';
  List<int> macAddress = [];

  void set(
      {String? deviceName,
      String? deviceId,
      int? power,
      String? softwareVersion,
      String? hardwareVersion,
      String? resetReason,
      String? cubeModel,
      String? compileTime,
      List<int>? macAddress}) {
    if (deviceName != null) this.deviceName = deviceName;
    if (deviceId != null) this.deviceId = deviceId;
    if (power != null) this.power.value = power;
    if (softwareVersion != null) this.softwareVersion = softwareVersion;
    if (hardwareVersion != null) this.hardwareVersion = hardwareVersion;
    if (resetReason != null) this.resetReason = resetReason;
    if (cubeModel != null) this.cubeModel = cubeModel;
    if (compileTime != null) this.compileTime = compileTime;
    if (macAddress != null) {
      this.macAddress = macAddress;
      EncryptUtil.handleMac(macAddress);
    }
  }

  void clear() {
    deviceName = 'N/A';
    deviceId = 'N/A';
    power.value = 0;
    softwareVersion = 'N/A';
    hardwareVersion = 'N/A';
    resetReason = 'N/A';
    cubeModel = 'N/A';
    compileTime = 'N/A';
  }
}
