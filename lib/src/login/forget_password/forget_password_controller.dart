import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:cubestation_flutter/common/button.dart';
import 'package:cubestation_flutter/common/dialog.dart';
import 'package:cubestation_flutter/network/network_manager.dart';
import 'package:cubestation_flutter/network/proto_id.dart';
import 'package:cubestation_flutter/pb/code.pbenum.dart';
import 'package:cubestation_flutter/pb/login.pb.dart';
import 'package:cubestation_flutter/route/routes.dart';
import 'package:cubestation_flutter/src/login/login_controller.dart';
import 'package:cubestation_flutter/utils/eventbus_utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  String? phone, email, password, confirmPassword, vCode;
  String areaCode = '+86';
  var agree = false.obs;
  StreamSubscription? _getVCodeSubscription;
  StreamSubscription? _forgetPasswordSubscription;

  @override
  void onClose() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    _getVCodeSubscription?.cancel();
    _forgetPasswordSubscription?.cancel();
    super.onClose();
  }

  String? passwordValidator(String? value) {
    if (value == '') {
      return '请输入密码';
    }
    if (value!.length < 6 || value.length > 20) {
      return '请输入6-20位密码';
    }
    return null;
  }

  void passwordOnSaved(String? value) {
    password = value;
  }

  String? confirmPasswordValidator(String? value) {
    if (value == '') {
      return '请输入密码';
    }
    if (password != confirmPassword) {
      return '输入密码不一致';
    }
    return null;
  }

  void confirmPasswordOnSaved(String? value) {
    confirmPassword = value;
  }

  void confrim() {
    if (ButtonUtils.isDoubleClick()) {
      return;
    }

    if (formKey.currentState!.validate()) {
      ///只有输入的内容符合要求通过才会到达此处
      formKey.currentState?.save();

      _forgetPasswordSubscription = eventBus.on<ForgetPasswordEvent>().listen((event) {
        DialogUtils.hideLoading();
        s2c_forget_password forgetPassword = event.forgetPassword;
        if (forgetPassword.eCode == response_code.normal) {
          Fluttertoast.showToast(msg: '修改成功');
          Get.back();
        } else {
          Fluttertoast.showToast(msg: forgetPassword.eCode.name);
        }
        print('receviced forgetPassword:$forgetPassword');
        _forgetPasswordSubscription?.cancel();
      });
      vCode = '1234'; //测试使用验证码,正式环境删除
      var forgetPassword = c2s_forget_password.create();
      if (phone != null) forgetPassword.sPhoneNum = '${areaCode.substring(1)} $phone';
      if (email != null) forgetPassword.sEmail = email!;
      String generateMD5 = md5.convert(utf8.encode(password!)).toString();
      forgetPassword.sPassword = generateMD5;
      forgetPassword.iVCode = int.parse(vCode!);
      NetWorkManager().send(ProtoId.forgetPassword, forgetPassword);
      DialogUtils.showLoading();
      print(forgetPassword);
    }
  }

  bool getVCodeValitor() {
    if (Get.find<LoginController>().language.value == 'English') {
      if (email == null) {
        Fluttertoast.showToast(msg: '请输入邮箱');
        return false;
      }
      if (!GetUtils.isEmail(email!)) {
        Fluttertoast.showToast(msg: '请输入正确的邮箱');
        return false;
      }
    } else {
      if (phone == null) {
        Fluttertoast.showToast(msg: '请输入手机号');
        return false;
      }
      if (!GetUtils.isPhoneNumber(phone!)) {
        Fluttertoast.showToast(msg: '请输入正确的手机号');
        return false;
      }
    }

    return true;
  }

  Future<bool> getVCode() {
    if (Get.find<LoginController>().language.value == 'English') {
      if (email == null) {
        Fluttertoast.showToast(msg: '请输入邮箱');
        return Future.value(false);
      }
      if (!GetUtils.isEmail(email!)) {
        Fluttertoast.showToast(msg: '请输入正确的邮箱');
        return Future.value(false);
      }
    } else {
      if (phone == null) {
        Fluttertoast.showToast(msg: '请输入手机号');
        return Future.value(false);
      }
      if (!GetUtils.isPhoneNumber(phone!)) {
        Fluttertoast.showToast(msg: '请输入正确的手机号');
        return Future.value(false);
      }
    }
    _getVCodeSubscription = eventBus.on<ForgetPasswordGetVCodeEvent>().listen((event) {
      s2c_forget_password_get_v_code forgetPasswordGetVCode = event.forgetPasswordGetVCode;
      print('receviced forgetPasswordGetVCode:$forgetPasswordGetVCode');
      _getVCodeSubscription?.cancel();
    });

    var forgetPasswordGetVCode = c2s_forget_password_get_v_code.create();
    forgetPasswordGetVCode.sPhoneNum = phone == null ? '' : '${areaCode.substring(1)} $phone';
    forgetPasswordGetVCode.sEmail = email ?? '';
    NetWorkManager().send(ProtoId.forgetPasswordGetVCode, forgetPasswordGetVCode);
    Fluttertoast.showToast(msg: '验证码已发送');
    print(forgetPasswordGetVCode);
    return Future.value(true);
  }
}
