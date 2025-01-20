import 'package:flutter/material.dart';
import 'package:zflutter/zflutter.dart';

class BoxModel {
  int? order;
  String? id;
  ZVector? translate;
  Color? color;
  Color? frontColor;
  Color? rearColor;
  Color? leftColor;
  Color? rightColor;
  Color? topColor;
  Color? bottomColor;
  List<double>? direction; //[1:x,2:y,3:z]
  List<List<double>>? directionMap;
  Map<double, Color>? colorMap;
  String? frontImage;
  String? rearImage;
  String? leftImage;
  String? rightImage;
  String? topImage;
  String? bottomImage;

  BoxModel(
      {this.order,
      this.id,
      this.translate,
      this.frontColor,
      this.rearColor,
      this.leftColor,
      this.rightColor,
      this.topColor,
      this.bottomColor,
      this.direction,
      this.directionMap,
      this.colorMap,
      this.frontImage,
      this.rearImage,
      this.leftImage,
      this.rightImage,
      this.topImage,
      this.bottomImage});

  BoxModel.fromJson(Map<String, dynamic> json) {
    order = json['order'];
    id = json['id'];
    translate = json['translate'];
    frontColor = json['frontColor'];
    rearColor = json['rearColor'];
    leftColor = json['leftColor'];
    rightColor = json['rightColor'];
    topColor = json['topColor'];
    bottomColor = json['bottomColor'];
    if (json['direction'] != null) {
      direction = <double>[];
      json['direction'].forEach((v) {
        direction!.add(v);
      });
    }
    if (json['directionMap'] != null) {
      directionMap = <List<double>>[];
      json['directionMap'].forEach((v) {
        directionMap!.add(v);
      });
    }
    if (json['colorMap'] != null) {
      colorMap = json['colorMap'];
    }
    frontImage = json['frontImage'];
    rearImage = json['rearImage'];
    leftImage = json['leftImage'];
    rightImage = json['rightImage'];
    topImage = json['topImage'];
    bottomImage = json['bottomImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order'] = order;
    data['id'] = id;
    data['translate'] = ZVector(translate!.x, translate!.y, translate!.z);
    data['frontColor'] = frontColor;
    data['rearColor'] = rearColor;
    data['leftColor'] = leftColor;
    data['rightColor'] = rightColor;
    data['topColor'] = topColor;
    data['bottomColor'] = bottomColor;
    data['direction'] = direction;
    if (directionMap != null) {
      data['directionMap'] = directionMap;
    }
    if (colorMap != null) {
      final Map<double, Color> map = <double, Color>{};
      colorMap!.forEach((key, value) {
        map[key] = value;
      });
      data['colorMap'] = map;
    }
    data['frontImage'] = frontImage;
    data['rearImage'] = rearImage;
    data['leftImage'] = leftImage;
    data['rightImage'] = rightImage;
    data['topImage'] = topImage;
    data['bottomImage'] = bottomImage;
    return data;
  }
}
