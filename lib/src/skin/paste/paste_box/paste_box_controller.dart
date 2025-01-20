import 'package:cubestation_flutter/cube/box/box.dart';
import 'package:cubestation_flutter/cube/box/box_model.dart';
import 'package:cubestation_flutter/cube/cube_constant.dart';
import 'package:cubestation_flutter/src/skin/paste/paste_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class PasteBoxController extends GetxController {
  final PasteController _colorSolutionController = Get.find<PasteController>();
  void onTapSlice(BoxModel boxModel, Color color, String slice, String? image) {
    ImageModel selectedSegment = _colorSolutionController.selectedSegment.value;
    if (image == selectedSegment.image.value) {
      if (boxModel.id == BoxName.W) {
        boxModel.topImage = 'assets/logo.png';
      } else {
        _coloring(boxModel, null, slice);
      }

      update([boxModel.id!]);
    } else {
      if (selectedSegment.color != color) {
        Fluttertoast.showToast(msg: '只可在相同色块位置贴图');
        return;
      }

      _coloring(boxModel, selectedSegment.image.value, slice);
      update([boxModel.id!]);
    }
  }

  void _coloring(BoxModel boxModel, String? image, String slice) {
    switch (slice) {
      case F:
        boxModel.frontImage = image;
        break;
      case B:
        boxModel.rearImage = image;
        break;
      case U:
        boxModel.topImage = image;
        break;
      case D:
        boxModel.bottomImage = image;
        break;
      case L:
        boxModel.leftImage = image;
        break;
      case R:
        boxModel.rightImage = image;
        break;
      default:
    }
  }
}
