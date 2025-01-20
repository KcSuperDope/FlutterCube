
import 'package:cubestation_flutter/src/challenge/challenge_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ChallengeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChallengeController>(() => ChallengeController());
  }
}

class ChallengePage extends GetView<ChallengeController> {
  const ChallengePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90,
        leading: IconButton(
          icon: Row(
            children: const [Icon(Icons.leaderboard), SizedBox(width: 4), Text('排行榜')],
          ),
          onPressed: () {},
        ),
        actions: [
          GestureDetector(
            child: Row(
              children: const [Text('AI 周报分析'), SizedBox(width: 12)],
            ),
            onTap: () {},
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          Text(
            '2023 M3赛季',
            style: Get.textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          Text('2023-03-01 至 2023-03-31'),
          const SizedBox(height: 30),
          Icon(
            Icons.emoji_events,
            size: 200,
          ),
          const SizedBox(height: 30),
          Text(
            '未上榜',
            style: Get.textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          Text('再进行 10局 排位对战可上榜'),
          const SizedBox(height: 12),
          Container(
            height: 40,
            width: double.infinity,
            color: Colors.grey,
            alignment: Alignment.center,
            child: Text('暂无成绩'),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
              onPressed: () {
                //controller.toPlay(0);
              },
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(180, 48)),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)))),
              child: Text('计时排位')),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () => controller.toPlay(1),
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size.fromHeight(60)),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)))),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                title: const SizedBox(width: 200, child: Text('计时练习')),
                subtitle: Text('练习过程不计入排位战绩', style: Get.textTheme.caption),
                leading: const Icon(Icons.leaderboard, size: 40),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
