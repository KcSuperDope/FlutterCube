import 'package:cubestation_flutter/common/color.dart';
import 'package:flutter/material.dart';

Widget levelItemCard(String image, int starCount) {
  List<Widget> children = [];
  if (starCount > 2) {
    children = List.filled(3, Image.asset('assets/icon_star_active.png', width: 16, height: 16));
  } else {
    children = List.filled(
        starCount, Image.asset('assets/icon_star_active.png', width: 16, height: 16),
        growable: true)
      ..addAll(List.filled(
          3 - starCount, Image.asset('assets/icon_star_inactive.png', width: 16, height: 16)));
  }

  return Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: const Color(0xFF68BEFF), width: 2),
          color: const Color(0xFFE1F2FF),
        ),
        child: Center(child: Image.asset('assets/$image.png', width: 42, height: 42)),
      ),
      Container(
        width: 66,
        height: 26,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 3, left: 6, right: 6),
        decoration: const BoxDecoration(
          borderRadius:
              BorderRadius.only(bottomLeft: Radius.circular(18), bottomRight: Radius.circular(23)),
          color: Color.fromRGBO(41, 162, 255, 0.3),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: children),
      )
    ],
  );
}

Widget levelCard(String image, int starCount) {
  List<Widget> children = [];
  if (starCount > 2) {
    children = List.filled(3, Image.asset('assets/icon_star_active.png', width: 16, height: 16));
  } else {
    children = List.filled(
        starCount, Image.asset('assets/icon_star_active.png', width: 16, height: 16),
        growable: true)
      ..addAll(List.filled(
          3 - starCount, Image.asset('assets/icon_star_inactive.png', width: 16, height: 16)));
  }
  return Container(
    width: 70,
    height: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: CSColors.primary,
    ),
    child: Column(
      children: [
        Container(
            width: 70,
            height: 70,
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: CSColors.auxiliary,
            ),
            child: Center(child: Image.asset('assets/$image.png', width: 42, height: 42))),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: children)
      ],
    ),
  );
}
