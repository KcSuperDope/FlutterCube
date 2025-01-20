import 'package:cubestation_flutter/common/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonUtils {
  static Widget filledButton(
      {String text = '确认',
      double? width,
      double? height,
      VoidCallback? onPressed,
      TextStyle? textStyle}) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(width ?? Get.width * 0.4, height ?? 40)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(48))),
          backgroundColor: MaterialStateProperty.all(CSColors.primary)),
      child: Text(text,
          style: textStyle ??
              TextStyle(color: CSColors.auxiliary, fontSize: 16, fontWeight: FontWeight.normal)),
    );
  }

  static Widget outlinedButton({
    String text = '确认',
    double? width,
    double? height,
    VoidCallback? onPressed,
  }) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size(width ?? Get.width * 0.4, height ?? 40)),
        side: MaterialStateProperty.all(BorderSide(color: CSColors.primary)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(48))),
      ),
      child: Text(text,
          style: TextStyle(color: CSColors.primary, fontSize: 16, fontWeight: FontWeight.normal)),
    );
  }

  static Widget iconButton({
    String text = '确认',
    String icon = 'icon_complete',
    double iconSize = 16,
    double? width,
    VoidCallback? onPressed,
  }) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(6),
          fixedSize: MaterialStateProperty.all(Size(width ?? Get.width * 0.4, 40)),
          side: MaterialStateProperty.all(BorderSide(color: CSColors.auxiliary)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(33))),
          backgroundColor: MaterialStateProperty.all(CSColors.primary)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/$icon.png', width: iconSize, height: iconSize),
          const SizedBox(width: 4),
          Text(
            text,
            style:
                TextStyle(color: CSColors.auxiliary, fontSize: 16, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  static DateTime? _lastPopTime;
  static bool isDoubleClick() {
    if (_lastPopTime == null ||
        DateTime.now().difference(_lastPopTime!) > const Duration(seconds: 1)) {
      _lastPopTime = DateTime.now();
      return false;
    } else {
      return true;
    }
  }
}
