import 'package:cubestation_flutter/common/button.dart';
import 'package:cubestation_flutter/common/color.dart';
import 'package:cubestation_flutter/src/mine/setting/account_manage/account_manage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountManageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountManageController>(() => AccountManageController());
  }
}

class AccountManagePage extends GetView<AccountManageController> {
  const AccountManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('账号管理'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            _deviceInfoItem('修改密码', '', () {}),
            _deviceInfoItem('绑定手机号', '', () {}),
            _deviceInfoItem('绑定微信', '', () {}),
            _deviceInfoItem('绑定QQ', '', () {}),
            const Spacer(),
            ButtonUtils.filledButton(text: '注销账号', onPressed: controller.logOff),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _deviceInfoItem(String label, String value, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Text(
                  label,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.normal, color: CSColors.primaryText),
                ),
              ),
              Expanded(
                  child: Text(value,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: CSColors.secondaryText),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end)),
              const SizedBox(width: 8),
              Icon(Icons.arrow_forward_ios, size: 12, color: CSColors.primaryText),
            ],
          ),
          Divider(height: 1, color: CSColors.divider)
        ],
      ),
    );
  }
}
