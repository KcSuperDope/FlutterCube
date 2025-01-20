import 'package:cubestation_flutter/pb/login.pb.dart';
import 'package:cubestation_flutter/pb/message.pb.dart';
import 'package:get/get.dart';

class DataManager {
  static var loginModel = s2c_login_success().obs;
  static msg_account_info? get accountInfo => loginModel.value.mAccountInfo;

  static void clearLoginModel() {
    loginModel.value = s2c_login_success();
  }
}
