
import 'package:cubestation_flutter/cube/cube.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'demo_controller.dart';

class DemoPage extends StatelessWidget {
  final DemoController controller = Get.put(DemoController());

  DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CubeStation极速版'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () => controller.closeCubeBluetooth(), child: const Text('关闭魔方蓝牙')),
              ElevatedButton(onPressed: () => controller.bindId(), child: const Text('绑定账号id')),
              ElevatedButton(
                  onPressed: () => controller.lowEnergyConfig(), child: const Text('低功耗配置')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () => controller.rotateIndexQuery(), child: const Text('最近转动步骤查询')),
            ],
          ),
          ElevatedButton(onPressed: () => controller.test(), child: const Text('测试')),
          const Expanded(child: Cube())
        ],
      ),
    );
  }
}
