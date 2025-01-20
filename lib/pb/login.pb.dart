///
//  Generated code. Do not modify.
//  source: login.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'message.pb.dart' as $0;

import 'code.pbenum.dart' as $1;
import 'login.pbenum.dart';

export 'login.pbenum.dart';

class c2s_heartbeat extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'c2s_heartbeat', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  c2s_heartbeat._() : super();
  factory c2s_heartbeat() => create();
  factory c2s_heartbeat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory c2s_heartbeat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  c2s_heartbeat clone() => c2s_heartbeat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  c2s_heartbeat copyWith(void Function(c2s_heartbeat) updates) => super.copyWith((message) => updates(message as c2s_heartbeat)) as c2s_heartbeat; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static c2s_heartbeat create() => c2s_heartbeat._();
  c2s_heartbeat createEmptyInstance() => create();
  static $pb.PbList<c2s_heartbeat> createRepeated() => $pb.PbList<c2s_heartbeat>();
  @$core.pragma('dart2js:noInline')
  static c2s_heartbeat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<c2s_heartbeat>(create);
  static c2s_heartbeat? _defaultInstance;
}

class s2c_heartbeat extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 's2c_heartbeat', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timestamp')
    ..hasRequiredFields = false
  ;

  s2c_heartbeat._() : super();
  factory s2c_heartbeat({
    $fixnum.Int64? timestamp,
  }) {
    final _result = create();
    if (timestamp != null) {
      _result.timestamp = timestamp;
    }
    return _result;
  }
  factory s2c_heartbeat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory s2c_heartbeat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  s2c_heartbeat clone() => s2c_heartbeat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  s2c_heartbeat copyWith(void Function(s2c_heartbeat) updates) => super.copyWith((message) => updates(message as s2c_heartbeat)) as s2c_heartbeat; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static s2c_heartbeat create() => s2c_heartbeat._();
  s2c_heartbeat createEmptyInstance() => create();
  static $pb.PbList<s2c_heartbeat> createRepeated() => $pb.PbList<s2c_heartbeat>();
  @$core.pragma('dart2js:noInline')
  static s2c_heartbeat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<s2c_heartbeat>(create);
  static s2c_heartbeat? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get timestamp => $_getI64(0);
  @$pb.TagNumber(1)
  set timestamp($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestamp() => clearField(1);
}

