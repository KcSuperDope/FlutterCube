import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'skin_controller.dart';
import 'skin_cube/skin_cube.dart';

class SkinBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SkinController>(() => SkinController());
  }
}

class SkinPage extends GetView<SkinController> {
  const SkinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('魔块贴图'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFE7F1FA), Color.fromRGBO(230, 239, 245, 0)])),
        child: _content(),
      ),
    );
  }

  Widget _content() {
    return const Column(
      children: [
        SizedBox(height: 16),
        Expanded(child: SkinCube()),
        SizedBox(height: 16),
      ],
    );
  }
}
