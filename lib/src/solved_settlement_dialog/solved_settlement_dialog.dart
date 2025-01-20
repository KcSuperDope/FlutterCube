import 'package:cubestation_flutter/common/button.dart';
import 'package:cubestation_flutter/common/color.dart';
import 'package:cubestation_flutter/src/record/record_model.dart';
import 'package:cubestation_flutter/src/solved_settlement_dialog/solved_settlement_dialog_controller.dart';
import 'package:cubestation_flutter/src/teaching/teaching_model.dart';
import 'package:cubestation_flutter/src/teaching/teaching_widget.dart';
import 'package:cubestation_flutter/src/teaching_dialog/teach_cube/teach_cube.dart';
import 'package:cubestation_flutter/utils/time_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zflutter/zflutter.dart';

class SolvedSettlementDialog extends StatelessWidget {
  SolvedSettlementDialog({Key? key}) : super(key: key);
  final SolvedSettlementDialogController controller = Get.put(SolvedSettlementDialogController());

  @override
  Widget build(BuildContext context) {
    controller.record = Get.arguments;
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
        height: Get.height * 0.68,
        width: Get.width * 0.8,
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            _content(),
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 8.0),
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.close),
                iconSize: 30,
                alignment: Alignment.topRight,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _content() {
    return Column(
      children: [
        const SizedBox(height: 16),
        Container(
          alignment: Alignment.center,
          child: const Text(
            '复原完成',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: Get.width * 0.6,
          padding: EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
              border: Border.all(color: CSColors.primary), borderRadius: BorderRadius.circular(24)),
          child: Text(
            TimeUtils.formatTime(controller.record.useTime!),
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: CSColors.primary),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'TPS：${controller.record.tps}',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
            ),
            Text(
              '步数：${controller.record.steps}',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          color: Color(0xFF999999),
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '步骤明细',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
              ),
              MenuAnchor(
                builder: (BuildContext context, MenuController menuController, Widget? child) {
                  return TextButton(
                    onPressed: () {
                      // if (menuController.isOpen) {
                      //   menuController.close();
                      // } else {
                      //   menuController.open();
                      // }
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() => Text(
                              controller.method.value,
                              style: TextStyle(
                                  color: CSColors.primaryText,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal),
                            )),
                        Icon(Icons.keyboard_arrow_down_rounded,
                            size: 24, color: CSColors.primaryText),
                      ],
                    ),
                  );
                },
                menuChildren: controller.methods
                    .map((e) => MenuItemButton(
                          onPressed: () {
                            controller.method.value = e;
                          },
                          child: MenuAcceleratorLabel(e),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
        _recordDetail(),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _recordDetail() {
    return Expanded(
      child: Column(
        children: [
          _recordHeader(),
          Expanded(
              child: Obx(() => Column(
                  children: controller.method.value == 'CFOP'
                      ? _cfopsList(controller.record.cfops!)
                      : _layersList(controller.record.layers!)))),
        ],
      ),
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
              '',
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.normal, color: CSColors.primaryText),
            ),
          ),
          Expanded(
              flex: 2,
              child: Text(
                '步骤',
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.normal, color: CSColors.primaryText),
              )),
          Expanded(
              flex: 2,
              child: Text(
                'TPS',
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.normal, color: CSColors.primaryText),
              )),
          Expanded(
              flex: 2,
              child: Text(
                '步数',
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.normal, color: CSColors.primaryText),
              )),
          Expanded(
              flex: 2,
              child: Text(
                '成绩',
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.normal, color: CSColors.primaryText),
              )),
        ],
      ),
    );
  }

  List<Widget> _cfopsList(List<MethodModel> list) {
    return [
      _recordItem('C', '1_3', list[0]),
      _recordItem('F', '3_2', list[1]),
      _recordItem('O', '5_2', list[2]),
      _recordItem('P', '7_2', list[3])
    ];
  }

  List<Widget> _layersList(List<MethodModel> list) {
    return [
      _recordItem('C', '1_3', list[0]),
      _recordItem('F', '3_2', list[1]),
      _recordItem('O', '5_2', list[2]),
      _recordItem('P', '7_2', list[3])
    ];
  }

  Widget _recordItem(String step, String stepImage, MethodModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    step,
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.normal, color: CSColors.primaryText),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    'assets/$stepImage.png',
                    width: 36,
                    height: 36,
                    alignment: Alignment.centerLeft,
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Text(
                      model.tps,
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal, color: CSColors.primaryText),
                    )),
                Expanded(
                    flex: 2,
                    child: Text(
                      '${model.steps}步',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal, color: CSColors.primaryText),
                    )),
                Expanded(
                    flex: 2,
                    child: Text(
                      '${TimeUtils.formatSeconds(model.useTime!)}s',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal, color: CSColors.primaryText),
                    )),
              ],
            ),
          ),
          Divider(height: 1, color: CSColors.divider)
        ],
      ),
    );
  }
}
