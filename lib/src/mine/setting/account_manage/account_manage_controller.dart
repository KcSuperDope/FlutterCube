import 'package:cubestation_flutter/common/data_manager.dart';
import 'package:cubestation_flutter/route/routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AccountManageController extends GetxController {
  void logOff() {
    DataManager.clearLoginModel();
    GetStorage localStorage = GetStorage();
    localStorage.remove('iUserID');
    localStorage.remove('iToken');
    Get.until((route) => Get.currentRoute == Routes.INITIAL);
  }
}
