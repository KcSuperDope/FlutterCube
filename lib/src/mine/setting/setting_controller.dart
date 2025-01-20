import 'package:cubestation_flutter/common/data_manager.dart';
import 'package:cubestation_flutter/common/dialog.dart';
import 'package:cubestation_flutter/src/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {
  final double _firmwareLatestVersion = 4.7;
  bool get hasNewVersion => 4.7 < _firmwareLatestVersion;

  void logout() {
    DataManager.clearLoginModel();
    GetStorage localStorage = GetStorage();
    localStorage.remove('iUserID');
    localStorage.remove('iToken');
    Get.back();
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
