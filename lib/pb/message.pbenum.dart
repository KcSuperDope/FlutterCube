///
//  Generated code. Do not modify.
//  source: message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class sub_icon_style extends $pb.ProtobufEnum {
  static const sub_icon_style gold = sub_icon_style._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'gold');
  static const sub_icon_style silver = sub_icon_style._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'silver');
  static const sub_icon_style copper = sub_icon_style._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'copper');
  static const sub_icon_style common = sub_icon_style._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'common');

  static const $core.List<sub_icon_style> values = <sub_icon_style> [
    gold,
    silver,
    copper,
    common,
  ];

  static final $core.Map<$core.int, sub_icon_style> _byValue = $pb.ProtobufEnum.initByValue(values);
  static sub_icon_style? valueOf($core.int value) => _byValue[value];

  const sub_icon_style._($core.int v, $core.String n) : super(v, n);
}

class e_grade_calc extends $pb.ProtobufEnum {
  static const e_grade_calc default1 = e_grade_calc._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'default1');
  static const e_grade_calc bo3 = e_grade_calc._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'bo3');
  static const e_grade_calc ao5 = e_grade_calc._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ao5');
  static const e_grade_calc bao5 = e_grade_calc._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'bao5');
  static const e_grade_calc mo3 = e_grade_calc._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mo3');

  static const $core.List<e_grade_calc> values = <e_grade_calc> [
    default1,
    bo3,
    ao5,
    bao5,
    mo3,
  ];

  static final $core.Map<$core.int, e_grade_calc> _byValue = $pb.ProtobufEnum.initByValue(values);
  static e_grade_calc? valueOf($core.int value) => _byValue[value];

  const e_grade_calc._($core.int v, $core.String n) : super(v, n);
}

class e_is_mvp extends $pb.ProtobufEnum {
  static const e_is_mvp no = e_is_mvp._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'no');
  static const e_is_mvp yes = e_is_mvp._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'yes');

  static const $core.List<e_is_mvp> values = <e_is_mvp> [
    no,
    yes,
  ];

  static final $core.Map<$core.int, e_is_mvp> _byValue = $pb.ProtobufEnum.initByValue(values);
  static e_is_mvp? valueOf($core.int value) => _byValue[value];

  const e_is_mvp._($core.int v, $core.String n) : super(v, n);
}

class e_rank_type extends $pb.ProtobufEnum {
  static const e_rank_type empty = e_rank_type._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'empty');
  static const e_rank_type time_trial = e_rank_type._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'time_trial');
  static const e_rank_type standard_clock = e_rank_type._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'standard_clock');
  static const e_rank_type cube_clone = e_rank_type._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'cube_clone');
  static const e_rank_type qualifier = e_rank_type._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'qualifier');
  static const e_rank_type match_event = e_rank_type._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'match_event');
  static const e_rank_type team_liveness_season = e_rank_type._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'team_liveness_season');
  static const e_rank_type team_liveness_week = e_rank_type._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'team_liveness_week');
  static const e_rank_type team_person = e_rank_type._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'team_person');
  static const e_rank_type team_point_season = e_rank_type._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'team_point_season');
  static const e_rank_type team_point_week = e_rank_type._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'team_point_week');

  static const $core.List<e_rank_type> values = <e_rank_type> [
    empty,
    time_trial,
    standard_clock,
    cube_clone,
    qualifier,
    match_event,
    team_liveness_season,
    team_liveness_week,
    team_person,
    team_point_season,
    team_point_week,
  ];

  static final $core.Map<$core.int, e_rank_type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static e_rank_type? valueOf($core.int value) => _byValue[value];

  const e_rank_type._($core.int v, $core.String n) : super(v, n);
}

