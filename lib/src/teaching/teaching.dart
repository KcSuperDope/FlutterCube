import 'package:cubestation_flutter/common/color.dart';
import 'package:cubestation_flutter/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'teaching_controller.dart';

class TeachingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<TeachingController>(TeachingController());
  }
}

class TeachingPage extends GetView<TeachingController> {
  const TeachingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('闯关教学'),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/bg_teach.png'), fit: BoxFit.fill)),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 67, horizontal: 24),
                  child: Image.asset('assets/line1.png'),
                ),
                Column(
                  children: [
                    const SizedBox(height: 31),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _level(0),
                        _level(1),
                      ],
                    ),
                    const SizedBox(height: 48),
                    _level(2),
                    const SizedBox(height: 48),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _level(3),
                        _level(4),
                      ],
                    ),
                    const SizedBox(height: 48),
                    _level(5),
                    const SizedBox(height: 48),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _level(6),
                        _level(7),
                      ],
                    ),
                    const SizedBox(height: 48),
                    _level(8),
                    const SizedBox(height: 31)
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget _level(int level) {
    return GestureDetector(
      onTap: () {
        if (controller.list[level].lock) {
          Fluttertoast.showToast(msg: '暂未解锁');
          return;
        }
        Get.toNamed(Routes.TEACH_LEVEL, arguments: level);
      },
      child: Stack(
        children: [
          Container(
            width: 70,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: CSColors.primary,
            ),
            child: Column(
              children: [
                Container(
                    width: 70,
                    height: 70,
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: CSColors.auxiliary,
                    ),
                    child: Center(
                      child: Image.asset('assets/${controller.list[level].goalImage}.png',
                          width: 42, height: 42),
                    )),
                if (!controller.list[level].lock)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icon_star_active.png', width: 16, height: 16),
                      const SizedBox(width: 2),
                      Text(
                          '${controller.list[level].getStarCount}/${controller.list[level].allStarCount}')
                    ],
                  )
              ],
            ),
          ),
          if (controller.list[level].lock) _barrier()
        ],
      ),
    );
  }

  Widget _barrier() {
    return Container(
      width: 70,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromRGBO(40, 45, 49, 0.3),
      ),
      padding: EdgeInsets.only(top: 74),
      child: Center(child: Image.asset('assets/icon_lock.png', width: 16, height: 16)),
    );
  }
}
