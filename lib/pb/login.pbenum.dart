///
//  Generated code. Do not modify.
//  source: login.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class s2c_login_acc_info_acc_state extends $pb.ProtobufEnum {
  static const s2c_login_acc_info_acc_state unregister = s2c_login_acc_info_acc_state._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'unregister');
  static const s2c_login_acc_info_acc_state no_password = s2c_login_acc_info_acc_state._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'no_password');
  static const s2c_login_acc_info_acc_state has_password = s2c_login_acc_info_acc_state._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'has_password');

  static const $core.List<s2c_login_acc_info_acc_state> values = <s2c_login_acc_info_acc_state> [
    unregister,
    no_password,
    has_password,
  ];

  static final $core.Map<$core.int, s2c_login_acc_info_acc_state> _byValue = $pb.ProtobufEnum.initByValue(values);
  static s2c_login_acc_info_acc_state? valueOf($core.int value) => _byValue[value];

  const s2c_login_acc_info_acc_state._($core.int v, $core.String n) : super(v, n);
}

class s2c_logout_logout_type extends $pb.ProtobufEnum {
  static const s2c_logout_logout_type normal = s2c_logout_logout_type._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'normal');
  static const s2c_logout_logout_type timeout = s2c_logout_logout_type._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'timeout');
  static const s2c_logout_logout_type self_kick = s2c_logout_logout_type._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'self_kick');
  static const s2c_logout_logout_type admin_kick = s2c_logout_logout_type._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'admin_kick');
  static const s2c_logout_logout_type server_busy = s2c_logout_logout_type._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'server_busy');
  static const s2c_logout_logout_type server_stop = s2c_logout_logout_type._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'server_stop');
  static const s2c_logout_logout_type account_ban = s2c_logout_logout_type._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'account_ban');
  static const s2c_logout_logout_type server_starting = s2c_logout_logout_type._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'server_starting');
  static const s2c_logout_logout_type account_cancelled = s2c_logout_logout_type._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'account_cancelled');

  static const $core.List<s2c_logout_logout_type> values = <s2c_logout_logout_type> [
    normal,
    timeout,
    self_kick,
    admin_kick,
    server_busy,
    server_stop,
    account_ban,
    server_starting,
    account_cancelled,
  ];

  static final $core.Map<$core.int, s2c_logout_logout_type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static s2c_logout_logout_type? valueOf($core.int value) => _byValue[value];

  const s2c_logout_logout_type._($core.int v, $core.String n) : super(v, n);
}

