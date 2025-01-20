import 'package:cubestation_flutter/common/color.dart';
import 'package:cubestation_flutter/src/teaching/teaching_model.dart';
import 'package:cubestation_flutter/src/teaching/teaching_widget.dart';
import 'package:cubestation_flutter/src/teaching_level/teaching_level_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PassRecord extends StatelessWidget {
  final TeachingLevelController _teachingLevelController = Get.find<TeachingLevelController>();
  PassRecord({super.key});

  @override
  Widget build(BuildContext context) {
    List<TeachingModel> list = _teachingLevelController.list;
    return Scaffold(
      appBar: AppBar(title: const Text('通关记录'), centerTitle: true),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/bg_teach.png'), fit: BoxFit.fill)),
          padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 21),
          child: Column(
              children: list.asMap().keys.map((i) {
            return i < 3 ? _levelPassRecord(list[i]) : const SizedBox();
          }).toList()),
        ),
      ),
    );
  }

  Widget _levelTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 1,
          width: Get.width * 0.2,
          color: CSColors.divider,
        ),
        Text(
          title,
          style:
              TextStyle(color: CSColors.primaryText, fontSize: 16, fontWeight: FontWeight.normal),
        ),
        Container(
          height: 1,
          width: Get.width * 0.2,
          color: CSColors.divider,
        ),
      ],
    );
  }

  Widget _levelPassRecord(TeachingModel model) {
    return Container(
      decoration: BoxDecoration(
          color: CSColors.auxiliary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(offset: Offset(0, 4), blurRadius: 4, color: Color.fromRGBO(41, 162, 255, 0.3))
          ]),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          const SizedBox(height: 11),
          _levelTitle(model.level!),
          const SizedBox(height: 3),
          Column(
            children: model.teachingDialogModels!.map((m) {
              return Container(
                  width: Get.width,
                  height: 88,
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                      color: CSColors.commonLightBlue, borderRadius: BorderRadius.circular(20)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: m.teachingDialogItemModels!.length > 3
                          ? _answer(m.teachingDialogItemModels!.first.getStarCount)
                          : m.teachingDialogItemModels!
                              .map((item) => levelItemCard(item.statusImage!, item.getStarCount))
                              .toList()));
            }).toList(),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  List<Widget> _answer(int getStarCount) {
    return [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/${getStarCount >= 1 ? 'icon_star_active' : 'icon_star_inactive'}.png',
              width: 48, height: 48),
          Text('答对4题')
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/${getStarCount >= 2 ? 'icon_star_active' : 'icon_star_inactive'}.png',
              width: 48, height: 48),
          Text('答对5题')
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/${getStarCount == 3 ? 'icon_star_active' : 'icon_star_inactive'}.png',
              width: 48, height: 48),
          Text('答对6题')
        ],
      ),
    ];
  }
}
