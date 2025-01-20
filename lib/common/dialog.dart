import 'package:cubestation_flutter/common/button.dart';
import 'package:cubestation_flutter/common/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogUtils {
  static void twoButton({
    String title = 'title',
    String content = 'content',
    Widget? contentView,
    double height = 176,
    String textConfirm = '确认',
    String textCancel = '取消',
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    Get.dialog(AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      contentPadding: EdgeInsets.zero,
      content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: CSColors.auxiliary,
          ),
          height: height,
          width: Get.width,
          child: Column(
            children: [
              const SizedBox(height: 16),
              title.isEmpty
                  ? const SizedBox()
                  : Text(
                      title,
                      style: TextStyle(
                        color: CSColors.primaryText,
                        fontSize: 18,
                      ),
                    ),
              const Spacer(),
              contentView ??
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      content,
                      style: const TextStyle(
                        color: Color(0xFF666666),
                      ),
                    ),
                  ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonUtils.outlinedButton(
                    text: textCancel,
                    onPressed: () {
                      if (onCancel != null) {
                        onCancel();
                      }
                      Get.back(); // 让OK也能自动退出
                    },
                  ),
                  ButtonUtils.filledButton(
                    text: textConfirm,
                    onPressed: () {
                      Get.back();
                      if (onConfirm != null) {
                        onConfirm();
                      }
                      // 让OK也能自动退出
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          )),
    ));
  }

  static void titleOnly({
    String title = 'title',
    String textConfirm = '确认',
    VoidCallback? onConfirm,
  }) {
    Get.dialog(AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      contentPadding: EdgeInsets.zero,
      content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: CSColors.auxiliary,
          ),
          height: 154,
          width: Get.width,
          child: Column(
            children: [
              const Spacer(),
              Text(
                title,
                style: TextStyle(
                  color: CSColors.primaryText,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              ButtonUtils.filledButton(
                width: Get.width * 0.6,
                onPressed: () {
                  if (onConfirm != null) {
                    onConfirm();
                  }
                  Get.back(); // 让OK也能自动退出
                },
              ),
              const SizedBox(height: 16),
            ],
          )),
    ));
  }

  static Widget progress({String title = 'title', String content = 'content', int progress = 0}) {
    return WillPopScope(
        child: AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          contentPadding: EdgeInsets.zero,
          content: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: CSColors.auxiliary,
              ),
              height: 176,
              width: Get.width,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  title.isEmpty
                      ? const SizedBox()
                      : Text(
                          title,
                          style: TextStyle(
                            color: CSColors.primaryText,
                            fontSize: 18,
                          ),
                        ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      content,
                      style: const TextStyle(
                        color: Color(0xFF666666),
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 10.0,
                    width: Get.width * 0.7,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      child: LinearProgressIndicator(
                        value: progress.toDouble() / 100,
                        backgroundColor: CSColors.divider,
                        color: CSColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$progress%',
                    style: const TextStyle(
                      color: Color(0xFF666666),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              )),
        ),
        onWillPop: () async => false);
  }

  static bool _isLoading = false;

  static void showLoading() {
    Get.dialog(const Center(child: CircularProgressIndicator()),
        barrierDismissible: false, barrierColor: Colors.transparent);
    _isLoading = true;
  }

  static void hideLoading() {
    if (_isLoading) {
      _isLoading = false;
      Get.back();
    }
  }
}
