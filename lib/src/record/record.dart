import 'package:cubestation_flutter/common/button.dart';
import 'package:cubestation_flutter/common/color.dart';
import 'package:cubestation_flutter/route/routes.dart';
import 'package:cubestation_flutter/src/home/home_controller.dart';
import 'package:cubestation_flutter/src/record/bar_chart.dart';

import 'package:cubestation_flutter/src/record/line_chart.dart';
import 'package:cubestation_flutter/src/record/record_model.dart';
import 'package:cubestation_flutter/utils/time_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'record_controller.dart';

class RecordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecordController>(() => RecordController());
  }
}

class RecordPage extends GetView<RecordController> {
  const RecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('练习记录'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: '记录详情'),
              Tab(text: '成绩分布'),
              Tab(text: '折线图'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _recordDetail(),
            // CSBarChart(),
            BarChartSample4(),
            const CSLineChart(isShowingMainData: true),
          ],
        ),
      ),
    );
  }

  Widget _recordDetail() {
    return Column(
      children: [
        _recordHeader(),
        Expanded(
            child: ListView.builder(
                itemCount: controller.records.length,
                itemBuilder: (cxt, index) => _recordItem(controller.records[index]))),
      ],
    );
  }

  Widget _recordHeader() {
    return Container(
      color: CSColors.divider,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              '成绩',
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.normal, color: CSColors.primaryText),
            ),
          ),
          Expanded(
              child: Text(
            'TPS',
            style:
                TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: CSColors.primaryText),
          )),
          Expanded(
              child: Text(
            'AO5',
            style:
                TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: CSColors.primaryText),
          )),
          Expanded(
              child: Text(
            'AO12',
            style:
                TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: CSColors.primaryText),
          )),
          Expanded(
              child: Text(
            '时间',
            style:
                TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: CSColors.primaryText),
          )),
          Expanded(
              child: GestureDetector(
            onTap: () {},
            child: Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.help,
                size: 20,
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget _recordItem(RecordModel model) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder())),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        '${TimeUtils.formatSeconds(model.useTime!)}s',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: CSColors.primaryText),
                      ),
                    ),
                    Expanded(
                        child: Text(
                      model.tps,
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal, color: CSColors.primaryText),
                    )),
                    Expanded(
                        child: Text(
                      '${TimeUtils.formatSeconds(model.ao5!)}s',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal, color: CSColors.primaryText),
                    )),
                    Expanded(
                        child: Text(
                      '${TimeUtils.formatSeconds(model.ao12!)}s',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal, color: CSColors.primaryText),
                    )),
                    Expanded(
                        child: Text(
                      model.playTime!,
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal, color: CSColors.primaryText),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.REPLAY, arguments: model);
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.play_circle_rounded,
                          size: 30,
                        ),
                      ),
                    ))
                  ],
                ),
              ),
              Divider(height: 1, color: CSColors.divider)
            ],
          )),
    );
  }
}
