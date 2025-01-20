import 'package:app_settings/app_settings.dart';
import 'package:cubestation_flutter/common/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BleOffDialog extends StatelessWidget {
  const BleOffDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        height: 400,
        width: 400,
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.bluetooth_disabled,
                    size: 150.0,
                  ),
                  Text('手机蓝牙未开启', style: Get.textTheme.titleLarge),
                  const SizedBox(height: 40),
                  ButtonUtils.outlinedButton(
                      text: '前往开启',
                      onPressed: () {
                        AppSettings.openAppSettings(type: AppSettingsType.bluetooth);
                      }),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(right: 8, top: 8),
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.close),
                  iconSize: 30,
                  alignment: Alignment.topRight,
                ))
          ],
        ),
      ),
    );
  }
}
