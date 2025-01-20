import 'package:cubestation_flutter/common/button.dart';
import 'package:cubestation_flutter/common/color.dart';
import 'package:cubestation_flutter/src/login/login_controller.dart';
import 'package:cubestation_flutter/src/login/login_widget.dart';
import 'package:cubestation_flutter/src/login/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: Get.height * 0.4,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/bg_login.png'), fit: BoxFit.fill)),
        child: Stack(
          children: [
            Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 48),
                child: Text(
                  '账号注册',
                  style: TextStyle(
                      fontSize: 18.0, color: CSColors.auxiliary, fontWeight: FontWeight.normal),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 36, left: 8),
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    iconSize: 24,
                    icon: Icon(Icons.arrow_back_ios_new_rounded, color: CSColors.auxiliary))),
          ],
        ),
      ),
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
              Obx(() => Get.find<LoginController>().language.value == 'English'
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
              const SizedBox(height: 20.0),
              passwordTextField(
                  hintText: '再次确认密码',
                  validator: controller.confirmPasswordValidator,
                  onSaved: controller.confirmPasswordOnSaved),
              const SizedBox(height: 20.0),
              GetVCodeTextField(
                onSaved: (value) => controller.vCode = value,
                onSend: controller.registerGetVCode,
              ),
              const SizedBox(height: 55.0),
              _loginButton(),
              const Spacer(),
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
          onPressed: () {},
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

  Widget _loginButton() {
    return ButtonUtils.filledButton(
        text: '立即注册', width: Get.width * 0.7, onPressed: controller.register);
  }
}
