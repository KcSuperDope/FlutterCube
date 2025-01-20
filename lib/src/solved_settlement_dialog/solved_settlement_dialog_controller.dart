import 'package:cubestation_flutter/src/record/record_model.dart';
import 'package:get/get.dart';

class SolvedSettlementDialogController extends GetxController {
  var method = 'CFOP'.obs;
  List<String> methods = ['CFOP', '层先法'];

  late RecordModel record;

  // RecordModel record = RecordModel(
  //     steps: 72,
  //     useTime: 5860,
  //     playTime: DateTime.now().toString().substring(0, 16),
  //     ao5: 5860,
  //     ao12: 5860,
  //     cfops: [
  //       MethodModel(step: 'C', stepImage: '1_3', steps: 72, useTime: 5860),
  //       MethodModel(step: 'F', stepImage: '3_2', steps: 72, useTime: 5860),
  //       MethodModel(step: 'O', stepImage: '5_2', steps: 72, useTime: 5860),
  //       MethodModel(step: 'P', stepImage: '7_2', steps: 72, useTime: 5860)
  //     ],
  //     layers: [
  //       MethodModel(step: '1', stepImage: '1_2', steps: 72, useTime: 5860),
  //       MethodModel(step: '2', stepImage: '1_3', steps: 72, useTime: 5860),
  //       MethodModel(step: '3', stepImage: '2_2', steps: 72, useTime: 5860),
  //       MethodModel(step: '4', stepImage: '3_2', steps: 72, useTime: 5860),
  //       MethodModel(step: '5', stepImage: '4_2', steps: 72, useTime: 5860),
  //       MethodModel(step: '6', stepImage: '5_2', steps: 72, useTime: 5860),
  //       MethodModel(step: '7', stepImage: '7_2', steps: 72, useTime: 5860)
  //     ]);
}
