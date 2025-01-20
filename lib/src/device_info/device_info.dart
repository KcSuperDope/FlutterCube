import 'package:cubestation_flutter/common/button.dart';
import 'package:cubestation_flutter/common/color.dart';
import 'package:cubestation_flutter/src/home/home_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'device_info_controller.dart';

class DeviceInfoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeviceInfoController>(() => DeviceInfoController());
  }
}

class DeviceInfoPage extends GetView<DeviceInfoController> {
  const DeviceInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设备信息'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            _deviceInfoItem('产品', 'GAN智能魔方'),
            _deviceInfoItem('型号', controller.deviceInfoModel.cubeModel),
            _deviceInfoItem('设备名称', controller.deviceInfoModel.deviceName),
            Obx(() => _deviceInfoItem('设备电量', '${controller.deviceInfoModel.power.value} %')),
            _firmwareInfoItem(),
            _deviceInfoItem('绑定状态', '未绑定'),
            if (kDebugMode) _deviceInfoItem('设备ID：', controller.deviceInfoModel.deviceId),
            if (kDebugMode) _deviceInfoItem('硬件版本：', controller.deviceInfoModel.hardwareVersion),
            if (kDebugMode) _deviceInfoItem('重启原因：', controller.deviceInfoModel.resetReason),
            if (kDebugMode) _deviceInfoItem('编译时间：', controller.deviceInfoModel.compileTime),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonUtils.outlinedButton(text: '断开连接', onPressed: controller.disconnect),
                ButtonUtils.filledButton(
                    text: '更换设备', onPressed: () => Get.find<HomeController>().connectDevice()),
              ],
            ),
            const Spacer(),
            SafeArea(
              child: GestureDetector(
                onTap: controller.factoryReset,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Text('恢复出厂设置'), Icon(Icons.cached)],
                ),
              ),
            )
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
                '固件版本',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.normal, color: CSColors.primaryText),
              ),
            ),
            Expanded(
                child: Text(controller.deviceInfoModel.softwareVersion,
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
          ],
        ),
        Divider(height: 1, color: CSColors.divider)
      ],
    );
  }

  Widget _deviceInfoItem(String label, String value) {
    return Column(
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
                        fontSize: 14, fontWeight: FontWeight.normal, color: CSColors.secondaryText),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end)),
          ],
        ),
        Divider(height: 1, color: CSColors.divider)
      ],
    );
  }
}
