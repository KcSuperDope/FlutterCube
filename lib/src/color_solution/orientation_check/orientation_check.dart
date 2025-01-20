import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'orientation_check_controller.dart';

class OrientationCheckBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrientationCheckController>(() => OrientationCheckController());
  }
}

class OrientationCheckDialog extends GetView<OrientationCheckController> {
  const OrientationCheckDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        contentPadding: EdgeInsets.zero,
        content: SizedBox(
          height: 480,
          width: 400,
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Padding(padding: const EdgeInsets.all(16.0), child: _orientation()),
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
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => controller.start(),
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(200, 40)),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)))),
              child: const Text('开始'),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
