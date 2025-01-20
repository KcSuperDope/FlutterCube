import 'package:cubestation_flutter/cube/box/box.dart';
import 'package:cubestation_flutter/cube/cube_constant.dart';
import 'package:cubestation_flutter/main.dart';
import 'package:cubestation_flutter/src/skin/paste/paste_box/paste_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zflutter/zflutter.dart';
import 'paste_controller.dart';

class PasteBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasteController>(() => PasteController());
  }
}

class PastePage extends GetView<PasteController> {
  const PastePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => appOrientation.value == Orientation.landscape ? _landscape() : _portrait());
  }

  Widget _portrait() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('魔块贴图'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Expanded(child: _cube()),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _rotateButton(Icons.swipe_left, controller.turnLeft),
              _rotateButton(Icons.swipe_vertical, controller.turnUpDown),
              _rotateButton(Icons.swipe_right, controller.turnRight)
            ],
          ),
          const SizedBox(height: 40),
          const Text('请点击魔方对应色块位置完成贴图'),
          const SizedBox(height: 10),
          _selectColorItems(),
          const SizedBox(height: 40),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: controller.toSkin,
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(200, 50)),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)))),
              child: const Text('生成魔方'),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _landscape() {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(height: double.infinity, width: Get.width * 0.4, child: _cube()),
          Column(
            children: [
              const SizedBox(height: 60),
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _rotateButton(Icons.swipe_left, controller.turnLeft),
                          const SizedBox(width: 36),
                          _rotateButton(Icons.swipe_vertical, controller.turnUpDown),
                          const SizedBox(width: 36),
                          _rotateButton(Icons.swipe_right, controller.turnRight)
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text('请点击魔方对应色块位置完成贴图'),
              _selectColorItems(),
              const SizedBox(height: 6),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: controller.toSkin,
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(const Size(200, 50)),
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)))),
                  child: const Text('生成魔方'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cube() {
    return AnimatedBuilder(
        animation: controller.animationController,
        builder: (context, _) {
          return ZIllustration(zoom: 1.5, children: [
            ZPositioned(
              rotate: ZVector(
                  controller.rotateXAnimation?.value, controller.rotateYAnimation?.value, 0),
              child: ZGroup(
                children: [
                  ZPositioned(
                    child: ZHemisphere(diameter: boxOffset * 3, color: Colors.black),
                  ),
                  ZPositioned(
                    rotate: const ZVector.only(y: tau / 2),
                    child: ZHemisphere(diameter: boxOffset * 3, color: Colors.black),
                  ),
                  ZGroup(children: controller.boxs.map((e) => PasteBox(boxModel: e)).toList()),
                ],
              ),
            )
          ]);
        });
  }

  Widget _rotateButton(IconData iconData, VoidCallback onPressed) {
    return IconButton(
      iconSize: 60,
      icon: Icon(iconData),
      onPressed: onPressed,
    );
  }

  Widget _selectColorItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _imageList(),
        _triangle(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Obx(() => CupertinoSlidingSegmentedControl<ImageModel>(
                  backgroundColor: CupertinoColors.systemGrey4,
                  thumbColor: const Color(0xff007ba7),
                  groupValue: controller.selectedSegment.value,
                  onValueChanged: controller.onColorChanged,
                  children: <ImageModel, Widget>{
                    controller.UColorItem: _selectColorItem(controller.UColorItem),
                    controller.FColorItem: _selectColorItem(controller.FColorItem),
                    controller.DColorItem: _selectColorItem(controller.DColorItem),
                    controller.BColorItem: _selectColorItem(controller.BColorItem),
                    controller.RColorItem: _selectColorItem(controller.RColorItem),
                    controller.LColorItem: _selectColorItem(controller.LColorItem),
                  })),
        ),
      ],
    );
  }

  Widget _selectColorItem(ImageModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Card(
          color: model.color,
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: SizedBox(width: 50, height: 50, child: Image.asset(model.image.value))),
    );
  }

  Widget _imageList() {
    return Obx(() => Container(
          width: appOrientation.value == Orientation.landscape ? Get.width * 0.5 : Get.width,
          height: 50,
          color: CupertinoColors.systemGrey4,
          padding: EdgeInsets.all(6),
          alignment: Alignment.centerLeft,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: controller.selectedSegment.value.images
                  .map((e) => GestureDetector(
                      onTap: () {
                        controller.selectedSegment.value.image.value = e;
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: controller.selectedSegment.value.color,
                              borderRadius: BorderRadius.circular(4)),
                          width: 42,
                          height: 42,
                          margin: EdgeInsets.only(right: 6),
                          child: Image.asset(e))))
                  .toList()),
        ));
  }

  Widget _triangle() {
    int i;
    if (controller.selectedSegment.value.color == UColor) {
      i = 0;
    } else if (controller.selectedSegment.value.color == DColor) {
      i = 2;
    } else if (controller.selectedSegment.value.color == BColor) {
      i = 3;
    } else if (controller.selectedSegment.value.color == RColor) {
      i = 4;
    } else if (controller.selectedSegment.value.color == LColor) {
      i = 5;
    } else {
      i = 1;
    }

    return Obx(() {
      double offset;
      if (appOrientation.value == Orientation.landscape) {
        offset = 25 + Get.width * 0.5 * i / 6;
      } else {
        offset = 25 + Get.width * i / 6;
      }
      return Container(
        width: 24,
        height: 12,
        margin: EdgeInsets.only(left: offset),
        decoration: const BoxDecoration(
          border: Border(
            top:
                BorderSide(color: CupertinoColors.systemGrey4, width: 12, style: BorderStyle.solid),
            right: BorderSide(color: Colors.transparent, width: 12, style: BorderStyle.solid),
            left: BorderSide(color: Colors.transparent, width: 12, style: BorderStyle.solid),
          ),
        ),
      );
    });
  }
}
