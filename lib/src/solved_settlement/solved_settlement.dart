import 'package:cubestation_flutter/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'solved_settlement_controller.dart';

class SolvedSettlementBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SolvedSettlementController>(() => SolvedSettlementController());
  }
}

class SolvedSettlementPage extends GetView<SolvedSettlementController> {
  const SolvedSettlementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('计时练习'),
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () {
                  Get.until((route) => Get.currentRoute == Routes.INITIAL);
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    '复原完成',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/cube.png',
                        width: Get.width * 0.7,
                        height: Get.width * 0.7,
                      )),
                  const SizedBox(height: 20),
                  Text(
                    controller.time,
                    style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // const SizedBox(height: 20),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: const [
                  //     Text('步数：53'),
                  //     Text('TPS：11.1'),
                  //   ],
                  // ),
                  const SizedBox(height: 80),
                  ElevatedButton(
                    onPressed: controller.playAgain,
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(const Size(160, 40)),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
                    child: const Text('再次挑战'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