class c2s_login_visitor extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'c2s_login_visitor', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sMachineCode', protoName: 'sMachineCode')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iChannelID', $pb.PbFieldType.O3, protoName: 'iChannelID')
    ..hasRequiredFields = false
  ;

  c2s_login_visitor._() : super();
  factory c2s_login_visitor({
    $core.String? sMachineCode,
    $core.int? iChannelID,
  }) {
    final _result = create();
    if (sMachineCode != null) {
      _result.sMachineCode = sMachineCode;
    }
    if (iChannelID != null) {
      _result.iChannelID = iChannelID;
    }
    return _result;
  }
  factory c2s_login_visitor.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory c2s_login_visitor.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  c2s_login_visitor clone() => c2s_login_visitor()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  c2s_login_visitor copyWith(void Function(c2s_login_visitor) updates) => super.copyWith((message) => updates(message as c2s_login_visitor)) as c2s_login_visitor; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static c2s_login_visitor create() => c2s_login_visitor._();
  c2s_login_visitor createEmptyInstance() => create();
  static $pb.PbList<c2s_login_visitor> createRepeated() => $pb.PbList<c2s_login_visitor>();
  @$core.pragma('dart2js:noInline')
  static c2s_login_visitor getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<c2s_login_visitor>(create);
  static c2s_login_visitor? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sMachineCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set sMachineCode($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSMachineCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearSMachineCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get iChannelID => $_getIZ(1);
  @$pb.TagNumber(2)
  set iChannelID($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIChannelID() => $_has(1);
  @$pb.TagNumber(2)
  void clearIChannelID() => clearField(2);
}

class s2c_login_visitor extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 's2c_login_visitor', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..e<$1.response_code>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eCode', $pb.PbFieldType.OE, protoName: 'eCode', defaultOrMaker: $1.response_code.normal, valueOf: $1.response_code.valueOf, enumValues: $1.response_code.values)
    ..hasRequiredFields = false
  ;

  s2c_login_visitor._() : super();
  factory s2c_login_visitor({
    $1.response_code? eCode,
  }) {
    final _result = create();
    if (eCode != null) {
      _result.eCode = eCode;
    }
    return _result;
  }
  factory s2c_login_visitor.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory s2c_login_visitor.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  s2c_login_visitor clone() => s2c_login_visitor()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  s2c_login_visitor copyWith(void Function(s2c_login_visitor) updates) => super.copyWith((message) => updates(message as s2c_login_visitor)) as s2c_login_visitor; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static s2c_login_visitor create() => s2c_login_visitor._();
  s2c_login_visitor createEmptyInstance() => create();
  static $pb.PbList<s2c_login_visitor> createRepeated() => $pb.PbList<s2c_login_visitor>();
  @$core.pragma('dart2js:noInline')
  static s2c_login_visitor getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<s2c_login_visitor>(create);
  static s2c_login_visitor? _defaultInstance;

  @$pb.TagNumber(1)
  $1.response_code get eCode => $_getN(0);
  @$pb.TagNumber(1)
  set eCode($1.response_code v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasECode() => $_has(0);
  @$pb.TagNumber(1)
  void clearECode() => clearField(1);
}

class c2s_login_password extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'c2s_login_password', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sPhoneNum', protoName: 'sPhoneNum')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sEmail', protoName: 'sEmail')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sPassword', protoName: 'sPassword')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iLoginTime', $pb.PbFieldType.O3, protoName: 'iLoginTime')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iChannelID', $pb.PbFieldType.O3, protoName: 'iChannelID')
    ..hasRequiredFields = false
  ;

  c2s_login_password._() : super();
  factory c2s_login_password({
    $core.String? sPhoneNum,
    $core.String? sEmail,
    $core.String? sPassword,
    $core.int? iLoginTime,
    $core.int? iChannelID,
  }) {
    final _result = create();
    if (sPhoneNum != null) {
      _result.sPhoneNum = sPhoneNum;
    }
    if (sEmail != null) {
      _result.sEmail = sEmail;
    }
    if (sPassword != null) {
      _result.sPassword = sPassword;
    }
    if (iLoginTime != null) {
      _result.iLoginTime = iLoginTime;
    }
    if (iChannelID != null) {
      _result.iChannelID = iChannelID;
    }
    return _result;
  }
  factory c2s_login_password.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory c2s_login_password.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  c2s_login_password clone() => c2s_login_password()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  c2s_login_password copyWith(void Function(c2s_login_password) updates) => super.copyWith((message) => updates(message as c2s_login_password)) as c2s_login_password; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static c2s_login_password create() => c2s_login_password._();
  c2s_login_password createEmptyInstance() => create();
  static $pb.PbList<c2s_login_password> createRepeated() => $pb.PbList<c2s_login_password>();
  @$core.pragma('dart2js:noInline')
  static c2s_login_password getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<c2s_login_password>(create);
  static c2s_login_password? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sPhoneNum => $_getSZ(0);
  @$pb.TagNumber(1)
  set sPhoneNum($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSPhoneNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearSPhoneNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sEmail => $_getSZ(1);
  @$pb.TagNumber(2)
  set sEmail($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearSEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sPassword => $_getSZ(2);
  @$pb.TagNumber(3)
  set sPassword($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearSPassword() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get iLoginTime => $_getIZ(3);
  @$pb.TagNumber(4)
  set iLoginTime($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasILoginTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearILoginTime() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get iChannelID => $_getIZ(4);
  @$pb.TagNumber(5)
  set iChannelID($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIChannelID() => $_has(4);
  @$pb.TagNumber(5)
  void clearIChannelID() => clearField(5);
}

class s2c_login_password extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 's2c_login_password', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..e<$1.response_code>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eCode', $pb.PbFieldType.OE, protoName: 'eCode', defaultOrMaker: $1.response_code.normal, valueOf: $1.response_code.valueOf, enumValues: $1.response_code.values)
    ..hasRequiredFields = false
  ;

  s2c_login_password._() : super();
  factory s2c_login_password({
    $1.response_code? eCode,
  }) {
    final _result = create();
    if (eCode != null) {
      _result.eCode = eCode;
    }
    return _result;
  }
  factory s2c_login_password.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory s2c_login_password.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  s2c_login_password clone() => s2c_login_password()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  s2c_login_password copyWith(void Function(s2c_login_password) updates) => super.copyWith((message) => updates(message as s2c_login_password)) as s2c_login_password; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static s2c_login_password create() => s2c_login_password._();
  s2c_login_password createEmptyInstance() => create();
  static $pb.PbList<s2c_login_password> createRepeated() => $pb.PbList<s2c_login_password>();
  @$core.pragma('dart2js:noInline')
  static s2c_login_password getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<s2c_login_password>(create);
  static s2c_login_password? _defaultInstance;

  @$pb.TagNumber(1)
  $1.response_code get eCode => $_getN(0);
  @$pb.TagNumber(1)
  set eCode($1.response_code v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasECode() => $_has(0);
  @$pb.TagNumber(1)
  void clearECode() => clearField(1);
}

class c2s_login_get_v_code extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'c2s_login_get_v_code', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sPhoneNum', protoName: 'sPhoneNum')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sEmail', protoName: 'sEmail')
    ..hasRequiredFields = false
  ;

  c2s_login_get_v_code._() : super();
  factory c2s_login_get_v_code({
    $core.String? sPhoneNum,
    $core.String? sEmail,
  }) {
    final _result = create();
    if (sPhoneNum != null) {
      _result.sPhoneNum = sPhoneNum;
    }
    if (sEmail != null) {
      _result.sEmail = sEmail;
    }
    return _result;
  }
  factory c2s_login_get_v_code.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory c2s_login_get_v_code.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  c2s_login_get_v_code clone() => c2s_login_get_v_code()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  c2s_login_get_v_code copyWith(void Function(c2s_login_get_v_code) updates) => super.copyWith((message) => updates(message as c2s_login_get_v_code)) as c2s_login_get_v_code; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static c2s_login_get_v_code create() => c2s_login_get_v_code._();
  c2s_login_get_v_code createEmptyInstance() => create();
  static $pb.PbList<c2s_login_get_v_code> createRepeated() => $pb.PbList<c2s_login_get_v_code>();
  @$core.pragma('dart2js:noInline')
  static c2s_login_get_v_code getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<c2s_login_get_v_code>(create);
  static c2s_login_get_v_code? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sPhoneNum => $_getSZ(0);
  @$pb.TagNumber(1)
  set sPhoneNum($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSPhoneNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearSPhoneNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sEmail => $_getSZ(1);
  @$pb.TagNumber(2)
  set sEmail($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearSEmail() => clearField(2);
}

class s2c_login_get_v_code extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 's2c_login_get_v_code', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..e<$1.response_code>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eCode', $pb.PbFieldType.OE, protoName: 'eCode', defaultOrMaker: $1.response_code.normal, valueOf: $1.response_code.valueOf, enumValues: $1.response_code.values)
    ..hasRequiredFields = false
  ;

  s2c_login_get_v_code._() : super();
  factory s2c_login_get_v_code({
    $1.response_code? eCode,
  }) {
    final _result = create();
    if (eCode != null) {
      _result.eCode = eCode;
    }
    return _result;
  }
  factory s2c_login_get_v_code.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory s2c_login_get_v_code.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  s2c_login_get_v_code clone() => s2c_login_get_v_code()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  s2c_login_get_v_code copyWith(void Function(s2c_login_get_v_code) updates) => super.copyWith((message) => updates(message as s2c_login_get_v_code)) as s2c_login_get_v_code; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static s2c_login_get_v_code create() => s2c_login_get_v_code._();
  s2c_login_get_v_code createEmptyInstance() => create();
  static $pb.PbList<s2c_login_get_v_code> createRepeated() => $pb.PbList<s2c_login_get_v_code>();
  @$core.pragma('dart2js:noInline')
  static s2c_login_get_v_code getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<s2c_login_get_v_code>(create);
  static s2c_login_get_v_code? _defaultInstance;

  @$pb.TagNumber(1)
  $1.response_code get eCode => $_getN(0);
  @$pb.TagNumber(1)
  set eCode($1.response_code v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasECode() => $_has(0);
  @$pb.TagNumber(1)
  void clearECode() => clearField(1);
}

class c2s_login_verify extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'c2s_login_verify', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sPhoneNum', protoName: 'sPhoneNum')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sEmail', protoName: 'sEmail')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iVCode', $pb.PbFieldType.O3, protoName: 'iVCode')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sMachineCode', protoName: 'sMachineCode')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iChannelID', $pb.PbFieldType.O3, protoName: 'iChannelID')
    ..hasRequiredFields = false
  ;

  c2s_login_verify._() : super();
  factory c2s_login_verify({
    $core.String? sPhoneNum,
    $core.String? sEmail,
    $core.int? iVCode,
    $core.String? sMachineCode,
    $core.int? iChannelID,
  }) {
    final _result = create();
    if (sPhoneNum != null) {
      _result.sPhoneNum = sPhoneNum;
    }
    if (sEmail != null) {
      _result.sEmail = sEmail;
    }
    if (iVCode != null) {
      _result.iVCode = iVCode;
    }
    if (sMachineCode != null) {
      _result.sMachineCode = sMachineCode;
    }
    if (iChannelID != null) {
      _result.iChannelID = iChannelID;
    }
    return _result;
  }
  factory c2s_login_verify.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory c2s_login_verify.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  c2s_login_verify clone() => c2s_login_verify()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  c2s_login_verify copyWith(void Function(c2s_login_verify) updates) => super.copyWith((message) => updates(message as c2s_login_verify)) as c2s_login_verify; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static c2s_login_verify create() => c2s_login_verify._();
  c2s_login_verify createEmptyInstance() => create();
  static $pb.PbList<c2s_login_verify> createRepeated() => $pb.PbList<c2s_login_verify>();
  @$core.pragma('dart2js:noInline')
  static c2s_login_verify getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<c2s_login_verify>(create);
  static c2s_login_verify? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sPhoneNum => $_getSZ(0);
  @$pb.TagNumber(1)
  set sPhoneNum($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSPhoneNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearSPhoneNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sEmail => $_getSZ(1);
  @$pb.TagNumber(2)
  set sEmail($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearSEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get iVCode => $_getIZ(2);
  @$pb.TagNumber(3)
  set iVCode($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIVCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearIVCode() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sMachineCode => $_getSZ(3);
  @$pb.TagNumber(4)
  set sMachineCode($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSMachineCode() => $_has(3);
  @$pb.TagNumber(4)
  void clearSMachineCode() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get iChannelID => $_getIZ(4);
  @$pb.TagNumber(5)
  set iChannelID($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIChannelID() => $_has(4);
  @$pb.TagNumber(5)
  void clearIChannelID() => clearField(5);
}

class s2c_login_verify extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 's2c_login_verify', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..e<$1.response_code>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eCode', $pb.PbFieldType.OE, protoName: 'eCode', defaultOrMaker: $1.response_code.normal, valueOf: $1.response_code.valueOf, enumValues: $1.response_code.values)
    ..hasRequiredFields = false
  ;

  s2c_login_verify._() : super();
  factory s2c_login_verify({
    $1.response_code? eCode,
  }) {
    final _result = create();
    if (eCode != null) {
      _result.eCode = eCode;
    }
    return _result;
  }
  factory s2c_login_verify.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory s2c_login_verify.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  s2c_login_verify clone() => s2c_login_verify()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  s2c_login_verify copyWith(void Function(s2c_login_verify) updates) => super.copyWith((message) => updates(message as s2c_login_verify)) as s2c_login_verify; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static s2c_login_verify create() => s2c_login_verify._();
  s2c_login_verify createEmptyInstance() => create();
  static $pb.PbList<s2c_login_verify> createRepeated() => $pb.PbList<s2c_login_verify>();
  @$core.pragma('dart2js:noInline')
  static s2c_login_verify getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<s2c_login_verify>(create);
  static s2c_login_verify? _defaultInstance;

  @$pb.TagNumber(1)
  $1.response_code get eCode => $_getN(0);
  @$pb.TagNumber(1)
  set eCode($1.response_code v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasECode() => $_has(0);
  @$pb.TagNumber(1)
  void clearECode() => clearField(1);
}

class c2s_login_acc_info extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'c2s_login_acc_info', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sPhoneNum', protoName: 'sPhoneNum')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sEmail', protoName: 'sEmail')
    ..hasRequiredFields = false
  ;

  c2s_login_acc_info._() : super();
  factory c2s_login_acc_info({
    $core.String? sPhoneNum,
    $core.String? sEmail,
  }) {
    final _result = create();
    if (sPhoneNum != null) {
      _result.sPhoneNum = sPhoneNum;
    }
    if (sEmail != null) {
      _result.sEmail = sEmail;
    }
    return _result;
  }
  factory c2s_login_acc_info.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory c2s_login_acc_info.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  c2s_login_acc_info clone() => c2s_login_acc_info()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  c2s_login_acc_info copyWith(void Function(c2s_login_acc_info) updates) => super.copyWith((message) => updates(message as c2s_login_acc_info)) as c2s_login_acc_info; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static c2s_login_acc_info create() => c2s_login_acc_info._();
  c2s_login_acc_info createEmptyInstance() => create();
  static $pb.PbList<c2s_login_acc_info> createRepeated() => $pb.PbList<c2s_login_acc_info>();
  @$core.pragma('dart2js:noInline')
  static c2s_login_acc_info getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<c2s_login_acc_info>(create);
  static c2s_login_acc_info? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sPhoneNum => $_getSZ(0);
  @$pb.TagNumber(1)
  set sPhoneNum($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSPhoneNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearSPhoneNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sEmail => $_getSZ(1);
  @$pb.TagNumber(2)
  set sEmail($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearSEmail() => clearField(2);
}

class s2c_login_acc_info extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 's2c_login_acc_info', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..e<s2c_login_acc_info_acc_state>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eState', $pb.PbFieldType.OE, protoName: 'eState', defaultOrMaker: s2c_login_acc_info_acc_state.unregister, valueOf: s2c_login_acc_info_acc_state.valueOf, enumValues: s2c_login_acc_info_acc_state.values)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sPhoneNum', protoName: 'sPhoneNum')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sEmail', protoName: 'sEmail')
    ..hasRequiredFields = false
  ;

  s2c_login_acc_info._() : super();
  factory s2c_login_acc_info({
    s2c_login_acc_info_acc_state? eState,
    $core.String? sPhoneNum,
    $core.String? sEmail,
  }) {
    final _result = create();
    if (eState != null) {
      _result.eState = eState;
    }
    if (sPhoneNum != null) {
      _result.sPhoneNum = sPhoneNum;
    }
    if (sEmail != null) {
      _result.sEmail = sEmail;
    }
    return _result;
  }
  factory s2c_login_acc_info.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory s2c_login_acc_info.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  s2c_login_acc_info clone() => s2c_login_acc_info()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  s2c_login_acc_info copyWith(void Function(s2c_login_acc_info) updates) => super.copyWith((message) => updates(message as s2c_login_acc_info)) as s2c_login_acc_info; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static s2c_login_acc_info create() => s2c_login_acc_info._();
  s2c_login_acc_info createEmptyInstance() => create();
  static $pb.PbList<s2c_login_acc_info> createRepeated() => $pb.PbList<s2c_login_acc_info>();
  @$core.pragma('dart2js:noInline')
  static s2c_login_acc_info getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<s2c_login_acc_info>(create);
  static s2c_login_acc_info? _defaultInstance;

  @$pb.TagNumber(1)
  s2c_login_acc_info_acc_state get eState => $_getN(0);
  @$pb.TagNumber(1)
  set eState(s2c_login_acc_info_acc_state v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEState() => $_has(0);
  @$pb.TagNumber(1)
  void clearEState() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sPhoneNum => $_getSZ(1);
  @$pb.TagNumber(2)
  set sPhoneNum($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSPhoneNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearSPhoneNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sEmail => $_getSZ(2);
  @$pb.TagNumber(3)
  set sEmail($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearSEmail() => clearField(3);
}

class c2s_login_oauth extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'c2s_login_oauth', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iType', $pb.PbFieldType.O3, protoName: 'iType')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sOpenID', protoName: 'sOpenID')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sJson', protoName: 'sJson')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sMachineCode', protoName: 'sMachineCode')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iChannelID', $pb.PbFieldType.O3, protoName: 'iChannelID')
    ..hasRequiredFields = false
  ;

  c2s_login_oauth._() : super();
  factory c2s_login_oauth({
    $core.int? iType,
    $core.String? sOpenID,
    $core.String? sJson,
    $core.String? sMachineCode,
    $core.int? iChannelID,
  }) {
    final _result = create();
    if (iType != null) {
      _result.iType = iType;
    }
    if (sOpenID != null) {
      _result.sOpenID = sOpenID;
    }
    if (sJson != null) {
      _result.sJson = sJson;
    }
    if (sMachineCode != null) {
      _result.sMachineCode = sMachineCode;
    }
    if (iChannelID != null) {
      _result.iChannelID = iChannelID;
    }
    return _result;
  }
  factory c2s_login_oauth.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory c2s_login_oauth.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  c2s_login_oauth clone() => c2s_login_oauth()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  c2s_login_oauth copyWith(void Function(c2s_login_oauth) updates) => super.copyWith((message) => updates(message as c2s_login_oauth)) as c2s_login_oauth; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static c2s_login_oauth create() => c2s_login_oauth._();
  c2s_login_oauth createEmptyInstance() => create();
  static $pb.PbList<c2s_login_oauth> createRepeated() => $pb.PbList<c2s_login_oauth>();
  @$core.pragma('dart2js:noInline')
  static c2s_login_oauth getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<c2s_login_oauth>(create);
  static c2s_login_oauth? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get iType => $_getIZ(0);
  @$pb.TagNumber(1)
  set iType($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIType() => $_has(0);
  @$pb.TagNumber(1)
  void clearIType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sOpenID => $_getSZ(1);
  @$pb.TagNumber(2)
  set sOpenID($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSOpenID() => $_has(1);
  @$pb.TagNumber(2)
  void clearSOpenID() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sJson => $_getSZ(2);
  @$pb.TagNumber(3)
  set sJson($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSJson() => $_has(2);
  @$pb.TagNumber(3)
  void clearSJson() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sMachineCode => $_getSZ(3);
  @$pb.TagNumber(4)
  set sMachineCode($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSMachineCode() => $_has(3);
  @$pb.TagNumber(4)
  void clearSMachineCode() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get iChannelID => $_getIZ(4);
  @$pb.TagNumber(5)
  set iChannelID($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIChannelID() => $_has(4);
  @$pb.TagNumber(5)
  void clearIChannelID() => clearField(5);
}

class s2c_login_oauth extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 's2c_login_oauth', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..e<$1.response_code>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eCode', $pb.PbFieldType.OE, protoName: 'eCode', defaultOrMaker: $1.response_code.normal, valueOf: $1.response_code.valueOf, enumValues: $1.response_code.values)
    ..hasRequiredFields = false
  ;

  s2c_login_oauth._() : super();
  factory s2c_login_oauth({
    $1.response_code? eCode,
  }) {
    final _result = create();
    if (eCode != null) {
      _result.eCode = eCode;
    }
    return _result;
  }
  factory s2c_login_oauth.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory s2c_login_oauth.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  s2c_login_oauth clone() => s2c_login_oauth()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  s2c_login_oauth copyWith(void Function(s2c_login_oauth) updates) => super.copyWith((message) => updates(message as s2c_login_oauth)) as s2c_login_oauth; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static s2c_login_oauth create() => s2c_login_oauth._();
  s2c_login_oauth createEmptyInstance() => create();
  static $pb.PbList<s2c_login_oauth> createRepeated() => $pb.PbList<s2c_login_oauth>();
  @$core.pragma('dart2js:noInline')
  static s2c_login_oauth getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<s2c_login_oauth>(create);
  static s2c_login_oauth? _defaultInstance;

  @$pb.TagNumber(1)
  $1.response_code get eCode => $_getN(0);
  @$pb.TagNumber(1)
  set eCode($1.response_code v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasECode() => $_has(0);
  @$pb.TagNumber(1)
  void clearECode() => clearField(1);
}

class c2s_re_login extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'c2s_re_login', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iUserID', protoName: 'iUserID')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iToken', $pb.PbFieldType.OU3, protoName: 'iToken')
    ..hasRequiredFields = false
  ;

  c2s_re_login._() : super();
  factory c2s_re_login({
    $fixnum.Int64? iUserID,
    $core.int? iToken,
  }) {
    final _result = create();
    if (iUserID != null) {
      _result.iUserID = iUserID;
    }
    if (iToken != null) {
      _result.iToken = iToken;
    }
    return _result;
  }
  factory c2s_re_login.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory c2s_re_login.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  c2s_re_login clone() => c2s_re_login()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  c2s_re_login copyWith(void Function(c2s_re_login) updates) => super.copyWith((message) => updates(message as c2s_re_login)) as c2s_re_login; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static c2s_re_login create() => c2s_re_login._();
  c2s_re_login createEmptyInstance() => create();
  static $pb.PbList<c2s_re_login> createRepeated() => $pb.PbList<c2s_re_login>();
  @$core.pragma('dart2js:noInline')
  static c2s_re_login getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<c2s_re_login>(create);
  static c2s_re_login? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get iUserID => $_getI64(0);
  @$pb.TagNumber(1)
  set iUserID($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearIUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get iToken => $_getIZ(1);
  @$pb.TagNumber(2)
  set iToken($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearIToken() => clearField(2);
}

class s2c_re_login extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 's2c_re_login', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..e<$1.response_code>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eCode', $pb.PbFieldType.OE, protoName: 'eCode', defaultOrMaker: $1.response_code.normal, valueOf: $1.response_code.valueOf, enumValues: $1.response_code.values)
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iUserID', protoName: 'iUserID')
    ..hasRequiredFields = false
  ;

  s2c_re_login._() : super();
  factory s2c_re_login({
    $1.response_code? eCode,
    $fixnum.Int64? iUserID,
  }) {
    final _result = create();
    if (eCode != null) {
      _result.eCode = eCode;
    }
    if (iUserID != null) {
      _result.iUserID = iUserID;
    }
    return _result;
  }
  factory s2c_re_login.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory s2c_re_login.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  s2c_re_login clone() => s2c_re_login()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  s2c_re_login copyWith(void Function(s2c_re_login) updates) => super.copyWith((message) => updates(message as s2c_re_login)) as s2c_re_login; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static s2c_re_login create() => s2c_re_login._();
  s2c_re_login createEmptyInstance() => create();
  static $pb.PbList<s2c_re_login> createRepeated() => $pb.PbList<s2c_re_login>();
  @$core.pragma('dart2js:noInline')
  static s2c_re_login getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<s2c_re_login>(create);
  static s2c_re_login? _defaultInstance;

  @$pb.TagNumber(1)
  $1.response_code get eCode => $_getN(0);
  @$pb.TagNumber(1)
  set eCode($1.response_code v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasECode() => $_has(0);
  @$pb.TagNumber(1)
  void clearECode() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get iUserID => $_getI64(1);
  @$pb.TagNumber(2)
  set iUserID($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIUserID() => $_has(1);
  @$pb.TagNumber(2)
  void clearIUserID() => clearField(2);
}

class c2s_token_login extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'c2s_token_login', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iUserID', protoName: 'iUserID')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iToken', $pb.PbFieldType.OU3, protoName: 'iToken')
    ..hasRequiredFields = false
  ;

  c2s_token_login._() : super();
  factory c2s_token_login({
    $fixnum.Int64? iUserID,
    $core.int? iToken,
  }) {
    final _result = create();
    if (iUserID != null) {
      _result.iUserID = iUserID;
    }
    if (iToken != null) {
      _result.iToken = iToken;
    }
    return _result;
  }
  factory c2s_token_login.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory c2s_token_login.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  c2s_token_login clone() => c2s_token_login()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  c2s_token_login copyWith(void Function(c2s_token_login) updates) => super.copyWith((message) => updates(message as c2s_token_login)) as c2s_token_login; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static c2s_token_login create() => c2s_token_login._();
  c2s_token_login createEmptyInstance() => create();
  static $pb.PbList<c2s_token_login> createRepeated() => $pb.PbList<c2s_token_login>();
  @$core.pragma('dart2js:noInline')
  static c2s_token_login getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<c2s_token_login>(create);
  static c2s_token_login? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get iUserID => $_getI64(0);
  @$pb.TagNumber(1)
  set iUserID($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearIUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get iToken => $_getIZ(1);
  @$pb.TagNumber(2)
  set iToken($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearIToken() => clearField(2);
}

class s2c_token_login extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 's2c_token_login', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..e<$1.response_code>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eCode', $pb.PbFieldType.OE, protoName: 'eCode', defaultOrMaker: $1.response_code.normal, valueOf: $1.response_code.valueOf, enumValues: $1.response_code.values)
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iUserID', protoName: 'iUserID')
    ..hasRequiredFields = false
  ;

  s2c_token_login._() : super();
  factory s2c_token_login({
    $1.response_code? eCode,
    $fixnum.Int64? iUserID,
  }) {
    final _result = create();
    if (eCode != null) {
      _result.eCode = eCode;
    }
    if (iUserID != null) {
      _result.iUserID = iUserID;
    }
    return _result;
  }
  factory s2c_token_login.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory s2c_token_login.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  s2c_token_login clone() => s2c_token_login()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  s2c_token_login copyWith(void Function(s2c_token_login) updates) => super.copyWith((message) => updates(message as s2c_token_login)) as s2c_token_login; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static s2c_token_login create() => s2c_token_login._();
  s2c_token_login createEmptyInstance() => create();
  static $pb.PbList<s2c_token_login> createRepeated() => $pb.PbList<s2c_token_login>();
  @$core.pragma('dart2js:noInline')
  static s2c_token_login getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<s2c_token_login>(create);
  static s2c_token_login? _defaultInstance;

  @$pb.TagNumber(1)
  $1.response_code get eCode => $_getN(0);
  @$pb.TagNumber(1)
  set eCode($1.response_code v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasECode() => $_has(0);
  @$pb.TagNumber(1)
  void clearECode() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get iUserID => $_getI64(1);
  @$pb.TagNumber(2)
  set iUserID($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIUserID() => $_has(1);
  @$pb.TagNumber(2)
  void clearIUserID() => clearField(2);
}

class c2s_register_get_v_code extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'c2s_register_get_v_code', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sPhoneNum', protoName: 'sPhoneNum')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sEmail', protoName: 'sEmail')
    ..hasRequiredFields = false
  ;

  c2s_register_get_v_code._() : super();
  factory c2s_register_get_v_code({
    $core.String? sPhoneNum,
    $core.String? sEmail,
  }) {
    final _result = create();
    if (sPhoneNum != null) {
      _result.sPhoneNum = sPhoneNum;
    }
    if (sEmail != null) {
      _result.sEmail = sEmail;
    }
    return _result;
  }
  factory c2s_register_get_v_code.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory c2s_register_get_v_code.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  c2s_register_get_v_code clone() => c2s_register_get_v_code()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  c2s_register_get_v_code copyWith(void Function(c2s_register_get_v_code) updates) => super.copyWith((message) => updates(message as c2s_register_get_v_code)) as c2s_register_get_v_code; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static c2s_register_get_v_code create() => c2s_register_get_v_code._();
  c2s_register_get_v_code createEmptyInstance() => create();
  static $pb.PbList<c2s_register_get_v_code> createRepeated() => $pb.PbList<c2s_register_get_v_code>();
  @$core.pragma('dart2js:noInline')
  static c2s_register_get_v_code getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<c2s_register_get_v_code>(create);
  static c2s_register_get_v_code? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sPhoneNum => $_getSZ(0);
  @$pb.TagNumber(1)
  set sPhoneNum($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSPhoneNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearSPhoneNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sEmail => $_getSZ(1);
  @$pb.TagNumber(2)
  set sEmail($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearSEmail() => clearField(2);
}

class s2c_register_get_v_code extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 's2c_register_get_v_code', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..e<$1.response_code>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eCode', $pb.PbFieldType.OE, protoName: 'eCode', defaultOrMaker: $1.response_code.normal, valueOf: $1.response_code.valueOf, enumValues: $1.response_code.values)
    ..hasRequiredFields = false
  ;

  s2c_register_get_v_code._() : super();
  factory s2c_register_get_v_code({
    $1.response_code? eCode,
  }) {
    final _result = create();
    if (eCode != null) {
      _result.eCode = eCode;
    }
    return _result;
  }
  factory s2c_register_get_v_code.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory s2c_register_get_v_code.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  s2c_register_get_v_code clone() => s2c_register_get_v_code()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  s2c_register_get_v_code copyWith(void Function(s2c_register_get_v_code) updates) => super.copyWith((message) => updates(message as s2c_register_get_v_code)) as s2c_register_get_v_code; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static s2c_register_get_v_code create() => s2c_register_get_v_code._();
  s2c_register_get_v_code createEmptyInstance() => create();
  static $pb.PbList<s2c_register_get_v_code> createRepeated() => $pb.PbList<s2c_register_get_v_code>();
  @$core.pragma('dart2js:noInline')
  static s2c_register_get_v_code getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<s2c_register_get_v_code>(create);
  static s2c_register_get_v_code? _defaultInstance;

  @$pb.TagNumber(1)
  $1.response_code get eCode => $_getN(0);
  @$pb.TagNumber(1)
  set eCode($1.response_code v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasECode() => $_has(0);
  @$pb.TagNumber(1)
  void clearECode() => clearField(1);
}

class c2s_register extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'c2s_register', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sPhoneNum', protoName: 'sPhoneNum')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sEmail', protoName: 'sEmail')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sPassword', protoName: 'sPassword')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iVCode', $pb.PbFieldType.O3, protoName: 'iVCode')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iChannelID', $pb.PbFieldType.O3, protoName: 'iChannelID')
    ..hasRequiredFields = false
  ;

  c2s_register._() : super();
  factory c2s_register({
    $core.String? sPhoneNum,
    $core.String? sEmail,
    $core.String? sPassword,
    $core.int? iVCode,
    $core.int? iChannelID,
  }) {
    final _result = create();
    if (sPhoneNum != null) {
      _result.sPhoneNum = sPhoneNum;
    }
    if (sEmail != null) {
      _result.sEmail = sEmail;
    }
    if (sPassword != null) {
      _result.sPassword = sPassword;
    }
    if (iVCode != null) {
      _result.iVCode = iVCode;
    }
    if (iChannelID != null) {
      _result.iChannelID = iChannelID;
    }
    return _result;
  }
  factory c2s_register.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory c2s_register.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  c2s_register clone() => c2s_register()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  c2s_register copyWith(void Function(c2s_register) updates) => super.copyWith((message) => updates(message as c2s_register)) as c2s_register; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static c2s_register create() => c2s_register._();
  c2s_register createEmptyInstance() => create();
  static $pb.PbList<c2s_register> createRepeated() => $pb.PbList<c2s_register>();
  @$core.pragma('dart2js:noInline')
  static c2s_register getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<c2s_register>(create);
  static c2s_register? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sPhoneNum => $_getSZ(0);
  @$pb.TagNumber(1)
  set sPhoneNum($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSPhoneNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearSPhoneNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sEmail => $_getSZ(1);
  @$pb.TagNumber(2)
  set sEmail($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearSEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sPassword => $_getSZ(2);
  @$pb.TagNumber(3)
  set sPassword($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearSPassword() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get iVCode => $_getIZ(3);
  @$pb.TagNumber(4)
  set iVCode($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIVCode() => $_has(3);
  @$pb.TagNumber(4)
  void clearIVCode() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get iChannelID => $_getIZ(4);
  @$pb.TagNumber(5)
  set iChannelID($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIChannelID() => $_has(4);
  @$pb.TagNumber(5)
  void clearIChannelID() => clearField(5);
}

class s2c_register extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 's2c_register', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..e<$1.response_code>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eCode', $pb.PbFieldType.OE, protoName: 'eCode', defaultOrMaker: $1.response_code.normal, valueOf: $1.response_code.valueOf, enumValues: $1.response_code.values)
    ..hasRequiredFields = false
  ;

  s2c_register._() : super();
  factory s2c_register({
    $1.response_code? eCode,
  }) {
    final _result = create();
    if (eCode != null) {
      _result.eCode = eCode;
    }
    return _result;
  }
  factory s2c_register.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory s2c_register.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  s2c_register clone() => s2c_register()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  s2c_register copyWith(void Function(s2c_register) updates) => super.copyWith((message) => updates(message as s2c_register)) as s2c_register; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static s2c_register create() => s2c_register._();
  s2c_register createEmptyInstance() => create();
  static $pb.PbList<s2c_register> createRepeated() => $pb.PbList<s2c_register>();
  @$core.pragma('dart2js:noInline')
  static s2c_register getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<s2c_register>(create);
  static s2c_register? _defaultInstance;

  @$pb.TagNumber(1)
  $1.response_code get eCode => $_getN(0);
  @$pb.TagNumber(1)
  set eCode($1.response_code v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasECode() => $_has(0);
  @$pb.TagNumber(1)
  void clearECode() => clearField(1);
}

class c2s_forget_password_get_v_code extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'c2s_forget_password_get_v_code', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sPhoneNum', protoName: 'sPhoneNum')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sEmail', protoName: 'sEmail')
    ..hasRequiredFields = false
  ;

  c2s_forget_password_get_v_code._() : super();
  factory c2s_forget_password_get_v_code({
    $core.String? sPhoneNum,
    $core.String? sEmail,
  }) {
    final _result = create();
    if (sPhoneNum != null) {
      _result.sPhoneNum = sPhoneNum;
    }
    if (sEmail != null) {
      _result.sEmail = sEmail;
    }
    return _result;
  }
  factory c2s_forget_password_get_v_code.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory c2s_forget_password_get_v_code.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  c2s_forget_password_get_v_code clone() => c2s_forget_password_get_v_code()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  c2s_forget_password_get_v_code copyWith(void Function(c2s_forget_password_get_v_code) updates) => super.copyWith((message) => updates(message as c2s_forget_password_get_v_code)) as c2s_forget_password_get_v_code; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static c2s_forget_password_get_v_code create() => c2s_forget_password_get_v_code._();
  c2s_forget_password_get_v_code createEmptyInstance() => create();
  static $pb.PbList<c2s_forget_password_get_v_code> createRepeated() => $pb.PbList<c2s_forget_password_get_v_code>();
  @$core.pragma('dart2js:noInline')
  static c2s_forget_password_get_v_code getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<c2s_forget_password_get_v_code>(create);
  static c2s_forget_password_get_v_code? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sPhoneNum => $_getSZ(0);
  @$pb.TagNumber(1)
  set sPhoneNum($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSPhoneNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearSPhoneNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sEmail => $_getSZ(1);
  @$pb.TagNumber(2)
  set sEmail($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearSEmail() => clearField(2);
}

class s2c_forget_password_get_v_code extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 's2c_forget_password_get_v_code', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..e<$1.response_code>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eCode', $pb.PbFieldType.OE, protoName: 'eCode', defaultOrMaker: $1.response_code.normal, valueOf: $1.response_code.valueOf, enumValues: $1.response_code.values)
    ..hasRequiredFields = false
  ;

  s2c_forget_password_get_v_code._() : super();
  factory s2c_forget_password_get_v_code({
    $1.response_code? eCode,
  }) {
    final _result = create();
    if (eCode != null) {
      _result.eCode = eCode;
    }
    return _result;
  }
  factory s2c_forget_password_get_v_code.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory s2c_forget_password_get_v_code.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  s2c_forget_password_get_v_code clone() => s2c_forget_password_get_v_code()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  s2c_forget_password_get_v_code copyWith(void Function(s2c_forget_password_get_v_code) updates) => super.copyWith((message) => updates(message as s2c_forget_password_get_v_code)) as s2c_forget_password_get_v_code; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static s2c_forget_password_get_v_code create() => s2c_forget_password_get_v_code._();
  s2c_forget_password_get_v_code createEmptyInstance() => create();
  static $pb.PbList<s2c_forget_password_get_v_code> createRepeated() => $pb.PbList<s2c_forget_password_get_v_code>();
  @$core.pragma('dart2js:noInline')
  static s2c_forget_password_get_v_code getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<s2c_forget_password_get_v_code>(create);
  static s2c_forget_password_get_v_code? _defaultInstance;

  @$pb.TagNumber(1)
  $1.response_code get eCode => $_getN(0);
  @$pb.TagNumber(1)
  set eCode($1.response_code v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasECode() => $_has(0);
  @$pb.TagNumber(1)
  void clearECode() => clearField(1);
}

class c2s_forget_password extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'c2s_forget_password', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iVCode', $pb.PbFieldType.O3, protoName: 'iVCode')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sPhoneNum', protoName: 'sPhoneNum')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sEmail', protoName: 'sEmail')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sPassword', protoName: 'sPassword')
    ..hasRequiredFields = false
  ;

  c2s_forget_password._() : super();
  factory c2s_forget_password({
    $core.int? iVCode,
    $core.String? sPhoneNum,
    $core.String? sEmail,
    $core.String? sPassword,
  }) {
    final _result = create();
    if (iVCode != null) {
      _result.iVCode = iVCode;
    }
    if (sPhoneNum != null) {
      _result.sPhoneNum = sPhoneNum;
    }
    if (sEmail != null) {
      _result.sEmail = sEmail;
    }
    if (sPassword != null) {
      _result.sPassword = sPassword;
    }
    return _result;
  }
  factory c2s_forget_password.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory c2s_forget_password.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  c2s_forget_password clone() => c2s_forget_password()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  c2s_forget_password copyWith(void Function(c2s_forget_password) updates) => super.copyWith((message) => updates(message as c2s_forget_password)) as c2s_forget_password; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static c2s_forget_password create() => c2s_forget_password._();
  c2s_forget_password createEmptyInstance() => create();
  static $pb.PbList<c2s_forget_password> createRepeated() => $pb.PbList<c2s_forget_password>();
  @$core.pragma('dart2js:noInline')
  static c2s_forget_password getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<c2s_forget_password>(create);
  static c2s_forget_password? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get iVCode => $_getIZ(0);
  @$pb.TagNumber(1)
  set iVCode($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIVCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearIVCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sPhoneNum => $_getSZ(1);
  @$pb.TagNumber(2)
  set sPhoneNum($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSPhoneNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearSPhoneNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sEmail => $_getSZ(2);
  @$pb.TagNumber(3)
  set sEmail($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearSEmail() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sPassword => $_getSZ(3);
  @$pb.TagNumber(4)
  set sPassword($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSPassword() => $_has(3);
  @$pb.TagNumber(4)
  void clearSPassword() => clearField(4);
}

class s2c_forget_password extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 's2c_forget_password', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..e<$1.response_code>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eCode', $pb.PbFieldType.OE, protoName: 'eCode', defaultOrMaker: $1.response_code.normal, valueOf: $1.response_code.valueOf, enumValues: $1.response_code.values)
    ..hasRequiredFields = false
  ;

  s2c_forget_password._() : super();
  factory s2c_forget_password({
    $1.response_code? eCode,
  }) {
    final _result = create();
    if (eCode != null) {
      _result.eCode = eCode;
    }
    return _result;
  }
  factory s2c_forget_password.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory s2c_forget_password.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  s2c_forget_password clone() => s2c_forget_password()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  s2c_forget_password copyWith(void Function(s2c_forget_password) updates) => super.copyWith((message) => updates(message as s2c_forget_password)) as s2c_forget_password; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static s2c_forget_password create() => s2c_forget_password._();
  s2c_forget_password createEmptyInstance() => create();
  static $pb.PbList<s2c_forget_password> createRepeated() => $pb.PbList<s2c_forget_password>();
  @$core.pragma('dart2js:noInline')
  static s2c_forget_password getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<s2c_forget_password>(create);
  static s2c_forget_password? _defaultInstance;

  @$pb.TagNumber(1)
  $1.response_code get eCode => $_getN(0);
  @$pb.TagNumber(1)
  set eCode($1.response_code v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasECode() => $_has(0);
  @$pb.TagNumber(1)
  void clearECode() => clearField(1);
}

class c2s_login_meta extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'c2s_login_meta', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  c2s_login_meta._() : super();
  factory c2s_login_meta() => create();
  factory c2s_login_meta.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory c2s_login_meta.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  c2s_login_meta clone() => c2s_login_meta()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  c2s_login_meta copyWith(void Function(c2s_login_meta) updates) => super.copyWith((message) => updates(message as c2s_login_meta)) as c2s_login_meta; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static c2s_login_meta create() => c2s_login_meta._();
  c2s_login_meta createEmptyInstance() => create();
  static $pb.PbList<c2s_login_meta> createRepeated() => $pb.PbList<c2s_login_meta>();
  @$core.pragma('dart2js:noInline')
  static c2s_login_meta getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<c2s_login_meta>(create);
  static c2s_login_meta? _defaultInstance;
}

class s2c_login_meta extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 's2c_login_meta', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..aOM<$0.msg_cube_show>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'myCube', protoName: 'myCube', subBuilder: $0.msg_cube_show.create)
    ..hasRequiredFields = false
  ;

  s2c_login_meta._() : super();
  factory s2c_login_meta({
    $0.msg_cube_show? myCube,
  }) {
    final _result = create();
    if (myCube != null) {
      _result.myCube = myCube;
    }
    return _result;
  }
  factory s2c_login_meta.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory s2c_login_meta.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  s2c_login_meta clone() => s2c_login_meta()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  s2c_login_meta copyWith(void Function(s2c_login_meta) updates) => super.copyWith((message) => updates(message as s2c_login_meta)) as s2c_login_meta; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static s2c_login_meta create() => s2c_login_meta._();
  s2c_login_meta createEmptyInstance() => create();
  static $pb.PbList<s2c_login_meta> createRepeated() => $pb.PbList<s2c_login_meta>();
  @$core.pragma('dart2js:noInline')
  static s2c_login_meta getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<s2c_login_meta>(create);
  static s2c_login_meta? _defaultInstance;

  @$pb.TagNumber(1)
  $0.msg_cube_show get myCube => $_getN(0);
  @$pb.TagNumber(1)
  set myCube($0.msg_cube_show v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMyCube() => $_has(0);
  @$pb.TagNumber(1)
  void clearMyCube() => clearField(1);
  @$pb.TagNumber(1)
  $0.msg_cube_show ensureMyCube() => $_ensure(0);
}

class s2c_login_again extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 's2c_login_again', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  s2c_login_again._() : super();
  factory s2c_login_again() => create();
  factory s2c_login_again.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory s2c_login_again.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  s2c_login_again clone() => s2c_login_again()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  s2c_login_again copyWith(void Function(s2c_login_again) updates) => super.copyWith((message) => updates(message as s2c_login_again)) as s2c_login_again; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static s2c_login_again create() => s2c_login_again._();
  s2c_login_again createEmptyInstance() => create();
  static $pb.PbList<s2c_login_again> createRepeated() => $pb.PbList<s2c_login_again>();
  @$core.pragma('dart2js:noInline')
  static s2c_login_again getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<s2c_login_again>(create);
  static s2c_login_again? _defaultInstance;
}

class c2s_login_user_id extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'c2s_login_user_id', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iUserID', protoName: 'iUserID')
    ..hasRequiredFields = false
  ;

  c2s_login_user_id._() : super();
  factory c2s_login_user_id({
    $fixnum.Int64? iUserID,
  }) {
    final _result = create();
    if (iUserID != null) {
      _result.iUserID = iUserID;
    }
    return _result;
  }
  factory c2s_login_user_id.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory c2s_login_user_id.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  c2s_login_user_id clone() => c2s_login_user_id()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  c2s_login_user_id copyWith(void Function(c2s_login_user_id) updates) => super.copyWith((message) => updates(message as c2s_login_user_id)) as c2s_login_user_id; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static c2s_login_user_id create() => c2s_login_user_id._();
  c2s_login_user_id createEmptyInstance() => create();
  static $pb.PbList<c2s_login_user_id> createRepeated() => $pb.PbList<c2s_login_user_id>();
  @$core.pragma('dart2js:noInline')
  static c2s_login_user_id getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<c2s_login_user_id>(create);
  static c2s_login_user_id? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get iUserID => $_getI64(0);
  @$pb.TagNumber(1)
  set iUserID($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearIUserID() => clearField(1);
}

class s2c_login_user_id extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 's2c_login_user_id', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..e<$1.response_code>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eCode', $pb.PbFieldType.OE, protoName: 'eCode', defaultOrMaker: $1.response_code.normal, valueOf: $1.response_code.valueOf, enumValues: $1.response_code.values)
    ..hasRequiredFields = false
  ;

  s2c_login_user_id._() : super();
  factory s2c_login_user_id({
    $1.response_code? eCode,
  }) {
    final _result = create();
    if (eCode != null) {
      _result.eCode = eCode;
    }
    return _result;
  }
  factory s2c_login_user_id.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory s2c_login_user_id.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  s2c_login_user_id clone() => s2c_login_user_id()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  s2c_login_user_id copyWith(void Function(s2c_login_user_id) updates) => super.copyWith((message) => updates(message as s2c_login_user_id)) as s2c_login_user_id; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static s2c_login_user_id create() => s2c_login_user_id._();
  s2c_login_user_id createEmptyInstance() => create();
  static $pb.PbList<s2c_login_user_id> createRepeated() => $pb.PbList<s2c_login_user_id>();
  @$core.pragma('dart2js:noInline')
  static s2c_login_user_id getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<s2c_login_user_id>(create);
  static s2c_login_user_id? _defaultInstance;

  @$pb.TagNumber(1)
  $1.response_code get eCode => $_getN(0);
  @$pb.TagNumber(1)
  set eCode($1.response_code v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasECode() => $_has(0);
  @$pb.TagNumber(1)
  void clearECode() => clearField(1);
}

class s2c_logout extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 's2c_logout', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..e<s2c_logout_logout_type>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eType', $pb.PbFieldType.OE, protoName: 'eType', defaultOrMaker: s2c_logout_logout_type.normal, valueOf: s2c_logout_logout_type.valueOf, enumValues: s2c_logout_logout_type.values)
    ..hasRequiredFields = false
  ;

  s2c_logout._() : super();
  factory s2c_logout({
    s2c_logout_logout_type? eType,
  }) {
    final _result = create();
    if (eType != null) {
      _result.eType = eType;
    }
    return _result;
  }
  factory s2c_logout.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory s2c_logout.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  s2c_logout clone() => s2c_logout()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  s2c_logout copyWith(void Function(s2c_logout) updates) => super.copyWith((message) => updates(message as s2c_logout)) as s2c_logout; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static s2c_logout create() => s2c_logout._();
  s2c_logout createEmptyInstance() => create();
  static $pb.PbList<s2c_logout> createRepeated() => $pb.PbList<s2c_logout>();
  @$core.pragma('dart2js:noInline')
  static s2c_logout getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<s2c_logout>(create);
  static s2c_logout? _defaultInstance;

  @$pb.TagNumber(1)
  s2c_logout_logout_type get eType => $_getN(0);
  @$pb.TagNumber(1)
  set eType(s2c_logout_logout_type v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEType() => $_has(0);
  @$pb.TagNumber(1)
  void clearEType() => clearField(1);
}

class s2c_login_success extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 's2c_login_success', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iToken', $pb.PbFieldType.OU3, protoName: 'iToken')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iExpireTime', $pb.PbFieldType.O3, protoName: 'iExpireTime')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bSetPassword', protoName: 'bSetPassword')
    ..aOM<$0.msg_account_info>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mAccountInfo', protoName: 'mAccountInfo', subBuilder: $0.msg_account_info.create)
    ..hasRequiredFields = false
  ;

  s2c_login_success._() : super();
  factory s2c_login_success({
    $core.int? iToken,
    $core.int? iExpireTime,
    $core.bool? bSetPassword,
    $0.msg_account_info? mAccountInfo,
  }) {
    final _result = create();
    if (iToken != null) {
      _result.iToken = iToken;
    }
    if (iExpireTime != null) {
      _result.iExpireTime = iExpireTime;
    }
    if (bSetPassword != null) {
      _result.bSetPassword = bSetPassword;
    }
    if (mAccountInfo != null) {
      _result.mAccountInfo = mAccountInfo;
    }
    return _result;
  }
  factory s2c_login_success.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory s2c_login_success.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  s2c_login_success clone() => s2c_login_success()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  s2c_login_success copyWith(void Function(s2c_login_success) updates) => super.copyWith((message) => updates(message as s2c_login_success)) as s2c_login_success; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static s2c_login_success create() => s2c_login_success._();
  s2c_login_success createEmptyInstance() => create();
  static $pb.PbList<s2c_login_success> createRepeated() => $pb.PbList<s2c_login_success>();
  @$core.pragma('dart2js:noInline')
  static s2c_login_success getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<s2c_login_success>(create);
  static s2c_login_success? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get iToken => $_getIZ(0);
  @$pb.TagNumber(1)
  set iToken($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearIToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get iExpireTime => $_getIZ(1);
  @$pb.TagNumber(2)
  set iExpireTime($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIExpireTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearIExpireTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get bSetPassword => $_getBF(2);
  @$pb.TagNumber(3)
  set bSetPassword($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBSetPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearBSetPassword() => clearField(3);

  @$pb.TagNumber(4)
  $0.msg_account_info get mAccountInfo => $_getN(3);
  @$pb.TagNumber(4)
  set mAccountInfo($0.msg_account_info v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasMAccountInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearMAccountInfo() => clearField(4);
  @$pb.TagNumber(4)
  $0.msg_account_info ensureMAccountInfo() => $_ensure(3);
}

class c2s_origin extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'c2s_origin', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iTimeZone', $pb.PbFieldType.O3, protoName: 'iTimeZone')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iChannelID', $pb.PbFieldType.O3, protoName: 'iChannelID')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iTerminalType', $pb.PbFieldType.O3, protoName: 'iTerminalType')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sTerminalName', protoName: 'sTerminalName')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sMachineCode', protoName: 'sMachineCode')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iTerminalVersion', protoName: 'iTerminalVersion')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sTerminalVendor', protoName: 'sTerminalVendor')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sTerminalSize', protoName: 'sTerminalSize')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sTerminalCPU', protoName: 'sTerminalCPU')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clientVersion', protoName: 'clientVersion')
    ..a<$core.int>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'networkType', $pb.PbFieldType.O3, protoName: 'networkType')
    ..hasRequiredFields = false
  ;

  c2s_origin._() : super();
  factory c2s_origin({
    $core.int? iTimeZone,
    $core.int? iChannelID,
    $core.int? iTerminalType,
    $core.String? sTerminalName,
    $core.String? sMachineCode,
    $core.String? iTerminalVersion,
    $core.String? sTerminalVendor,
    $core.String? sTerminalSize,
    $core.String? sTerminalCPU,
    $core.String? clientVersion,
    $core.int? networkType,
  }) {
    final _result = create();
    if (iTimeZone != null) {
      _result.iTimeZone = iTimeZone;
    }
    if (iChannelID != null) {
      _result.iChannelID = iChannelID;
    }
    if (iTerminalType != null) {
      _result.iTerminalType = iTerminalType;
    }
    if (sTerminalName != null) {
      _result.sTerminalName = sTerminalName;
    }
    if (sMachineCode != null) {
      _result.sMachineCode = sMachineCode;
    }
    if (iTerminalVersion != null) {
      _result.iTerminalVersion = iTerminalVersion;
    }
    if (sTerminalVendor != null) {
      _result.sTerminalVendor = sTerminalVendor;
    }
    if (sTerminalSize != null) {
      _result.sTerminalSize = sTerminalSize;
    }
    if (sTerminalCPU != null) {
      _result.sTerminalCPU = sTerminalCPU;
    }
    if (clientVersion != null) {
      _result.clientVersion = clientVersion;
    }
    if (networkType != null) {
      _result.networkType = networkType;
    }
    return _result;
  }
  factory c2s_origin.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory c2s_origin.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  c2s_origin clone() => c2s_origin()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  c2s_origin copyWith(void Function(c2s_origin) updates) => super.copyWith((message) => updates(message as c2s_origin)) as c2s_origin; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static c2s_origin create() => c2s_origin._();
  c2s_origin createEmptyInstance() => create();
  static $pb.PbList<c2s_origin> createRepeated() => $pb.PbList<c2s_origin>();
  @$core.pragma('dart2js:noInline')
  static c2s_origin getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<c2s_origin>(create);
  static c2s_origin? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get iTimeZone => $_getIZ(0);
  @$pb.TagNumber(1)
  set iTimeZone($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasITimeZone() => $_has(0);
  @$pb.TagNumber(1)
  void clearITimeZone() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get iChannelID => $_getIZ(1);
  @$pb.TagNumber(2)
  set iChannelID($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIChannelID() => $_has(1);
  @$pb.TagNumber(2)
  void clearIChannelID() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get iTerminalType => $_getIZ(2);
  @$pb.TagNumber(3)
  set iTerminalType($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasITerminalType() => $_has(2);
  @$pb.TagNumber(3)
  void clearITerminalType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sTerminalName => $_getSZ(3);
  @$pb.TagNumber(4)
  set sTerminalName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSTerminalName() => $_has(3);
  @$pb.TagNumber(4)
  void clearSTerminalName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get sMachineCode => $_getSZ(4);
  @$pb.TagNumber(5)
  set sMachineCode($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSMachineCode() => $_has(4);
  @$pb.TagNumber(5)
  void clearSMachineCode() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get iTerminalVersion => $_getSZ(5);
  @$pb.TagNumber(6)
  set iTerminalVersion($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasITerminalVersion() => $_has(5);
  @$pb.TagNumber(6)
  void clearITerminalVersion() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get sTerminalVendor => $_getSZ(6);
  @$pb.TagNumber(7)
  set sTerminalVendor($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSTerminalVendor() => $_has(6);
  @$pb.TagNumber(7)
  void clearSTerminalVendor() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get sTerminalSize => $_getSZ(7);
  @$pb.TagNumber(8)
  set sTerminalSize($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasSTerminalSize() => $_has(7);
  @$pb.TagNumber(8)
  void clearSTerminalSize() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get sTerminalCPU => $_getSZ(8);
  @$pb.TagNumber(9)
  set sTerminalCPU($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSTerminalCPU() => $_has(8);
  @$pb.TagNumber(9)
  void clearSTerminalCPU() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get clientVersion => $_getSZ(9);
  @$pb.TagNumber(10)
  set clientVersion($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasClientVersion() => $_has(9);
  @$pb.TagNumber(10)
  void clearClientVersion() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get networkType => $_getIZ(10);
  @$pb.TagNumber(11)
  set networkType($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasNetworkType() => $_has(10);
  @$pb.TagNumber(11)
  void clearNetworkType() => clearField(11);
}

class s2c_origin extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 's2c_origin', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timestamp')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sIPCountry', protoName: 'sIPCountry')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sIPProvince', protoName: 'sIPProvince')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sIPCity', protoName: 'sIPCity')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sIp', protoName: 'sIp')
    ..hasRequiredFields = false
  ;

  s2c_origin._() : super();
  factory s2c_origin({
    $fixnum.Int64? timestamp,
    $core.String? sIPCountry,
    $core.String? sIPProvince,
    $core.String? sIPCity,
    $core.String? sIp,
  }) {
    final _result = create();
    if (timestamp != null) {
      _result.timestamp = timestamp;
    }
    if (sIPCountry != null) {
      _result.sIPCountry = sIPCountry;
    }
    if (sIPProvince != null) {
      _result.sIPProvince = sIPProvince;
    }
    if (sIPCity != null) {
      _result.sIPCity = sIPCity;
    }
    if (sIp != null) {
      _result.sIp = sIp;
    }
    return _result;
  }
  factory s2c_origin.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory s2c_origin.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  s2c_origin clone() => s2c_origin()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  s2c_origin copyWith(void Function(s2c_origin) updates) => super.copyWith((message) => updates(message as s2c_origin)) as s2c_origin; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static s2c_origin create() => s2c_origin._();
  s2c_origin createEmptyInstance() => create();
  static $pb.PbList<s2c_origin> createRepeated() => $pb.PbList<s2c_origin>();
  @$core.pragma('dart2js:noInline')
  static s2c_origin getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<s2c_origin>(create);
  static s2c_origin? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get timestamp => $_getI64(0);
  @$pb.TagNumber(1)
  set timestamp($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestamp() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sIPCountry => $_getSZ(1);
  @$pb.TagNumber(2)
  set sIPCountry($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSIPCountry() => $_has(1);
  @$pb.TagNumber(2)
  void clearSIPCountry() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sIPProvince => $_getSZ(2);
  @$pb.TagNumber(3)
  set sIPProvince($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSIPProvince() => $_has(2);
  @$pb.TagNumber(3)
  void clearSIPProvince() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sIPCity => $_getSZ(3);
  @$pb.TagNumber(4)
  set sIPCity($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSIPCity() => $_has(3);
  @$pb.TagNumber(4)
  void clearSIPCity() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get sIp => $_getSZ(4);
  @$pb.TagNumber(5)
  set sIp($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSIp() => $_has(4);
  @$pb.TagNumber(5)
  void clearSIp() => clearField(5);
}

