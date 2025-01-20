import 'package:cubestation_flutter/route/routes.dart';
import 'package:cubestation_flutter/src/initial/initial.dart';
import 'package:cubestation_flutter/src/timing_play/timing_play_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DnfPage extends StatelessWidget {
  final VoidCallback? onTapAgain = Get.arguments;
  DnfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('DNF'),
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
                const Text(
                  'DNF',
                  style: TextStyle(fontSize: 48),
                ),
                const SizedBox(height: 40),
                ElevatedButton(onPressed: onTapAgain, child: const Text('再次挑战')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
