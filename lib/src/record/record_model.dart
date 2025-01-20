class RecordModel {
  int? steps;
  int? useTime;
  String? playTime;
  int? ao5;
  int? ao12;
  String? definition;
  String get tps => (steps! / useTime! * 1000).toStringAsFixed(1);
  List<MoveModel>? moves;
  List<MethodModel>? cfops;
  List<MethodModel>? layers;

  RecordModel(
      {this.steps,
      this.useTime,
      this.playTime,
      this.ao5,
      this.ao12,
      this.definition,
      this.moves,
      this.cfops,
      this.layers});

  RecordModel.fromJson(Map<String, dynamic> json) {
    steps = json['steps'];
    useTime = json['useTime'];
    playTime = json['playTime'];
    ao5 = json['ao5'];
    ao12 = json['ao12'];
    definition = json['definition'];
    if (json['moves'] != null) {
      moves = <MoveModel>[];
      json['moves'].forEach((v) {
        moves!.add(MoveModel.fromJson(v));
      });
    }
    if (json['cfops'] != null) {
      cfops = <MethodModel>[];
      json['cfops'].forEach((v) {
        cfops!.add(MethodModel.fromJson(v));
      });
    }
    if (json['layers'] != null) {
      layers = <MethodModel>[];
      json['layers'].forEach((v) {
        layers!.add(MethodModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['steps'] = steps;
    data['useTime'] = useTime;
    data['playTime'] = playTime;
    data['ao5'] = ao5;
    data['ao12'] = ao12;
    data['definition'] = definition;
    if (moves != null) {
      data['moves'] = moves!.map((v) => v.toJson()).toList();
    }
    if (cfops != null) {
      data['cfops'] = cfops!.map((v) => v.toJson()).toList();
    }
    if (layers != null) {
      data['layers'] = layers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MethodModel {
  int? steps;
  int? useTime;
  String get tps => (steps! / useTime! * 1000).toStringAsFixed(1);

  MethodModel({this.steps, this.useTime});

  MethodModel.fromJson(Map<String, dynamic> json) {
    steps = json['steps'];
    useTime = json['useTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['steps'] = steps;
    data['useTime'] = useTime;
    return data;
  }
}

class MoveModel {
  String? move;
  int? timeStamp;

  MoveModel({this.move, this.timeStamp});

  MoveModel.fromJson(Map<String, dynamic> json) {
    move = json['move'];
    timeStamp = json['timeStamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['move'] = move;
    data['timeStamp'] = timeStamp;

    return data;
  }
}
