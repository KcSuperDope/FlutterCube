
import 'package:cubestation_flutter/src/record/record_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RecordController extends GetxController {
  List<RecordModel> records = [];
  // List<RecordModel> list = List.generate(
  //     40,
  //     (index) => RecordModel(
  //             steps: 72,
  //             useTime: 5860,
  //             playTime: DateTime.now().toString().substring(0, 16),
  //             ao5: 5860,
  //             ao12: 5860,
  //             cfops: [
  //               MethodModel(step: 'C', stepImage: '1_3', steps: 72, useTime: 5860),
  //               MethodModel(step: 'F', stepImage: '3_2', steps: 72, useTime: 5860),
  //               MethodModel(step: 'O', stepImage: '5_2', steps: 72, useTime: 5860),
  //               MethodModel(step: 'P', stepImage: '7_2', steps: 72, useTime: 5860)
  //             ],
  //             layers: [
  //               MethodModel(step: '1', stepImage: '1_2', steps: 72, useTime: 5860),
  //               MethodModel(step: '2', stepImage: '1_3', steps: 72, useTime: 5860),
  //               MethodModel(step: '3', stepImage: '2_2', steps: 72, useTime: 5860),
  //               MethodModel(step: '4', stepImage: '3_2', steps: 72, useTime: 5860),
  //               MethodModel(step: '5', stepImage: '4_2', steps: 72, useTime: 5860),
  //               MethodModel(step: '6', stepImage: '5_2', steps: 72, useTime: 5860),
  //               MethodModel(step: '7', stepImage: '7_2', steps: 72, useTime: 5860)
  //             ]));

  @override
  void onInit() {
    _getRecords();
    super.onInit();
  }

  void _getRecords() {
    GetStorage localStorage = GetStorage();
    if (localStorage.read('practiceRecord') != null) {
      localStorage.read('practiceRecord').forEach((v) {
        records.add(RecordModel.fromJson(v));
      });
    }

    for (int i = 0; i < records.length; i++) {
      records[i].ao5 = 0;
      records[i].ao12 = 0;
      if (records.sublist(i).length > 4) {
        records[i].ao5 = _calculateAONum(
            records[i].useTime!, records.sublist(0, 4).map((e) => e.useTime!).toList());
      }
      if (records.sublist(i).length > 11) {
        records[i].ao12 = _calculateAONum(
            records[i].useTime!, records.sublist(0, 11).map((e) => e.useTime!).toList());
      }
    }
  }

  int _calculateAONum(int time, List<int> beforeNum) {
    beforeNum
      ..add(time)
      ..sort();
    if (beforeNum[1] == 0) {
      return 0;
    }
    return (beforeNum.getRange(1, beforeNum.length).reduce((a, b) => a + b) /
            (beforeNum.length - 1))
        .round();
  }
}
