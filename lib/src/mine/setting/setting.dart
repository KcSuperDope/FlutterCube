import 'package:cubestation_flutter/common/button.dart';
import 'package:cubestation_flutter/common/color.dart';
import 'package:cubestation_flutter/route/routes.dart';
import 'package:cubestation_flutter/src/mine/setting/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingController>(() => SettingController());
  }
}

class SettingPage extends GetView<SettingController> {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            _deviceInfoItem('语言设置', '中文', () {}),
            _deviceInfoItem('账号管理', '', () {
              Get.toNamed(Routes.ACCOUNT_MANAGE);
            }),
            _deviceInfoItem('清除缓存', '10.0M', () {}),
            _deviceInfoItem('用户协议', '', () {}),
            _deviceInfoItem('隐私协议', '', () {}),
            _firmwareInfoItem(),
            const Spacer(),
            ButtonUtils.filledButton(text: '退出登录', onPressed: controller.logout),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _firmwareInfoItem() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Text(
                '检查版本更新',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.normal, color: CSColors.primaryText),
              ),
            ),
            Expanded(
                child: Text('当前版本：V1.1.0beta',
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.normal, color: CSColors.secondaryText),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end)),
            if (controller.hasNewVersion)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: OutlinedButton(
                  onPressed: controller.updateFirmWare,
                  style: ButtonStyle(
                      side: MaterialStateProperty.all(BorderSide(color: CSColors.commonYellow)),
                      minimumSize: MaterialStateProperty.all(const Size(62, 30)),
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(34)))),
                  child: Text(
                    '更新',
                    style: TextStyle(
                        color: CSColors.commonYellow, fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            const SizedBox(width: 8),
            Icon(Icons.arrow_forward_ios, size: 12, color: CSColors.primaryText),
          ],
        ),
        Divider(height: 1, color: CSColors.divider)
      ],
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
