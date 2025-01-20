import 'package:cubestation_flutter/common/button.dart';
import 'package:cubestation_flutter/common/color.dart';
import 'package:cubestation_flutter/src/login/login_controller.dart';
import 'package:cubestation_flutter/src/login/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      resizeToAvoidBottomInset: false,
      body: Container(
          height: Get.height * 0.4,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/bg_login.png'), fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.only(top: 48, left: 16, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MenuAnchor(
                  builder: (BuildContext context, MenuController menuController, Widget? child) {
                    return OutlinedButton(
                      onPressed: () {
                        if (menuController.isOpen) {
                          menuController.close();
                        } else {
                          menuController.open();
                        }
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                          minimumSize: MaterialStateProperty.all(const Size(96, 30)),
                          side: MaterialStateProperty.all(BorderSide(color: CSColors.auxiliary)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => Text(
                                controller.language.value,
                                style: TextStyle(
                                    color: CSColors.auxiliary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              )),
                          Icon(Icons.keyboard_arrow_down_rounded,
                              size: 20, color: CSColors.auxiliary),
                        ],
                      ),
                    );
                  },
                  menuChildren: controller.languages
                      .map((e) => MenuItemButton(
                            onPressed: () {
                              controller.language.value = e;
                            },
                            child: MenuAcceleratorLabel(e),
                          ))
                      .toList(),
                ),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Image.asset(
                      'assets/icon_close.png',
                      width: 24,
                      height: 24,
                    ))
              ],
            ),
          )),
      bottomSheet: _bottomSheet(),
    );
  }

  Widget _bottomSheet() {
    return Container(
        decoration: BoxDecoration(
            color: CSColors.auxiliary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        height: Get.height * 0.7,
        alignment: Alignment.bottomCenter,
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              const SizedBox(height: 33.0),
              Obx(() => controller.language.value == 'English'
                  ? emailTextField(
                      onSaved: (value) => controller.email = value!,
                      onChanged: (value) => controller.email = value!,
                    )
                  : PhoneTextField(
                      onSaved: (value) => controller.phone = value!,
                      onChanged: (value) => controller.phone = value!,
                      onSelectAreaCode: (value) => controller.areaCode = value!,
                    )),
              const SizedBox(height: 20.0),
              passwordTextField(
                  hintText: '请输入密码',
                  validator: controller.passwordValidator,
                  onSaved: controller.passwordOnSaved),
              const SizedBox(height: 7.0),
              _registerAndForget(),
              _loginButton(),
              const Spacer(),
              _buildOtherMethod(),
              const SizedBox(height: 20.0),
              _agreeMent(),
              const SizedBox(height: 20.0),
            ],
          ),
        ));
  }

  Widget _agreeMent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => Radio(
            activeColor: CSColors.primary,
            value: true,
            toggleable: true,
            groupValue: controller.agree.value,
            onChanged: (value) => controller.agree.value = !controller.agree.value)),
        Text(
          '我已详细阅读并同意',
          style: TextStyle(
              fontSize: 14.0, color: CSColors.secondaryText, fontWeight: FontWeight.normal),
        ),
        TextButton(
          onPressed: controller.toPrivacy,
          style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
          child: Text(
            '《用户协议与隐私协议》',
            style:
                TextStyle(fontSize: 14.0, color: CSColors.primary, fontWeight: FontWeight.normal),
          ),
        )
      ],
    );
  }

  ButtonBar _buildOtherMethod() {
    return ButtonBar(alignment: MainAxisAlignment.center, children: [
      Column(
        children: [
          IconButton(
              icon: Image.asset('assets/icon_wechat.png', width: 44, height: 44), onPressed: () {}),
          Text(
            '微信',
            style: TextStyle(
                fontSize: 14.0, color: CSColors.primaryText, fontWeight: FontWeight.normal),
          ),
        ],
      ),
      const SizedBox(width: 20),
      Column(
        children: [
          IconButton(
              icon: Image.asset('assets/icon_qq.png', width: 44, height: 44), onPressed: () {}),
          Text(
            'QQ',
            style: TextStyle(
                fontSize: 14.0, color: CSColors.primaryText, fontWeight: FontWeight.normal),
          ),
        ],
      )
    ]);
  }

  Widget _loginButton() {
    return ButtonUtils.filledButton(
        text: '登录', width: Get.width * 0.7, onPressed: controller.login);
  }

  Widget _registerAndForget() {
    return SizedBox(
      width: Get.width * 0.7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: controller.toRegister,
            child: Text(
              '注册账号',
              style:
                  TextStyle(fontSize: 14.0, color: CSColors.primary, fontWeight: FontWeight.normal),
            ),
          ),
          TextButton(
            onPressed: controller.toForgetPassword,
            child: Text(
              '忘记密码',
              style:
                  TextStyle(fontSize: 14.0, color: CSColors.primary, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
