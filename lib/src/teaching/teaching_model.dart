import 'package:zflutter/zflutter.dart';

class TeachingModel {
  String? level;
  String? goal;
  String? goalImage;
  List<TeachingDialogModel>? teachingDialogModels;
  bool lock;
  int get getStarCount => teachingDialogModels!
      .map((e) => e.teachingDialogItemModels!
          .map((e) => e.getStarCount > 3 ? 3 : e.getStarCount)
          .reduce((value, element) => value + element))
      .reduce((value, element) => value + element);
  int? allStarCount;

  TeachingModel({
    this.level,
    this.goal,
    this.goalImage,
    this.teachingDialogModels,
    this.lock = true,
    this.allStarCount,
  });
}

class TeachingDialogModel {
  String? goalImage;
  String? step;
  List<TeachingDialogItemModel>? teachingDialogItemModels;

  TeachingDialogModel({this.goalImage, this.step, this.teachingDialogItemModels});
}

class TeachingDialogItemModel {
  String? formula;
  String? explain;
  String? statusImage;
  int getStarCount;
  bool getStar;
  String? gif;
  TeachingCubeModel? teachingCubeModel;
  TeachingBasicsPlayModel? teachingBasicsPlayModel;

  TeachingDialogItemModel(
      {this.formula,
      this.explain,
      this.statusImage,
      this.gif,
      this.getStarCount = 0,
      this.getStar = false,
      this.teachingCubeModel,
      this.teachingBasicsPlayModel});
}

class TeachingCubeModel {
  String? animationQueue;
  ZVector? rotate;
  TeachingCubeModel({this.animationQueue, this.rotate});
}

class TeachingBasicsPlayModel {
  String? order;
  String? question;
  String? image;
  List<OptionModel>? options;

  TeachingBasicsPlayModel({this.order, this.question, this.image, this.options});
}

class OptionModel {
  String? text;
  bool? right;
  OptionModel({this.text, this.right = false});
}
