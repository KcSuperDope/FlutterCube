import 'dart:async';
import 'package:cubestation_flutter/common/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<T?> showCustomGuidePop<T>({
  required BuildContext context,
  required GlobalKey popKey,
  required String title,
  Offset? offset,
}) {
  return Navigator.push(
    context,
    _CustomGuidePopRoute<T>(popKey: popKey, title: title, offset: offset),
  );
}

class _CustomGuidePopRoute<T> extends PopupRoute<T> {
  final GlobalKey popKey;
  final String title;
  final Offset? offset;

  _CustomGuidePopRoute({
    required this.popKey,
    required this.title,
    this.offset,
  });

  @override
  Color? get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 100);

  @override
  Widget buildPage(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return CustomGuidePop<T>(
      popKey: popKey,
      title: title,
      offset: offset,
    );
  }

  @override
  Animation<double> createAnimation() {
    return CurvedAnimation(
      parent: super.createAnimation(),
      curve: Curves.linear,
      reverseCurve: const Interval(0.0, 1.5),
    );
  }
}

class CustomGuidePop<T> extends StatefulWidget {
  final GlobalKey popKey;
  final String title;
  final Offset offset;

  CustomGuidePop({
    Key? key,
    required this.popKey,
    required this.title,
    Offset? offset,
  })  : this.offset = offset ?? Offset.zero,
        super(key: key);

  @override
  State<CustomGuidePop> createState() => _CustomGuidePopState();
}

class _CustomGuidePopState extends State<CustomGuidePop> {
  late GlobalKey globalKey = GlobalKey();
  late Rxn<RelativeRect> positionObs;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    positionObs = Rxn();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      RenderBox? contentBox = globalKey.currentContext?.findRenderObject() as RenderBox?;
      RenderBox? targetBox = widget.popKey.currentContext?.findRenderObject() as RenderBox?;
      double left = 0;
      double top = 0;
      if (targetBox == null || contentBox == null) {
        return;
      }
      var contentSize = contentBox.size;
      var targetSize = targetBox.size;
      Offset localToGlobal = targetBox.localToGlobal(Offset.zero);
      left = localToGlobal.dx - (contentSize.width - targetSize.width + 4);
      top = localToGlobal.dy + targetSize.height;
      left = left + widget.offset.dx;
      top = top + widget.offset.dy;
      positionObs.value = RelativeRect.fromLTRB(left, top, 0, 0);
    });
    // 默认5秒后消失
    timer = Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pop();
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        child: _buildWindow(context),
        onPanDown: (details) {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Widget _buildWindow(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.transparent,
        ),
        Obx(() {
          return Positioned(
            key: globalKey,
            left: positionObs.value?.left ?? 0,
            top: positionObs.value?.top ?? 0,
            child: Visibility(
              maintainAnimation: true,
              maintainSize: true,
              maintainState: true,
              visible: positionObs.value != null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(margin: const EdgeInsets.only(right: 10), child: _triangle()),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    decoration: BoxDecoration(
                      color: CSColors.primaryText,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                          color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _triangle() {
    return Container(
      width: 20,
      height: 0,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: CSColors.primaryText, width: 10, style: BorderStyle.solid),
          right: const BorderSide(color: Colors.transparent, width: 10, style: BorderStyle.solid),
          left: const BorderSide(color: Colors.transparent, width: 10, style: BorderStyle.solid),
        ),
      ),
    );
  }
}
