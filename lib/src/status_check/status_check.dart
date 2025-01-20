import 'package:cubestation_flutter/cube/cube.dart';
import 'package:cubestation_flutter/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'status_check_controller.dart';

class StatusCheckBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatusCheckController>(() => StatusCheckController());
  }
}

class StatusCheckDialog extends GetView<StatusCheckController> {
  const StatusCheckDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        contentPadding: EdgeInsets.zero,
        content: SizedBox(
          height: 500,
          width: 400,
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Obx(
                      () => controller.currentIndex.value == 1 ? _orientation() : _statusCheck())),
              Padding(
                  padding: const EdgeInsets.only(right: 8, top: 8),
                  child: IconButton(
                    onPressed: () => controller.start(),
                    icon: const Icon(Icons.close),
                    iconSize: 30,
                    alignment: Alignment.topRight,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _statusCheck() {
    return Column(
      children: [
        const Text(
          '魔方状态核对',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const Expanded(child: Cube()),
        const Text('请先确认魔方状态与实物一致'),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.STATUS_SYNC),
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(136, 40)),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)))),
              child: const Text('魔方同步'),
            ),
            ElevatedButton(
              onPressed: () => controller.nextStep(),
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(136, 40)),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)))),
              child: const Text('下一步'),
            )
          ],
        ),
        const SizedBox(height: 12),
        Text(
          '转动魔方，跳转至下一步',
          style: Get.textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        const Text('1/2'),
      ],
    );
  }

  Widget _orientation() {
    return Column(
      children: [
        const Text(
          '魔方朝向摆放',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Expanded(
            child: Image.asset(
          'assets/orientation.png',
          width: 260,
          height: 260,
        )),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: controller.lastStep,
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(136, 40)),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)))),
              child: const Text('上一步'),
            ),
            ElevatedButton(
              onPressed: () => controller.start(),
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(136, 40)),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)))),
              child: const Text('开始'),
            )
          ],
        ),
        const SizedBox(height: 12),
        Text(
          '转动魔方，立即开始',
          style: Get.textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        const Text('2/2'),
      ],
    );
  }
}
