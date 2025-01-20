import 'package:fixnum/fixnum.dart';
import 'package:cubestation_flutter/network/network_manager.dart';
import 'package:cubestation_flutter/network/proto_id.dart';
import 'package:cubestation_flutter/pb/login.pbserver.dart';
import 'package:cubestation_flutter/route/routes.dart';
import 'package:cubestation_flutter/src/challenge/challenge.dart';
import 'package:cubestation_flutter/src/home/home.dart';
import 'package:cubestation_flutter/src/mine/mine.dart';
import 'package:cubestation_flutter/src/teaching/teaching.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InitialController extends GetxController {
  var currentIndex = 0.obs;

  List pageList = [const HomePage(), const TeachingPage(), const ChallengePage(), const MinePage()];

  @override
  void onInit() {
    // NetWorkManager().initSocket();
    // loginDelegate();
    super.onInit();
  }

  @override
  void onClose() {
    // NetWorkManager().dispose();
    super.onClose();
  }

  void loginDelegate() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      GetStorage localStorage = GetStorage();
      var iUserID = localStorage.read('iUserID');
      var iToken = localStorage.read('iToken');
      print('iUserID:$iUserID;iToken:$iToken');
      if (iUserID == null || iToken == null) {
        Get.toNamed(Routes.LOGIN);
      } else {
        var tokenLogin = c2s_token_login.create();
        tokenLogin.iUserID = Int64.parseInt(iUserID.toString());
        tokenLogin.iToken = iToken;
        NetWorkManager().send(ProtoId.tokenLogin, tokenLogin);
      }
    });
  }
}
