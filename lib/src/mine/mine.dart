import 'package:cubestation_flutter/common/data_manager.dart';
import 'package:cubestation_flutter/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mine_controller.dart';

class MineBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MineController>(() => MineController());
  }
}

class MinePage extends GetView<MineController> {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.height * 0.4),
        child: SafeArea(
          child: Card(
            margin: EdgeInsets.zero,
            elevation: 3,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.account_circle,
                  size: 120,
                ),
                const SizedBox(height: 40),
                Obx(() => DataManager.accountInfo!.sNickName.isNotEmpty
                    ? Text(DataManager.accountInfo!.sNickName)
                    : ElevatedButton(
                        onPressed: () {
                          Get.toNamed(Routes.LOGIN);
                        },
                        style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(const Size(160, 40)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
                        child: const Text('前往登录'),
                      )),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          _listTile(Icons.leaderboard, '客服反馈', () {}),
          _listTile(Icons.leaderboard, '常见问题', () {}),
          _listTile(Icons.leaderboard, '设置', () {
            Get.toNamed(Routes.SETTING);
          })
        ],
      ),
    );
  }

  Widget _listTile(IconData leading, String title, VoidCallback onTap) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          title: SizedBox(width: 200, child: Text(title)),
          leading: const Icon(Icons.leaderboard, size: 30),
          minLeadingWidth: 30,
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: onTap,
        ),
      ],
    );
  }
}
