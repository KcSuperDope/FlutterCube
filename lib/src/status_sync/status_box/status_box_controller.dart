import 'package:cubestation_flutter/cube/box/box.dart';
import 'package:cubestation_flutter/cube/box/box_model.dart';
import 'package:cubestation_flutter/cube/cube_constant.dart';
import 'package:cubestation_flutter/src/status_sync/status_sync_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class StatusBoxController extends GetxController {
  final StatusSyncController _statusSyncController = Get.find<StatusSyncController>();
  void onTapSlice(BoxModel boxModel, Color color, String slice) {
    if (boxModel.id!.length == 1) {
      return;
    }
    Color selectedColor = _statusSyncController.selectedSegment.value.color;
    if (color == selectedColor) {
      _coloring(boxModel, defaultSliceColor, slice);
      _statusSyncController.selectedSegment.value.num++;
      update([boxModel.id!]);
    } else {
      if (_otherSliceColorValidate(boxModel, selectedColor, slice)) {
        Fluttertoast.showToast(msg: boxModel.id!.length == 3 ? '角块应填充三种不同颜色' : '棱块应填充两种不同颜色');
        return;
      }

      if (selectedColor == LColor && _otherSliceColorValidate(boxModel, RColor, slice)) {
        _validateTips('红', '橙', boxModel.id!.length);
        return;
      }

      if (selectedColor == RColor && _otherSliceColorValidate(boxModel, LColor, slice)) {
        _validateTips('红', '橙', boxModel.id!.length);
        return;
      }

      if (selectedColor == UColor && _otherSliceColorValidate(boxModel, DColor, slice)) {
        _validateTips('白', '黄', boxModel.id!.length);
        return;
      }

      if (selectedColor == DColor && _otherSliceColorValidate(boxModel, UColor, slice)) {
        _validateTips('白', '黄', boxModel.id!.length);
        return;
      }

      if (selectedColor == FColor && _otherSliceColorValidate(boxModel, BColor, slice)) {
        _validateTips('绿', '蓝', boxModel.id!.length);
        return;
      }

      if (selectedColor == BColor && _otherSliceColorValidate(boxModel, FColor, slice)) {
        _validateTips('绿', '蓝', boxModel.id!.length);
        return;
      }

      if (_statusSyncController.selectedSegment.value.num > 0) {
        if (color == UColor) _statusSyncController.UColorItem.num++;
        if (color == FColor) _statusSyncController.FColorItem.num++;
        if (color == DColor) _statusSyncController.DColorItem.num++;
        if (color == BColor) _statusSyncController.BColorItem.num++;
        if (color == LColor) _statusSyncController.LColorItem.num++;
        if (color == RColor) _statusSyncController.RColorItem.num++;
        _coloring(boxModel, selectedColor, slice);
        _statusSyncController.selectedSegment.value.num--;
        update([boxModel.id!]);
      }
    }
  }

  void _coloring(BoxModel boxModel, Color color, String slice) {
    switch (slice) {
      case F:
        boxModel.frontColor = color;
        break;
      case B:
        boxModel.rearColor = color;
        break;
      case U:
        boxModel.topColor = color;
        break;
      case D:
        boxModel.bottomColor = color;
        break;
      case L:
        boxModel.leftColor = color;
        break;
      case R:
        boxModel.rightColor = color;
        break;
      default:
    }
  }

  bool _otherSliceColorValidate(BoxModel boxModel, Color color, String slice) {
    bool result = false;
    switch (slice) {
      case F:
        result = boxModel.topColor == color ||
            boxModel.bottomColor == color ||
            boxModel.rearColor == color ||
            boxModel.rightColor == color ||
            boxModel.leftColor == color;
        break;
      case B:
        result = boxModel.topColor == color ||
            boxModel.bottomColor == color ||
            boxModel.frontColor == color ||
            boxModel.rightColor == color ||
            boxModel.leftColor == color;
        break;
      case U:
        result = boxModel.frontColor == color ||
            boxModel.bottomColor == color ||
            boxModel.rearColor == color ||
            boxModel.rightColor == color ||
            boxModel.leftColor == color;
        break;
      case D:
        result = boxModel.topColor == color ||
            boxModel.frontColor == color ||
            boxModel.rearColor == color ||
            boxModel.rightColor == color ||
            boxModel.leftColor == color;
        break;
      case L:
        result = boxModel.topColor == color ||
            boxModel.bottomColor == color ||
            boxModel.rearColor == color ||
            boxModel.rightColor == color ||
            boxModel.frontColor == color;
        break;
      case R:
        result = boxModel.topColor == color ||
            boxModel.bottomColor == color ||
            boxModel.rearColor == color ||
            boxModel.frontColor == color ||
            boxModel.leftColor == color;
        break;
      default:
    }
    return result;
  }

  void _validateTips(String color, String oppositeColor, int idLength) =>
      Fluttertoast.showToast(msg: '$color色和$oppositeColor色不可在同一${idLength == 3 ? '角' : '楞'}块');
}
