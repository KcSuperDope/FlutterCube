import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:cubestation_flutter/common/button.dart';
import 'package:cubestation_flutter/common/color.dart';
import 'package:cubestation_flutter/common/dialog.dart';
import 'package:cubestation_flutter/network/network_manager.dart';
import 'package:cubestation_flutter/network/proto_id.dart';
import 'package:cubestation_flutter/pb/code.pbenum.dart';
import 'package:cubestation_flutter/pb/login.pb.dart';
import 'package:cubestation_flutter/route/routes.dart';
import 'package:cubestation_flutter/utils/eventbus_utils.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  String? phone, email, password;
  var agree = false.obs;
  String areaCode = '+86';
  StreamSubscription? _subscription;
  static const PRIVATE_KEY = 'UEFTU1dPUkRfS0VZ'; //密码加密密钥
  var language = '简体中文'.obs;
  List<String> languages = ['简体中文', 'English'];

  @override
  void onClose() {
    _subscription?.cancel();
    FocusScope.of(Get.context!).requestFocus(FocusNode());
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

  void login() {
    if (ButtonUtils.isDoubleClick()) {
      return;
    }
    if (!agree.value) {
      Fluttertoast.showToast(msg: '请同意用户协议与隐私条款');
      return;
    }

    if (formKey.currentState!.validate()) {
      ///只有输入的内容符合要求通过才会到达此处
      formKey.currentState?.save();

      _subscription = eventBus.on<LoginPasswordEvent>().listen((event) {
        DialogUtils.hideLoading();
        s2c_login_password loginPassword = event.loginPassword;
        print('receviced loginPassword:$loginPassword');
        if (loginPassword.eCode == response_code.normal) {
          Fluttertoast.showToast(msg: '登录成功');
          Get.back();
        } else {
          Fluttertoast.showToast(msg: loginPassword.eCode.name);
        }
        _subscription?.cancel();
      });
      var loginPassword = c2s_login_password.create();
      if (phone != null) loginPassword.sPhoneNum = '${areaCode.substring(1)} $phone';
      if (email != null) loginPassword.sEmail = email!;
      int loginTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      String passwordMD5 = md5.convert(utf8.encode(password!)).toString();
      String generateMD5 =
          md5.convert(utf8.encode(passwordMD5 + loginTime.toString() + PRIVATE_KEY)).toString();
      print(passwordMD5 + loginTime.toString() + PRIVATE_KEY);
      loginPassword.sPassword = generateMD5;
      loginPassword.iLoginTime = loginTime;
      loginPassword.iChannelID = 0;
      NetWorkManager().send(ProtoId.loginPassword, loginPassword);
      DialogUtils.showLoading();
      print(loginPassword);
    }
  }

  void toRegister() {
    Get.toNamed(Routes.REGISTER);
  }

  void toForgetPassword() {
    Get.toNamed(Routes.FORGET_PASSWORD);
  }

  void toPrivacy() {
    DialogUtils.twoButton(
        title: '用户协议',
        height: Get.height * 0.4,
        contentView: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '感谢您选择魔方星球极速版！',
                style: TextStyle(color: Color(0xFF666666)),
              ),
              EasyRichText(
                '我们非常重视您的个人信息和隐私保护。为了更好地保障您的个人权益，在使用我们的服务前，请务必打开链接并审慎阅读《魔方星球（CubeStation）许可及服务协议》、《魔方星球 （Cube Station）隐私条款》和《魔方星球（Cube Station）儿童个人信息保护指引》的全部内容，同意并接受全部条款后方可开始使用我们的服务。',
                defaultStyle: const TextStyle(color: Color(0xFF666666)),
                patternList: [
                  EasyRichTextPattern(
                      targetString: '《魔方星球（CubeStation）许可及服务协议》',
                      style: TextStyle(
                          fontSize: 14.0, color: CSColors.primary, fontWeight: FontWeight.normal),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => _launchUrl(
                            'https://gz.cube.ganrobot.com/manage/protocol/WebUserProto_cn.html')),
                  EasyRichTextPattern(
                      targetString: '《魔方星球 （Cube Station）隐私条款》',
                      style: TextStyle(
                          fontSize: 14.0, color: CSColors.primary, fontWeight: FontWeight.normal),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => _launchUrl(
                            'https://gz.cube.ganrobot.com/manage/protocol/WebPrivacyPolicy_cn.html')),
                  EasyRichTextPattern(
                      targetString: '《魔方星球（Cube Station）儿童个人信息保护指引》',
                      style: TextStyle(
                          fontSize: 14.0, color: CSColors.primary, fontWeight: FontWeight.normal),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => _launchUrl(
                            'https://gz.cube.ganrobot.com/manage/protocol/WebChildren_cn.html')),
                ],
              ),
            ],
          ),
        ),
        textCancel: '拒绝',
        textConfirm: '同意',
        onCancel: () async {
          await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        });
  }

  void _launchUrl(String url) async {
    // if (!await launchUrl(
    //   Uri.parse(url),
    //   mode: LaunchMode.externalApplication,
    // )) {
    //   throw Exception('Could not launch $url');
    // }
  }
}
