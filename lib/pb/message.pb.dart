///
//  Generated code. Do not modify.
//  source: message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'message.pbenum.dart';

export 'message.pbenum.dart';

class msg_kv_ii extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_kv_ii', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iK', $pb.PbFieldType.O3, protoName: 'iK')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iV', $pb.PbFieldType.O3, protoName: 'iV')
    ..hasRequiredFields = false
  ;

  msg_kv_ii._() : super();
  factory msg_kv_ii({
    $core.int? iK,
    $core.int? iV,
  }) {
    final _result = create();
    if (iK != null) {
      _result.iK = iK;
    }
    if (iV != null) {
      _result.iV = iV;
    }
    return _result;
  }
  factory msg_kv_ii.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_kv_ii.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_kv_ii clone() => msg_kv_ii()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_kv_ii copyWith(void Function(msg_kv_ii) updates) => super.copyWith((message) => updates(message as msg_kv_ii)) as msg_kv_ii; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_kv_ii create() => msg_kv_ii._();
  msg_kv_ii createEmptyInstance() => create();
  static $pb.PbList<msg_kv_ii> createRepeated() => $pb.PbList<msg_kv_ii>();
  @$core.pragma('dart2js:noInline')
  static msg_kv_ii getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_kv_ii>(create);
  static msg_kv_ii? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get iK => $_getIZ(0);
  @$pb.TagNumber(1)
  set iK($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIK() => $_has(0);
  @$pb.TagNumber(1)
  void clearIK() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get iV => $_getIZ(1);
  @$pb.TagNumber(2)
  set iV($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIV() => $_has(1);
  @$pb.TagNumber(2)
  void clearIV() => clearField(2);
}

class msg_kv_si extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_kv_si', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sK', protoName: 'sK')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iV', $pb.PbFieldType.O3, protoName: 'iV')
    ..hasRequiredFields = false
  ;

  msg_kv_si._() : super();
  factory msg_kv_si({
    $core.String? sK,
    $core.int? iV,
  }) {
    final _result = create();
    if (sK != null) {
      _result.sK = sK;
    }
    if (iV != null) {
      _result.iV = iV;
    }
    return _result;
  }
  factory msg_kv_si.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_kv_si.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_kv_si clone() => msg_kv_si()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_kv_si copyWith(void Function(msg_kv_si) updates) => super.copyWith((message) => updates(message as msg_kv_si)) as msg_kv_si; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_kv_si create() => msg_kv_si._();
  msg_kv_si createEmptyInstance() => create();
  static $pb.PbList<msg_kv_si> createRepeated() => $pb.PbList<msg_kv_si>();
  @$core.pragma('dart2js:noInline')
  static msg_kv_si getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_kv_si>(create);
  static msg_kv_si? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sK => $_getSZ(0);
  @$pb.TagNumber(1)
  set sK($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSK() => $_has(0);
  @$pb.TagNumber(1)
  void clearSK() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get iV => $_getIZ(1);
  @$pb.TagNumber(2)
  set iV($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIV() => $_has(1);
  @$pb.TagNumber(2)
  void clearIV() => clearField(2);
}

class msg_award_item extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_award_item', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'num', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  msg_award_item._() : super();
  factory msg_award_item({
    $core.int? id,
    $core.int? num,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (num != null) {
      _result.num = num;
    }
    return _result;
  }
  factory msg_award_item.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_award_item.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_award_item clone() => msg_award_item()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_award_item copyWith(void Function(msg_award_item) updates) => super.copyWith((message) => updates(message as msg_award_item)) as msg_award_item; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_award_item create() => msg_award_item._();
  msg_award_item createEmptyInstance() => create();
  static $pb.PbList<msg_award_item> createRepeated() => $pb.PbList<msg_award_item>();
  @$core.pragma('dart2js:noInline')
  static msg_award_item getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_award_item>(create);
  static msg_award_item? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get num => $_getIZ(1);
  @$pb.TagNumber(2)
  set num($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearNum() => clearField(2);
}

class msg_player_base_info extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_player_base_info', createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iUserID', protoName: 'iUserID')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sNickName', protoName: 'sNickName')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sAvatar', protoName: 'sAvatar')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iAvatarBoxID', $pb.PbFieldType.O3, protoName: 'iAvatarBoxID')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iEnterEffectsID', $pb.PbFieldType.O3, protoName: 'iEnterEffectsID')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iRecoverEffectsID', $pb.PbFieldType.O3, protoName: 'iRecoverEffectsID')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iFlagID', $pb.PbFieldType.O3, protoName: 'iFlagID')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sSignature', protoName: 'sSignature')
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iStatus', $pb.PbFieldType.O3, protoName: 'iStatus')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sCity', protoName: 'sCity')
    ..a<$core.int>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iCompID', $pb.PbFieldType.O3, protoName: 'iCompID')
    ..pc<msg_equipment>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mEquipments', $pb.PbFieldType.PM, protoName: 'mEquipments', subBuilder: msg_equipment.create)
    ..a<$core.int>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iAccType', $pb.PbFieldType.O3, protoName: 'iAccType')
    ..a<$core.int>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iLogoutTime', $pb.PbFieldType.O3, protoName: 'iLogoutTime')
    ..a<$core.int>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iCertificateType', $pb.PbFieldType.O3, protoName: 'iCertificateType')
    ..aOS(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sCertificateCont', protoName: 'sCertificateCont')
    ..a<$core.int>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iCup', $pb.PbFieldType.O3, protoName: 'iCup')
    ..a<$core.int>(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iRoomID', $pb.PbFieldType.O3, protoName: 'iRoomID')
    ..aOB(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bIsClose', protoName: 'bIsClose')
    ..aOS(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sMajorNickName', protoName: 'sMajorNickName')
    ..a<$core.int>(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iTeamID', $pb.PbFieldType.O3, protoName: 'iTeamID')
    ..aOS(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sTeamName', protoName: 'sTeamName')
    ..hasRequiredFields = false
  ;

  msg_player_base_info._() : super();
  factory msg_player_base_info({
    $fixnum.Int64? iUserID,
    $core.String? sNickName,
    $core.String? sAvatar,
    $core.int? iAvatarBoxID,
    $core.int? iEnterEffectsID,
    $core.int? iRecoverEffectsID,
    $core.int? iFlagID,
    $core.String? sSignature,
    $core.int? iStatus,
    $core.String? sCity,
    $core.int? iCompID,
    $core.Iterable<msg_equipment>? mEquipments,
    $core.int? iAccType,
    $core.int? iLogoutTime,
    $core.int? iCertificateType,
    $core.String? sCertificateCont,
    $core.int? iCup,
    $core.int? iRoomID,
    $core.bool? bIsClose,
    $core.String? sMajorNickName,
    $core.int? iTeamID,
    $core.String? sTeamName,
  }) {
    final _result = create();
    if (iUserID != null) {
      _result.iUserID = iUserID;
    }
    if (sNickName != null) {
      _result.sNickName = sNickName;
    }
    if (sAvatar != null) {
      _result.sAvatar = sAvatar;
    }
    if (iAvatarBoxID != null) {
      _result.iAvatarBoxID = iAvatarBoxID;
    }
    if (iEnterEffectsID != null) {
      _result.iEnterEffectsID = iEnterEffectsID;
    }
    if (iRecoverEffectsID != null) {
      _result.iRecoverEffectsID = iRecoverEffectsID;
    }
    if (iFlagID != null) {
      _result.iFlagID = iFlagID;
    }
    if (sSignature != null) {
      _result.sSignature = sSignature;
    }
    if (iStatus != null) {
      _result.iStatus = iStatus;
    }
    if (sCity != null) {
      _result.sCity = sCity;
    }
    if (iCompID != null) {
      _result.iCompID = iCompID;
    }
    if (mEquipments != null) {
      _result.mEquipments.addAll(mEquipments);
    }
    if (iAccType != null) {
      _result.iAccType = iAccType;
    }
    if (iLogoutTime != null) {
      _result.iLogoutTime = iLogoutTime;
    }
    if (iCertificateType != null) {
      _result.iCertificateType = iCertificateType;
    }
    if (sCertificateCont != null) {
      _result.sCertificateCont = sCertificateCont;
    }
    if (iCup != null) {
      _result.iCup = iCup;
    }
    if (iRoomID != null) {
      _result.iRoomID = iRoomID;
    }
    if (bIsClose != null) {
      _result.bIsClose = bIsClose;
    }
    if (sMajorNickName != null) {
      _result.sMajorNickName = sMajorNickName;
    }
    if (iTeamID != null) {
      _result.iTeamID = iTeamID;
    }
    if (sTeamName != null) {
      _result.sTeamName = sTeamName;
    }
    return _result;
  }
  factory msg_player_base_info.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_player_base_info.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_player_base_info clone() => msg_player_base_info()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_player_base_info copyWith(void Function(msg_player_base_info) updates) => super.copyWith((message) => updates(message as msg_player_base_info)) as msg_player_base_info; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_player_base_info create() => msg_player_base_info._();
  msg_player_base_info createEmptyInstance() => create();
  static $pb.PbList<msg_player_base_info> createRepeated() => $pb.PbList<msg_player_base_info>();
  @$core.pragma('dart2js:noInline')
  static msg_player_base_info getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_player_base_info>(create);
  static msg_player_base_info? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get iUserID => $_getI64(0);
  @$pb.TagNumber(1)
  set iUserID($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearIUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sNickName => $_getSZ(1);
  @$pb.TagNumber(2)
  set sNickName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSNickName() => $_has(1);
  @$pb.TagNumber(2)
  void clearSNickName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sAvatar => $_getSZ(2);
  @$pb.TagNumber(3)
  set sAvatar($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSAvatar() => $_has(2);
  @$pb.TagNumber(3)
  void clearSAvatar() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get iAvatarBoxID => $_getIZ(3);
  @$pb.TagNumber(4)
  set iAvatarBoxID($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIAvatarBoxID() => $_has(3);
  @$pb.TagNumber(4)
  void clearIAvatarBoxID() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get iEnterEffectsID => $_getIZ(4);
  @$pb.TagNumber(5)
  set iEnterEffectsID($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIEnterEffectsID() => $_has(4);
  @$pb.TagNumber(5)
  void clearIEnterEffectsID() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get iRecoverEffectsID => $_getIZ(5);
  @$pb.TagNumber(6)
  set iRecoverEffectsID($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIRecoverEffectsID() => $_has(5);
  @$pb.TagNumber(6)
  void clearIRecoverEffectsID() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get iFlagID => $_getIZ(6);
  @$pb.TagNumber(7)
  set iFlagID($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIFlagID() => $_has(6);
  @$pb.TagNumber(7)
  void clearIFlagID() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get sSignature => $_getSZ(7);
  @$pb.TagNumber(8)
  set sSignature($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasSSignature() => $_has(7);
  @$pb.TagNumber(8)
  void clearSSignature() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get iStatus => $_getIZ(8);
  @$pb.TagNumber(9)
  set iStatus($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIStatus() => $_has(8);
  @$pb.TagNumber(9)
  void clearIStatus() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get sCity => $_getSZ(9);
  @$pb.TagNumber(10)
  set sCity($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasSCity() => $_has(9);
  @$pb.TagNumber(10)
  void clearSCity() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get iCompID => $_getIZ(10);
  @$pb.TagNumber(11)
  set iCompID($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasICompID() => $_has(10);
  @$pb.TagNumber(11)
  void clearICompID() => clearField(11);

  @$pb.TagNumber(12)
  $core.List<msg_equipment> get mEquipments => $_getList(11);

  @$pb.TagNumber(13)
  $core.int get iAccType => $_getIZ(12);
  @$pb.TagNumber(13)
  set iAccType($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasIAccType() => $_has(12);
  @$pb.TagNumber(13)
  void clearIAccType() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get iLogoutTime => $_getIZ(13);
  @$pb.TagNumber(14)
  set iLogoutTime($core.int v) { $_setSignedInt32(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasILogoutTime() => $_has(13);
  @$pb.TagNumber(14)
  void clearILogoutTime() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get iCertificateType => $_getIZ(14);
  @$pb.TagNumber(15)
  set iCertificateType($core.int v) { $_setSignedInt32(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasICertificateType() => $_has(14);
  @$pb.TagNumber(15)
  void clearICertificateType() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get sCertificateCont => $_getSZ(15);
  @$pb.TagNumber(16)
  set sCertificateCont($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasSCertificateCont() => $_has(15);
  @$pb.TagNumber(16)
  void clearSCertificateCont() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get iCup => $_getIZ(16);
  @$pb.TagNumber(17)
  set iCup($core.int v) { $_setSignedInt32(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasICup() => $_has(16);
  @$pb.TagNumber(17)
  void clearICup() => clearField(17);

  @$pb.TagNumber(18)
  $core.int get iRoomID => $_getIZ(17);
  @$pb.TagNumber(18)
  set iRoomID($core.int v) { $_setSignedInt32(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasIRoomID() => $_has(17);
  @$pb.TagNumber(18)
  void clearIRoomID() => clearField(18);

  @$pb.TagNumber(19)
  $core.bool get bIsClose => $_getBF(18);
  @$pb.TagNumber(19)
  set bIsClose($core.bool v) { $_setBool(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasBIsClose() => $_has(18);
  @$pb.TagNumber(19)
  void clearBIsClose() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get sMajorNickName => $_getSZ(19);
  @$pb.TagNumber(20)
  set sMajorNickName($core.String v) { $_setString(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasSMajorNickName() => $_has(19);
  @$pb.TagNumber(20)
  void clearSMajorNickName() => clearField(20);

  @$pb.TagNumber(21)
  $core.int get iTeamID => $_getIZ(20);
  @$pb.TagNumber(21)
  set iTeamID($core.int v) { $_setSignedInt32(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasITeamID() => $_has(20);
  @$pb.TagNumber(21)
  void clearITeamID() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get sTeamName => $_getSZ(21);
  @$pb.TagNumber(22)
  set sTeamName($core.String v) { $_setString(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasSTeamName() => $_has(21);
  @$pb.TagNumber(22)
  void clearSTeamName() => clearField(22);
}

class msg_account_info extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_account_info', createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iUserID', protoName: 'iUserID')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sPhone', protoName: 'sPhone')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iPhoneBindTime', $pb.PbFieldType.O3, protoName: 'iPhoneBindTime')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sEmail', protoName: 'sEmail')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iEmailBindTime', $pb.PbFieldType.O3, protoName: 'iEmailBindTime')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bCloseStatus', protoName: 'bCloseStatus')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sAvatar', protoName: 'sAvatar')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sWechatName', protoName: 'sWechatName')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sQQName', protoName: 'sQQName')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sFacebookName', protoName: 'sFacebookName')
    ..a<$core.int>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iCloseStatus', $pb.PbFieldType.O3, protoName: 'iCloseStatus')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sNickName', protoName: 'sNickName')
    ..aOS(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sCountry', protoName: 'sCountry')
    ..aOS(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sProvince', protoName: 'sProvince')
    ..a<$core.int>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iRegTime', $pb.PbFieldType.O3, protoName: 'iRegTime')
    ..aOS(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sCity', protoName: 'sCity')
    ..hasRequiredFields = false
  ;

  msg_account_info._() : super();
  factory msg_account_info({
    $fixnum.Int64? iUserID,
    $core.String? sPhone,
    $core.int? iPhoneBindTime,
    $core.String? sEmail,
    $core.int? iEmailBindTime,
    $core.bool? bCloseStatus,
    $core.String? sAvatar,
    $core.String? sWechatName,
    $core.String? sQQName,
    $core.String? sFacebookName,
    $core.int? iCloseStatus,
    $core.String? sNickName,
    $core.String? sCountry,
    $core.String? sProvince,
    $core.int? iRegTime,
    $core.String? sCity,
  }) {
    final _result = create();
    if (iUserID != null) {
      _result.iUserID = iUserID;
    }
    if (sPhone != null) {
      _result.sPhone = sPhone;
    }
    if (iPhoneBindTime != null) {
      _result.iPhoneBindTime = iPhoneBindTime;
    }
    if (sEmail != null) {
      _result.sEmail = sEmail;
    }
    if (iEmailBindTime != null) {
      _result.iEmailBindTime = iEmailBindTime;
    }
    if (bCloseStatus != null) {
      _result.bCloseStatus = bCloseStatus;
    }
    if (sAvatar != null) {
      _result.sAvatar = sAvatar;
    }
    if (sWechatName != null) {
      _result.sWechatName = sWechatName;
    }
    if (sQQName != null) {
      _result.sQQName = sQQName;
    }
    if (sFacebookName != null) {
      _result.sFacebookName = sFacebookName;
    }
    if (iCloseStatus != null) {
      _result.iCloseStatus = iCloseStatus;
    }
    if (sNickName != null) {
      _result.sNickName = sNickName;
    }
    if (sCountry != null) {
      _result.sCountry = sCountry;
    }
    if (sProvince != null) {
      _result.sProvince = sProvince;
    }
    if (iRegTime != null) {
      _result.iRegTime = iRegTime;
    }
    if (sCity != null) {
      _result.sCity = sCity;
    }
    return _result;
  }
  factory msg_account_info.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_account_info.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_account_info clone() => msg_account_info()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_account_info copyWith(void Function(msg_account_info) updates) => super.copyWith((message) => updates(message as msg_account_info)) as msg_account_info; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_account_info create() => msg_account_info._();
  msg_account_info createEmptyInstance() => create();
  static $pb.PbList<msg_account_info> createRepeated() => $pb.PbList<msg_account_info>();
  @$core.pragma('dart2js:noInline')
  static msg_account_info getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_account_info>(create);
  static msg_account_info? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get iUserID => $_getI64(0);
  @$pb.TagNumber(1)
  set iUserID($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearIUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sPhone => $_getSZ(1);
  @$pb.TagNumber(2)
  set sPhone($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSPhone() => $_has(1);
  @$pb.TagNumber(2)
  void clearSPhone() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get iPhoneBindTime => $_getIZ(2);
  @$pb.TagNumber(3)
  set iPhoneBindTime($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIPhoneBindTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearIPhoneBindTime() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sEmail => $_getSZ(3);
  @$pb.TagNumber(4)
  set sEmail($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearSEmail() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get iEmailBindTime => $_getIZ(4);
  @$pb.TagNumber(5)
  set iEmailBindTime($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIEmailBindTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearIEmailBindTime() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get bCloseStatus => $_getBF(5);
  @$pb.TagNumber(6)
  set bCloseStatus($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasBCloseStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearBCloseStatus() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get sAvatar => $_getSZ(6);
  @$pb.TagNumber(7)
  set sAvatar($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSAvatar() => $_has(6);
  @$pb.TagNumber(7)
  void clearSAvatar() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get sWechatName => $_getSZ(7);
  @$pb.TagNumber(8)
  set sWechatName($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasSWechatName() => $_has(7);
  @$pb.TagNumber(8)
  void clearSWechatName() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get sQQName => $_getSZ(8);
  @$pb.TagNumber(9)
  set sQQName($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSQQName() => $_has(8);
  @$pb.TagNumber(9)
  void clearSQQName() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get sFacebookName => $_getSZ(9);
  @$pb.TagNumber(10)
  set sFacebookName($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasSFacebookName() => $_has(9);
  @$pb.TagNumber(10)
  void clearSFacebookName() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get iCloseStatus => $_getIZ(10);
  @$pb.TagNumber(11)
  set iCloseStatus($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasICloseStatus() => $_has(10);
  @$pb.TagNumber(11)
  void clearICloseStatus() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get sNickName => $_getSZ(11);
  @$pb.TagNumber(12)
  set sNickName($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasSNickName() => $_has(11);
  @$pb.TagNumber(12)
  void clearSNickName() => clearField(12);

  @$pb.TagNumber(14)
  $core.String get sCountry => $_getSZ(12);
  @$pb.TagNumber(14)
  set sCountry($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(14)
  $core.bool hasSCountry() => $_has(12);
  @$pb.TagNumber(14)
  void clearSCountry() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get sProvince => $_getSZ(13);
  @$pb.TagNumber(15)
  set sProvince($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(15)
  $core.bool hasSProvince() => $_has(13);
  @$pb.TagNumber(15)
  void clearSProvince() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get iRegTime => $_getIZ(14);
  @$pb.TagNumber(16)
  set iRegTime($core.int v) { $_setSignedInt32(14, v); }
  @$pb.TagNumber(16)
  $core.bool hasIRegTime() => $_has(14);
  @$pb.TagNumber(16)
  void clearIRegTime() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get sCity => $_getSZ(15);
  @$pb.TagNumber(17)
  set sCity($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(17)
  $core.bool hasSCity() => $_has(15);
  @$pb.TagNumber(17)
  void clearSCity() => clearField(17);
}

class msg_equipment extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_equipment', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sType', protoName: 'sType')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sModel', protoName: 'sModel')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sName', protoName: 'sName')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sAddress', protoName: 'sAddress')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sVersion', protoName: 'sVersion')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'affirmTime', $pb.PbFieldType.O3, protoName: 'affirmTime')
    ..hasRequiredFields = false
  ;

  msg_equipment._() : super();
  factory msg_equipment({
    $core.String? sType,
    $core.String? sModel,
    $core.String? sName,
    $core.String? sAddress,
    $core.String? sVersion,
    $core.int? affirmTime,
  }) {
    final _result = create();
    if (sType != null) {
      _result.sType = sType;
    }
    if (sModel != null) {
      _result.sModel = sModel;
    }
    if (sName != null) {
      _result.sName = sName;
    }
    if (sAddress != null) {
      _result.sAddress = sAddress;
    }
    if (sVersion != null) {
      _result.sVersion = sVersion;
    }
    if (affirmTime != null) {
      _result.affirmTime = affirmTime;
    }
    return _result;
  }
  factory msg_equipment.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_equipment.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_equipment clone() => msg_equipment()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_equipment copyWith(void Function(msg_equipment) updates) => super.copyWith((message) => updates(message as msg_equipment)) as msg_equipment; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_equipment create() => msg_equipment._();
  msg_equipment createEmptyInstance() => create();
  static $pb.PbList<msg_equipment> createRepeated() => $pb.PbList<msg_equipment>();
  @$core.pragma('dart2js:noInline')
  static msg_equipment getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_equipment>(create);
  static msg_equipment? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sType => $_getSZ(0);
  @$pb.TagNumber(1)
  set sType($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSType() => $_has(0);
  @$pb.TagNumber(1)
  void clearSType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sModel => $_getSZ(1);
  @$pb.TagNumber(2)
  set sModel($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSModel() => $_has(1);
  @$pb.TagNumber(2)
  void clearSModel() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sName => $_getSZ(2);
  @$pb.TagNumber(3)
  set sName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSName() => $_has(2);
  @$pb.TagNumber(3)
  void clearSName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sAddress => $_getSZ(3);
  @$pb.TagNumber(4)
  set sAddress($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearSAddress() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get sVersion => $_getSZ(4);
  @$pb.TagNumber(5)
  set sVersion($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSVersion() => $_has(4);
  @$pb.TagNumber(5)
  void clearSVersion() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get affirmTime => $_getIZ(5);
  @$pb.TagNumber(6)
  set affirmTime($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAffirmTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearAffirmTime() => clearField(6);
}

class msg_player_name extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_player_name', createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iUserID', protoName: 'iUserID')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sNickName', protoName: 'sNickName')
    ..hasRequiredFields = false
  ;

  msg_player_name._() : super();
  factory msg_player_name({
    $fixnum.Int64? iUserID,
    $core.String? sNickName,
  }) {
    final _result = create();
    if (iUserID != null) {
      _result.iUserID = iUserID;
    }
    if (sNickName != null) {
      _result.sNickName = sNickName;
    }
    return _result;
  }
  factory msg_player_name.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_player_name.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_player_name clone() => msg_player_name()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_player_name copyWith(void Function(msg_player_name) updates) => super.copyWith((message) => updates(message as msg_player_name)) as msg_player_name; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_player_name create() => msg_player_name._();
  msg_player_name createEmptyInstance() => create();
  static $pb.PbList<msg_player_name> createRepeated() => $pb.PbList<msg_player_name>();
  @$core.pragma('dart2js:noInline')
  static msg_player_name getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_player_name>(create);
  static msg_player_name? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get iUserID => $_getI64(0);
  @$pb.TagNumber(1)
  set iUserID($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearIUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sNickName => $_getSZ(1);
  @$pb.TagNumber(2)
  set sNickName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSNickName() => $_has(1);
  @$pb.TagNumber(2)
  void clearSNickName() => clearField(2);
}

class msg_player_face extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_player_face', createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iUserID', protoName: 'iUserID')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sNickName', protoName: 'sNickName')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sAvatar', protoName: 'sAvatar')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iAvatarBoxID', $pb.PbFieldType.O3, protoName: 'iAvatarBoxID')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iFlagID', $pb.PbFieldType.O3, protoName: 'iFlagID')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iCertificateType', $pb.PbFieldType.O3, protoName: 'iCertificateType')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sCertificateCont', protoName: 'sCertificateCont')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sMajorNickName', protoName: 'sMajorNickName')
    ..hasRequiredFields = false
  ;

  msg_player_face._() : super();
  factory msg_player_face({
    $fixnum.Int64? iUserID,
    $core.String? sNickName,
    $core.String? sAvatar,
    $core.int? iAvatarBoxID,
    $core.int? iFlagID,
    $core.int? iCertificateType,
    $core.String? sCertificateCont,
    $core.String? sMajorNickName,
  }) {
    final _result = create();
    if (iUserID != null) {
      _result.iUserID = iUserID;
    }
    if (sNickName != null) {
      _result.sNickName = sNickName;
    }
    if (sAvatar != null) {
      _result.sAvatar = sAvatar;
    }
    if (iAvatarBoxID != null) {
      _result.iAvatarBoxID = iAvatarBoxID;
    }
    if (iFlagID != null) {
      _result.iFlagID = iFlagID;
    }
    if (iCertificateType != null) {
      _result.iCertificateType = iCertificateType;
    }
    if (sCertificateCont != null) {
      _result.sCertificateCont = sCertificateCont;
    }
    if (sMajorNickName != null) {
      _result.sMajorNickName = sMajorNickName;
    }
    return _result;
  }
  factory msg_player_face.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_player_face.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_player_face clone() => msg_player_face()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_player_face copyWith(void Function(msg_player_face) updates) => super.copyWith((message) => updates(message as msg_player_face)) as msg_player_face; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_player_face create() => msg_player_face._();
  msg_player_face createEmptyInstance() => create();
  static $pb.PbList<msg_player_face> createRepeated() => $pb.PbList<msg_player_face>();
  @$core.pragma('dart2js:noInline')
  static msg_player_face getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_player_face>(create);
  static msg_player_face? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get iUserID => $_getI64(0);
  @$pb.TagNumber(1)
  set iUserID($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearIUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sNickName => $_getSZ(1);
  @$pb.TagNumber(2)
  set sNickName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSNickName() => $_has(1);
  @$pb.TagNumber(2)
  void clearSNickName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sAvatar => $_getSZ(2);
  @$pb.TagNumber(3)
  set sAvatar($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSAvatar() => $_has(2);
  @$pb.TagNumber(3)
  void clearSAvatar() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get iAvatarBoxID => $_getIZ(3);
  @$pb.TagNumber(4)
  set iAvatarBoxID($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIAvatarBoxID() => $_has(3);
  @$pb.TagNumber(4)
  void clearIAvatarBoxID() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get iFlagID => $_getIZ(4);
  @$pb.TagNumber(5)
  set iFlagID($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIFlagID() => $_has(4);
  @$pb.TagNumber(5)
  void clearIFlagID() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get iCertificateType => $_getIZ(5);
  @$pb.TagNumber(6)
  set iCertificateType($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasICertificateType() => $_has(5);
  @$pb.TagNumber(6)
  void clearICertificateType() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get sCertificateCont => $_getSZ(6);
  @$pb.TagNumber(7)
  set sCertificateCont($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSCertificateCont() => $_has(6);
  @$pb.TagNumber(7)
  void clearSCertificateCont() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get sMajorNickName => $_getSZ(7);
  @$pb.TagNumber(8)
  set sMajorNickName($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasSMajorNickName() => $_has(7);
  @$pb.TagNumber(8)
  void clearSMajorNickName() => clearField(8);
}

class msg_player_comp_info extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_player_comp_info', createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iUserID', protoName: 'iUserID')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iRegTime', $pb.PbFieldType.O3, protoName: 'iRegTime')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iRecoverNum', $pb.PbFieldType.O3, protoName: 'iRecoverNum')
    ..aOM<msg_player_time_trial>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mTimeTrial', protoName: 'mTimeTrial', subBuilder: msg_player_time_trial.create)
    ..aOM<msg_player_comp_multi>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mCompMulti', protoName: 'mCompMulti', subBuilder: msg_player_comp_multi.create)
    ..aOM<msg_player_comp_qualifier>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mCompQualifier', protoName: 'mCompQualifier', subBuilder: msg_player_comp_qualifier.create)
    ..aOM<msg_player_comp_multi_team>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mCompTeamInfo', protoName: 'mCompTeamInfo', subBuilder: msg_player_comp_multi_team.create)
    ..hasRequiredFields = false
  ;

  msg_player_comp_info._() : super();
  factory msg_player_comp_info({
    $fixnum.Int64? iUserID,
    $core.int? iRegTime,
    $core.int? iRecoverNum,
    msg_player_time_trial? mTimeTrial,
    msg_player_comp_multi? mCompMulti,
    msg_player_comp_qualifier? mCompQualifier,
    msg_player_comp_multi_team? mCompTeamInfo,
  }) {
    final _result = create();
    if (iUserID != null) {
      _result.iUserID = iUserID;
    }
    if (iRegTime != null) {
      _result.iRegTime = iRegTime;
    }
    if (iRecoverNum != null) {
      _result.iRecoverNum = iRecoverNum;
    }
    if (mTimeTrial != null) {
      _result.mTimeTrial = mTimeTrial;
    }
    if (mCompMulti != null) {
      _result.mCompMulti = mCompMulti;
    }
    if (mCompQualifier != null) {
      _result.mCompQualifier = mCompQualifier;
    }
    if (mCompTeamInfo != null) {
      _result.mCompTeamInfo = mCompTeamInfo;
    }
    return _result;
  }
  factory msg_player_comp_info.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_player_comp_info.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_player_comp_info clone() => msg_player_comp_info()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_player_comp_info copyWith(void Function(msg_player_comp_info) updates) => super.copyWith((message) => updates(message as msg_player_comp_info)) as msg_player_comp_info; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_player_comp_info create() => msg_player_comp_info._();
  msg_player_comp_info createEmptyInstance() => create();
  static $pb.PbList<msg_player_comp_info> createRepeated() => $pb.PbList<msg_player_comp_info>();
  @$core.pragma('dart2js:noInline')
  static msg_player_comp_info getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_player_comp_info>(create);
  static msg_player_comp_info? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get iUserID => $_getI64(0);
  @$pb.TagNumber(1)
  set iUserID($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearIUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get iRegTime => $_getIZ(1);
  @$pb.TagNumber(2)
  set iRegTime($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIRegTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearIRegTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get iRecoverNum => $_getIZ(2);
  @$pb.TagNumber(3)
  set iRecoverNum($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIRecoverNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearIRecoverNum() => clearField(3);

  @$pb.TagNumber(4)
  msg_player_time_trial get mTimeTrial => $_getN(3);
  @$pb.TagNumber(4)
  set mTimeTrial(msg_player_time_trial v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasMTimeTrial() => $_has(3);
  @$pb.TagNumber(4)
  void clearMTimeTrial() => clearField(4);
  @$pb.TagNumber(4)
  msg_player_time_trial ensureMTimeTrial() => $_ensure(3);

  @$pb.TagNumber(5)
  msg_player_comp_multi get mCompMulti => $_getN(4);
  @$pb.TagNumber(5)
  set mCompMulti(msg_player_comp_multi v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasMCompMulti() => $_has(4);
  @$pb.TagNumber(5)
  void clearMCompMulti() => clearField(5);
  @$pb.TagNumber(5)
  msg_player_comp_multi ensureMCompMulti() => $_ensure(4);

  @$pb.TagNumber(6)
  msg_player_comp_qualifier get mCompQualifier => $_getN(5);
  @$pb.TagNumber(6)
  set mCompQualifier(msg_player_comp_qualifier v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasMCompQualifier() => $_has(5);
  @$pb.TagNumber(6)
  void clearMCompQualifier() => clearField(6);
  @$pb.TagNumber(6)
  msg_player_comp_qualifier ensureMCompQualifier() => $_ensure(5);

  @$pb.TagNumber(7)
  msg_player_comp_multi_team get mCompTeamInfo => $_getN(6);
  @$pb.TagNumber(7)
  set mCompTeamInfo(msg_player_comp_multi_team v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasMCompTeamInfo() => $_has(6);
  @$pb.TagNumber(7)
  void clearMCompTeamInfo() => clearField(7);
  @$pb.TagNumber(7)
  msg_player_comp_multi_team ensureMCompTeamInfo() => $_ensure(6);
}

class msg_player_achieve_info extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_player_achieve_info', createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iUserID', protoName: 'iUserID')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iAchieveLev', $pb.PbFieldType.O3, protoName: 'iAchieveLev')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iPopular', $pb.PbFieldType.O3, protoName: 'iPopular')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iLike', $pb.PbFieldType.O3, protoName: 'iLike')
    ..hasRequiredFields = false
  ;

  msg_player_achieve_info._() : super();
  factory msg_player_achieve_info({
    $fixnum.Int64? iUserID,
    $core.int? iAchieveLev,
    $core.int? iPopular,
    $core.int? iLike,
  }) {
    final _result = create();
    if (iUserID != null) {
      _result.iUserID = iUserID;
    }
    if (iAchieveLev != null) {
      _result.iAchieveLev = iAchieveLev;
    }
    if (iPopular != null) {
      _result.iPopular = iPopular;
    }
    if (iLike != null) {
      _result.iLike = iLike;
    }
    return _result;
  }
  factory msg_player_achieve_info.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_player_achieve_info.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_player_achieve_info clone() => msg_player_achieve_info()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_player_achieve_info copyWith(void Function(msg_player_achieve_info) updates) => super.copyWith((message) => updates(message as msg_player_achieve_info)) as msg_player_achieve_info; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_player_achieve_info create() => msg_player_achieve_info._();
  msg_player_achieve_info createEmptyInstance() => create();
  static $pb.PbList<msg_player_achieve_info> createRepeated() => $pb.PbList<msg_player_achieve_info>();
  @$core.pragma('dart2js:noInline')
  static msg_player_achieve_info getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_player_achieve_info>(create);
  static msg_player_achieve_info? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get iUserID => $_getI64(0);
  @$pb.TagNumber(1)
  set iUserID($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearIUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get iAchieveLev => $_getIZ(1);
  @$pb.TagNumber(2)
  set iAchieveLev($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIAchieveLev() => $_has(1);
  @$pb.TagNumber(2)
  void clearIAchieveLev() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get iPopular => $_getIZ(2);
  @$pb.TagNumber(3)
  set iPopular($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIPopular() => $_has(2);
  @$pb.TagNumber(3)
  void clearIPopular() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get iLike => $_getIZ(3);
  @$pb.TagNumber(4)
  set iLike($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasILike() => $_has(3);
  @$pb.TagNumber(4)
  void clearILike() => clearField(4);
}

class msg_player_honor_wall extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_player_honor_wall', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iAgeDay', $pb.PbFieldType.O3, protoName: 'iAgeDay')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iGameNum', $pb.PbFieldType.O3, protoName: 'iGameNum')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iLike', $pb.PbFieldType.O3, protoName: 'iLike')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iCubeNum', $pb.PbFieldType.O3, protoName: 'iCubeNum')
    ..hasRequiredFields = false
  ;

  msg_player_honor_wall._() : super();
  factory msg_player_honor_wall({
    $core.int? iAgeDay,
    $core.int? iGameNum,
    $core.int? iLike,
    $core.int? iCubeNum,
  }) {
    final _result = create();
    if (iAgeDay != null) {
      _result.iAgeDay = iAgeDay;
    }
    if (iGameNum != null) {
      _result.iGameNum = iGameNum;
    }
    if (iLike != null) {
      _result.iLike = iLike;
    }
    if (iCubeNum != null) {
      _result.iCubeNum = iCubeNum;
    }
    return _result;
  }
  factory msg_player_honor_wall.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_player_honor_wall.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_player_honor_wall clone() => msg_player_honor_wall()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_player_honor_wall copyWith(void Function(msg_player_honor_wall) updates) => super.copyWith((message) => updates(message as msg_player_honor_wall)) as msg_player_honor_wall; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_player_honor_wall create() => msg_player_honor_wall._();
  msg_player_honor_wall createEmptyInstance() => create();
  static $pb.PbList<msg_player_honor_wall> createRepeated() => $pb.PbList<msg_player_honor_wall>();
  @$core.pragma('dart2js:noInline')
  static msg_player_honor_wall getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_player_honor_wall>(create);
  static msg_player_honor_wall? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get iAgeDay => $_getIZ(0);
  @$pb.TagNumber(1)
  set iAgeDay($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIAgeDay() => $_has(0);
  @$pb.TagNumber(1)
  void clearIAgeDay() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get iGameNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set iGameNum($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIGameNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearIGameNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get iLike => $_getIZ(2);
  @$pb.TagNumber(3)
  set iLike($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasILike() => $_has(2);
  @$pb.TagNumber(3)
  void clearILike() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get iCubeNum => $_getIZ(3);
  @$pb.TagNumber(4)
  set iCubeNum($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasICubeNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearICubeNum() => clearField(4);
}

class msg_player_comp_multi extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_player_comp_multi', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iEnterNum', $pb.PbFieldType.O3, protoName: 'iEnterNum')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iFinishNum', $pb.PbFieldType.O3, protoName: 'iFinishNum')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iAvg', $pb.PbFieldType.O3, protoName: 'iAvg')
    ..hasRequiredFields = false
  ;

  msg_player_comp_multi._() : super();
  factory msg_player_comp_multi({
    $core.int? iEnterNum,
    $core.int? iFinishNum,
    $core.int? iAvg,
  }) {
    final _result = create();
    if (iEnterNum != null) {
      _result.iEnterNum = iEnterNum;
    }
    if (iFinishNum != null) {
      _result.iFinishNum = iFinishNum;
    }
    if (iAvg != null) {
      _result.iAvg = iAvg;
    }
    return _result;
  }
  factory msg_player_comp_multi.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_player_comp_multi.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_player_comp_multi clone() => msg_player_comp_multi()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_player_comp_multi copyWith(void Function(msg_player_comp_multi) updates) => super.copyWith((message) => updates(message as msg_player_comp_multi)) as msg_player_comp_multi; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_player_comp_multi create() => msg_player_comp_multi._();
  msg_player_comp_multi createEmptyInstance() => create();
  static $pb.PbList<msg_player_comp_multi> createRepeated() => $pb.PbList<msg_player_comp_multi>();
  @$core.pragma('dart2js:noInline')
  static msg_player_comp_multi getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_player_comp_multi>(create);
  static msg_player_comp_multi? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get iEnterNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set iEnterNum($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIEnterNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearIEnterNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get iFinishNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set iFinishNum($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIFinishNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearIFinishNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get iAvg => $_getIZ(2);
  @$pb.TagNumber(3)
  set iAvg($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIAvg() => $_has(2);
  @$pb.TagNumber(3)
  void clearIAvg() => clearField(3);
}

class msg_player_multi_quick_twist_comp_statistics extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_player_multi_quick_twist_comp_statistics', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iBest', $pb.PbFieldType.O3, protoName: 'iBest')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iAvg', $pb.PbFieldType.O3, protoName: 'iAvg')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iChampionNum', $pb.PbFieldType.O3, protoName: 'iChampionNum')
    ..hasRequiredFields = false
  ;

  msg_player_multi_quick_twist_comp_statistics._() : super();
  factory msg_player_multi_quick_twist_comp_statistics({
    $core.int? iBest,
    $core.int? iAvg,
    $core.int? iChampionNum,
  }) {
    final _result = create();
    if (iBest != null) {
      _result.iBest = iBest;
    }
    if (iAvg != null) {
      _result.iAvg = iAvg;
    }
    if (iChampionNum != null) {
      _result.iChampionNum = iChampionNum;
    }
    return _result;
  }
  factory msg_player_multi_quick_twist_comp_statistics.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_player_multi_quick_twist_comp_statistics.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_player_multi_quick_twist_comp_statistics clone() => msg_player_multi_quick_twist_comp_statistics()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_player_multi_quick_twist_comp_statistics copyWith(void Function(msg_player_multi_quick_twist_comp_statistics) updates) => super.copyWith((message) => updates(message as msg_player_multi_quick_twist_comp_statistics)) as msg_player_multi_quick_twist_comp_statistics; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_player_multi_quick_twist_comp_statistics create() => msg_player_multi_quick_twist_comp_statistics._();
  msg_player_multi_quick_twist_comp_statistics createEmptyInstance() => create();
  static $pb.PbList<msg_player_multi_quick_twist_comp_statistics> createRepeated() => $pb.PbList<msg_player_multi_quick_twist_comp_statistics>();
  @$core.pragma('dart2js:noInline')
  static msg_player_multi_quick_twist_comp_statistics getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_player_multi_quick_twist_comp_statistics>(create);
  static msg_player_multi_quick_twist_comp_statistics? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get iBest => $_getIZ(0);
  @$pb.TagNumber(1)
  set iBest($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIBest() => $_has(0);
  @$pb.TagNumber(1)
  void clearIBest() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get iAvg => $_getIZ(1);
  @$pb.TagNumber(2)
  set iAvg($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIAvg() => $_has(1);
  @$pb.TagNumber(2)
  void clearIAvg() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get iChampionNum => $_getIZ(2);
  @$pb.TagNumber(3)
  set iChampionNum($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIChampionNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearIChampionNum() => clearField(3);
}

class msg_player_comp_multi_team extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_player_comp_multi_team', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iEnterNum', $pb.PbFieldType.O3, protoName: 'iEnterNum')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iFinishNum', $pb.PbFieldType.O3, protoName: 'iFinishNum')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iAvg', $pb.PbFieldType.O3, protoName: 'iAvg')
    ..hasRequiredFields = false
  ;

  msg_player_comp_multi_team._() : super();
  factory msg_player_comp_multi_team({
    $core.int? iEnterNum,
    $core.int? iFinishNum,
    $core.int? iAvg,
  }) {
    final _result = create();
    if (iEnterNum != null) {
      _result.iEnterNum = iEnterNum;
    }
    if (iFinishNum != null) {
      _result.iFinishNum = iFinishNum;
    }
    if (iAvg != null) {
      _result.iAvg = iAvg;
    }
    return _result;
  }
  factory msg_player_comp_multi_team.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_player_comp_multi_team.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_player_comp_multi_team clone() => msg_player_comp_multi_team()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_player_comp_multi_team copyWith(void Function(msg_player_comp_multi_team) updates) => super.copyWith((message) => updates(message as msg_player_comp_multi_team)) as msg_player_comp_multi_team; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_player_comp_multi_team create() => msg_player_comp_multi_team._();
  msg_player_comp_multi_team createEmptyInstance() => create();
  static $pb.PbList<msg_player_comp_multi_team> createRepeated() => $pb.PbList<msg_player_comp_multi_team>();
  @$core.pragma('dart2js:noInline')
  static msg_player_comp_multi_team getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_player_comp_multi_team>(create);
  static msg_player_comp_multi_team? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get iEnterNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set iEnterNum($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIEnterNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearIEnterNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get iFinishNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set iFinishNum($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIFinishNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearIFinishNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get iAvg => $_getIZ(2);
  @$pb.TagNumber(3)
  set iAvg($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIAvg() => $_has(2);
  @$pb.TagNumber(3)
  void clearIAvg() => clearField(3);
}

class msg_player_team_quick_twist_comp_statistics extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_player_team_quick_twist_comp_statistics', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iBest', $pb.PbFieldType.O3, protoName: 'iBest')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iAvg', $pb.PbFieldType.O3, protoName: 'iAvg')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iWinPercent', $pb.PbFieldType.O3, protoName: 'iWinPercent')
    ..hasRequiredFields = false
  ;

  msg_player_team_quick_twist_comp_statistics._() : super();
  factory msg_player_team_quick_twist_comp_statistics({
    $core.int? iBest,
    $core.int? iAvg,
    $core.int? iWinPercent,
  }) {
    final _result = create();
    if (iBest != null) {
      _result.iBest = iBest;
    }
    if (iAvg != null) {
      _result.iAvg = iAvg;
    }
    if (iWinPercent != null) {
      _result.iWinPercent = iWinPercent;
    }
    return _result;
  }
  factory msg_player_team_quick_twist_comp_statistics.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_player_team_quick_twist_comp_statistics.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_player_team_quick_twist_comp_statistics clone() => msg_player_team_quick_twist_comp_statistics()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_player_team_quick_twist_comp_statistics copyWith(void Function(msg_player_team_quick_twist_comp_statistics) updates) => super.copyWith((message) => updates(message as msg_player_team_quick_twist_comp_statistics)) as msg_player_team_quick_twist_comp_statistics; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_player_team_quick_twist_comp_statistics create() => msg_player_team_quick_twist_comp_statistics._();
  msg_player_team_quick_twist_comp_statistics createEmptyInstance() => create();
  static $pb.PbList<msg_player_team_quick_twist_comp_statistics> createRepeated() => $pb.PbList<msg_player_team_quick_twist_comp_statistics>();
  @$core.pragma('dart2js:noInline')
  static msg_player_team_quick_twist_comp_statistics getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_player_team_quick_twist_comp_statistics>(create);
  static msg_player_team_quick_twist_comp_statistics? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get iBest => $_getIZ(0);
  @$pb.TagNumber(1)
  set iBest($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIBest() => $_has(0);
  @$pb.TagNumber(1)
  void clearIBest() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get iAvg => $_getIZ(1);
  @$pb.TagNumber(2)
  set iAvg($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIAvg() => $_has(1);
  @$pb.TagNumber(2)
  void clearIAvg() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get iWinPercent => $_getIZ(2);
  @$pb.TagNumber(3)
  set iWinPercent($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIWinPercent() => $_has(2);
  @$pb.TagNumber(3)
  void clearIWinPercent() => clearField(3);
}

class msg_player_time_trial extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_player_time_trial', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iUsedNum', $pb.PbFieldType.O3, protoName: 'iUsedNum')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iFinishNum', $pb.PbFieldType.O3, protoName: 'iFinishNum')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iAvg', $pb.PbFieldType.O3, protoName: 'iAvg')
    ..hasRequiredFields = false
  ;

  msg_player_time_trial._() : super();
  factory msg_player_time_trial({
    $core.int? iUsedNum,
    $core.int? iFinishNum,
    $core.int? iAvg,
  }) {
    final _result = create();
    if (iUsedNum != null) {
      _result.iUsedNum = iUsedNum;
    }
    if (iFinishNum != null) {
      _result.iFinishNum = iFinishNum;
    }
    if (iAvg != null) {
      _result.iAvg = iAvg;
    }
    return _result;
  }
  factory msg_player_time_trial.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_player_time_trial.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_player_time_trial clone() => msg_player_time_trial()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_player_time_trial copyWith(void Function(msg_player_time_trial) updates) => super.copyWith((message) => updates(message as msg_player_time_trial)) as msg_player_time_trial; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_player_time_trial create() => msg_player_time_trial._();
  msg_player_time_trial createEmptyInstance() => create();
  static $pb.PbList<msg_player_time_trial> createRepeated() => $pb.PbList<msg_player_time_trial>();
  @$core.pragma('dart2js:noInline')
  static msg_player_time_trial getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_player_time_trial>(create);
  static msg_player_time_trial? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get iUsedNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set iUsedNum($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIUsedNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearIUsedNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get iFinishNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set iFinishNum($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIFinishNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearIFinishNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get iAvg => $_getIZ(2);
  @$pb.TagNumber(3)
  set iAvg($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIAvg() => $_has(2);
  @$pb.TagNumber(3)
  void clearIAvg() => clearField(3);
}

class msg_player_time_trial_comp_statistics extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_player_time_trial_comp_statistics', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iBest', $pb.PbFieldType.O3, protoName: 'iBest')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iAvg', $pb.PbFieldType.O3, protoName: 'iAvg')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iRecentRank', $pb.PbFieldType.O3, protoName: 'iRecentRank')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iSub', $pb.PbFieldType.O3, protoName: 'iSub')
    ..e<sub_icon_style>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eSubIconStyle', $pb.PbFieldType.OE, protoName: 'eSubIconStyle', defaultOrMaker: sub_icon_style.gold, valueOf: sub_icon_style.valueOf, enumValues: sub_icon_style.values)
    ..hasRequiredFields = false
  ;

  msg_player_time_trial_comp_statistics._() : super();
  factory msg_player_time_trial_comp_statistics({
    $core.int? iBest,
    $core.int? iAvg,
    $core.int? iRecentRank,
    $core.int? iSub,
    sub_icon_style? eSubIconStyle,
  }) {
    final _result = create();
    if (iBest != null) {
      _result.iBest = iBest;
    }
    if (iAvg != null) {
      _result.iAvg = iAvg;
    }
    if (iRecentRank != null) {
      _result.iRecentRank = iRecentRank;
    }
    if (iSub != null) {
      _result.iSub = iSub;
    }
    if (eSubIconStyle != null) {
      _result.eSubIconStyle = eSubIconStyle;
    }
    return _result;
  }
  factory msg_player_time_trial_comp_statistics.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_player_time_trial_comp_statistics.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_player_time_trial_comp_statistics clone() => msg_player_time_trial_comp_statistics()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_player_time_trial_comp_statistics copyWith(void Function(msg_player_time_trial_comp_statistics) updates) => super.copyWith((message) => updates(message as msg_player_time_trial_comp_statistics)) as msg_player_time_trial_comp_statistics; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_player_time_trial_comp_statistics create() => msg_player_time_trial_comp_statistics._();
  msg_player_time_trial_comp_statistics createEmptyInstance() => create();
  static $pb.PbList<msg_player_time_trial_comp_statistics> createRepeated() => $pb.PbList<msg_player_time_trial_comp_statistics>();
  @$core.pragma('dart2js:noInline')
  static msg_player_time_trial_comp_statistics getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_player_time_trial_comp_statistics>(create);
  static msg_player_time_trial_comp_statistics? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get iBest => $_getIZ(0);
  @$pb.TagNumber(1)
  set iBest($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIBest() => $_has(0);
  @$pb.TagNumber(1)
  void clearIBest() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get iAvg => $_getIZ(1);
  @$pb.TagNumber(2)
  set iAvg($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIAvg() => $_has(1);
  @$pb.TagNumber(2)
  void clearIAvg() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get iRecentRank => $_getIZ(2);
  @$pb.TagNumber(3)
  set iRecentRank($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIRecentRank() => $_has(2);
  @$pb.TagNumber(3)
  void clearIRecentRank() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get iSub => $_getIZ(3);
  @$pb.TagNumber(4)
  set iSub($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasISub() => $_has(3);
  @$pb.TagNumber(4)
  void clearISub() => clearField(4);

  @$pb.TagNumber(5)
  sub_icon_style get eSubIconStyle => $_getN(4);
  @$pb.TagNumber(5)
  set eSubIconStyle(sub_icon_style v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasESubIconStyle() => $_has(4);
  @$pb.TagNumber(5)
  void clearESubIconStyle() => clearField(5);
}

class msg_player_comp_qualifier extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_player_comp_qualifier', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iCup', $pb.PbFieldType.O3, protoName: 'iCup')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fTps', $pb.PbFieldType.OF, protoName: 'fTps')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iTurn', $pb.PbFieldType.O3, protoName: 'iTurn')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iSmoothIndex', $pb.PbFieldType.O3, protoName: 'iSmoothIndex')
    ..hasRequiredFields = false
  ;

  msg_player_comp_qualifier._() : super();
  factory msg_player_comp_qualifier({
    $core.int? iCup,
    $core.double? fTps,
    $core.int? iTurn,
    $core.int? iSmoothIndex,
  }) {
    final _result = create();
    if (iCup != null) {
      _result.iCup = iCup;
    }
    if (fTps != null) {
      _result.fTps = fTps;
    }
    if (iTurn != null) {
      _result.iTurn = iTurn;
    }
    if (iSmoothIndex != null) {
      _result.iSmoothIndex = iSmoothIndex;
    }
    return _result;
  }
  factory msg_player_comp_qualifier.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_player_comp_qualifier.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_player_comp_qualifier clone() => msg_player_comp_qualifier()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_player_comp_qualifier copyWith(void Function(msg_player_comp_qualifier) updates) => super.copyWith((message) => updates(message as msg_player_comp_qualifier)) as msg_player_comp_qualifier; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_player_comp_qualifier create() => msg_player_comp_qualifier._();
  msg_player_comp_qualifier createEmptyInstance() => create();
  static $pb.PbList<msg_player_comp_qualifier> createRepeated() => $pb.PbList<msg_player_comp_qualifier>();
  @$core.pragma('dart2js:noInline')
  static msg_player_comp_qualifier getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_player_comp_qualifier>(create);
  static msg_player_comp_qualifier? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get iCup => $_getIZ(0);
  @$pb.TagNumber(1)
  set iCup($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasICup() => $_has(0);
  @$pb.TagNumber(1)
  void clearICup() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get fTps => $_getN(1);
  @$pb.TagNumber(2)
  set fTps($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFTps() => $_has(1);
  @$pb.TagNumber(2)
  void clearFTps() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get iTurn => $_getIZ(2);
  @$pb.TagNumber(3)
  set iTurn($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasITurn() => $_has(2);
  @$pb.TagNumber(3)
  void clearITurn() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get iSmoothIndex => $_getIZ(3);
  @$pb.TagNumber(4)
  set iSmoothIndex($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasISmoothIndex() => $_has(3);
  @$pb.TagNumber(4)
  void clearISmoothIndex() => clearField(4);
}

class msg_player_qualifier_comp_statistics extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_player_qualifier_comp_statistics', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iCup', $pb.PbFieldType.O3, protoName: 'iCup')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iDuration', $pb.PbFieldType.O3, protoName: 'iDuration')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iTotal', $pb.PbFieldType.O3, protoName: 'iTotal')
    ..hasRequiredFields = false
  ;

  msg_player_qualifier_comp_statistics._() : super();
  factory msg_player_qualifier_comp_statistics({
    $core.int? iCup,
    $core.int? iDuration,
    $core.int? iTotal,
  }) {
    final _result = create();
    if (iCup != null) {
      _result.iCup = iCup;
    }
    if (iDuration != null) {
      _result.iDuration = iDuration;
    }
    if (iTotal != null) {
      _result.iTotal = iTotal;
    }
    return _result;
  }
  factory msg_player_qualifier_comp_statistics.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_player_qualifier_comp_statistics.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_player_qualifier_comp_statistics clone() => msg_player_qualifier_comp_statistics()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_player_qualifier_comp_statistics copyWith(void Function(msg_player_qualifier_comp_statistics) updates) => super.copyWith((message) => updates(message as msg_player_qualifier_comp_statistics)) as msg_player_qualifier_comp_statistics; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_player_qualifier_comp_statistics create() => msg_player_qualifier_comp_statistics._();
  msg_player_qualifier_comp_statistics createEmptyInstance() => create();
  static $pb.PbList<msg_player_qualifier_comp_statistics> createRepeated() => $pb.PbList<msg_player_qualifier_comp_statistics>();
  @$core.pragma('dart2js:noInline')
  static msg_player_qualifier_comp_statistics getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_player_qualifier_comp_statistics>(create);
  static msg_player_qualifier_comp_statistics? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get iCup => $_getIZ(0);
  @$pb.TagNumber(1)
  set iCup($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasICup() => $_has(0);
  @$pb.TagNumber(1)
  void clearICup() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get iDuration => $_getIZ(1);
  @$pb.TagNumber(2)
  set iDuration($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIDuration() => $_has(1);
  @$pb.TagNumber(2)
  void clearIDuration() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get iTotal => $_getIZ(2);
  @$pb.TagNumber(3)
  set iTotal($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasITotal() => $_has(2);
  @$pb.TagNumber(3)
  void clearITotal() => clearField(3);
}

class msg_cube_angle extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_cube_angle', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'x', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'y', $pb.PbFieldType.O3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'z', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  msg_cube_angle._() : super();
  factory msg_cube_angle({
    $core.int? x,
    $core.int? y,
    $core.int? z,
  }) {
    final _result = create();
    if (x != null) {
      _result.x = x;
    }
    if (y != null) {
      _result.y = y;
    }
    if (z != null) {
      _result.z = z;
    }
    return _result;
  }
  factory msg_cube_angle.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_cube_angle.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_cube_angle clone() => msg_cube_angle()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_cube_angle copyWith(void Function(msg_cube_angle) updates) => super.copyWith((message) => updates(message as msg_cube_angle)) as msg_cube_angle; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_cube_angle create() => msg_cube_angle._();
  msg_cube_angle createEmptyInstance() => create();
  static $pb.PbList<msg_cube_angle> createRepeated() => $pb.PbList<msg_cube_angle>();
  @$core.pragma('dart2js:noInline')
  static msg_cube_angle getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_cube_angle>(create);
  static msg_cube_angle? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get x => $_getIZ(0);
  @$pb.TagNumber(1)
  set x($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get y => $_getIZ(1);
  @$pb.TagNumber(2)
  set y($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get z => $_getIZ(2);
  @$pb.TagNumber(3)
  set z($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasZ() => $_has(2);
  @$pb.TagNumber(3)
  void clearZ() => clearField(3);
}

class msg_cube_move extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_cube_move', createEmptyInstance: create)
    ..aOM<msg_cube_angle>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mAngle', protoName: 'mAngle', subBuilder: msg_cube_angle.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sMove', protoName: 'sMove')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iInterval', $pb.PbFieldType.O3, protoName: 'iInterval')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iStep', $pb.PbFieldType.O3, protoName: 'iStep')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iRotate', $pb.PbFieldType.O3, protoName: 'iRotate')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iModify', $pb.PbFieldType.O3, protoName: 'iModify')
    ..hasRequiredFields = false
  ;

  msg_cube_move._() : super();
  factory msg_cube_move({
    msg_cube_angle? mAngle,
    $core.String? sMove,
    $core.int? iInterval,
    $core.int? iStep,
    $core.int? iRotate,
    $core.int? iModify,
  }) {
    final _result = create();
    if (mAngle != null) {
      _result.mAngle = mAngle;
    }
    if (sMove != null) {
      _result.sMove = sMove;
    }
    if (iInterval != null) {
      _result.iInterval = iInterval;
    }
    if (iStep != null) {
      _result.iStep = iStep;
    }
    if (iRotate != null) {
      _result.iRotate = iRotate;
    }
    if (iModify != null) {
      _result.iModify = iModify;
    }
    return _result;
  }
  factory msg_cube_move.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_cube_move.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_cube_move clone() => msg_cube_move()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_cube_move copyWith(void Function(msg_cube_move) updates) => super.copyWith((message) => updates(message as msg_cube_move)) as msg_cube_move; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_cube_move create() => msg_cube_move._();
  msg_cube_move createEmptyInstance() => create();
  static $pb.PbList<msg_cube_move> createRepeated() => $pb.PbList<msg_cube_move>();
  @$core.pragma('dart2js:noInline')
  static msg_cube_move getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_cube_move>(create);
  static msg_cube_move? _defaultInstance;

  @$pb.TagNumber(1)
  msg_cube_angle get mAngle => $_getN(0);
  @$pb.TagNumber(1)
  set mAngle(msg_cube_angle v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMAngle() => $_has(0);
  @$pb.TagNumber(1)
  void clearMAngle() => clearField(1);
  @$pb.TagNumber(1)
  msg_cube_angle ensureMAngle() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get sMove => $_getSZ(1);
  @$pb.TagNumber(2)
  set sMove($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSMove() => $_has(1);
  @$pb.TagNumber(2)
  void clearSMove() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get iInterval => $_getIZ(2);
  @$pb.TagNumber(3)
  set iInterval($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIInterval() => $_has(2);
  @$pb.TagNumber(3)
  void clearIInterval() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get iStep => $_getIZ(3);
  @$pb.TagNumber(4)
  set iStep($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIStep() => $_has(3);
  @$pb.TagNumber(4)
  void clearIStep() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get iRotate => $_getIZ(4);
  @$pb.TagNumber(5)
  set iRotate($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIRotate() => $_has(4);
  @$pb.TagNumber(5)
  void clearIRotate() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get iModify => $_getIZ(5);
  @$pb.TagNumber(6)
  set iModify($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIModify() => $_has(5);
  @$pb.TagNumber(6)
  void clearIModify() => clearField(6);
}

class msg_cube_state extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_cube_state', createEmptyInstance: create)
    ..p<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iStateL', $pb.PbFieldType.K3, protoName: 'iStateL')
    ..p<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iUpFrontL', $pb.PbFieldType.K3, protoName: 'iUpFrontL')
    ..hasRequiredFields = false
  ;

  msg_cube_state._() : super();
  factory msg_cube_state({
    $core.Iterable<$core.int>? iStateL,
    $core.Iterable<$core.int>? iUpFrontL,
  }) {
    final _result = create();
    if (iStateL != null) {
      _result.iStateL.addAll(iStateL);
    }
    if (iUpFrontL != null) {
      _result.iUpFrontL.addAll(iUpFrontL);
    }
    return _result;
  }
  factory msg_cube_state.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_cube_state.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_cube_state clone() => msg_cube_state()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_cube_state copyWith(void Function(msg_cube_state) updates) => super.copyWith((message) => updates(message as msg_cube_state)) as msg_cube_state; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_cube_state create() => msg_cube_state._();
  msg_cube_state createEmptyInstance() => create();
  static $pb.PbList<msg_cube_state> createRepeated() => $pb.PbList<msg_cube_state>();
  @$core.pragma('dart2js:noInline')
  static msg_cube_state getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_cube_state>(create);
  static msg_cube_state? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get iStateL => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get iUpFrontL => $_getList(1);
}

class msg_cube_solution_order extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_cube_solution_order', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iOrder', $pb.PbFieldType.O3, protoName: 'iOrder')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iStartStep', $pb.PbFieldType.O3, protoName: 'iStartStep')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iOverStep', $pb.PbFieldType.O3, protoName: 'iOverStep')
    ..hasRequiredFields = false
  ;

  msg_cube_solution_order._() : super();
  factory msg_cube_solution_order({
    $core.int? iOrder,
    $core.int? iStartStep,
    $core.int? iOverStep,
  }) {
    final _result = create();
    if (iOrder != null) {
      _result.iOrder = iOrder;
    }
    if (iStartStep != null) {
      _result.iStartStep = iStartStep;
    }
    if (iOverStep != null) {
      _result.iOverStep = iOverStep;
    }
    return _result;
  }
  factory msg_cube_solution_order.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_cube_solution_order.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_cube_solution_order clone() => msg_cube_solution_order()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_cube_solution_order copyWith(void Function(msg_cube_solution_order) updates) => super.copyWith((message) => updates(message as msg_cube_solution_order)) as msg_cube_solution_order; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_cube_solution_order create() => msg_cube_solution_order._();
  msg_cube_solution_order createEmptyInstance() => create();
  static $pb.PbList<msg_cube_solution_order> createRepeated() => $pb.PbList<msg_cube_solution_order>();
  @$core.pragma('dart2js:noInline')
  static msg_cube_solution_order getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_cube_solution_order>(create);
  static msg_cube_solution_order? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get iOrder => $_getIZ(0);
  @$pb.TagNumber(1)
  set iOrder($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIOrder() => $_has(0);
  @$pb.TagNumber(1)
  void clearIOrder() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get iStartStep => $_getIZ(1);
  @$pb.TagNumber(2)
  set iStartStep($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIStartStep() => $_has(1);
  @$pb.TagNumber(2)
  void clearIStartStep() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get iOverStep => $_getIZ(2);
  @$pb.TagNumber(3)
  set iOverStep($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIOverStep() => $_has(2);
  @$pb.TagNumber(3)
  void clearIOverStep() => clearField(3);
}

class msg_cube_solution extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_cube_solution', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iType', $pb.PbFieldType.O3, protoName: 'iType')
    ..pc<msg_cube_solution_order>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mOrderL', $pb.PbFieldType.PM, protoName: 'mOrderL', subBuilder: msg_cube_solution_order.create)
    ..hasRequiredFields = false
  ;

  msg_cube_solution._() : super();
  factory msg_cube_solution({
    $core.int? iType,
    $core.Iterable<msg_cube_solution_order>? mOrderL,
  }) {
    final _result = create();
    if (iType != null) {
      _result.iType = iType;
    }
    if (mOrderL != null) {
      _result.mOrderL.addAll(mOrderL);
    }
    return _result;
  }
  factory msg_cube_solution.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_cube_solution.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_cube_solution clone() => msg_cube_solution()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_cube_solution copyWith(void Function(msg_cube_solution) updates) => super.copyWith((message) => updates(message as msg_cube_solution)) as msg_cube_solution; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_cube_solution create() => msg_cube_solution._();
  msg_cube_solution createEmptyInstance() => create();
  static $pb.PbList<msg_cube_solution> createRepeated() => $pb.PbList<msg_cube_solution>();
  @$core.pragma('dart2js:noInline')
  static msg_cube_solution getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_cube_solution>(create);
  static msg_cube_solution? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get iType => $_getIZ(0);
  @$pb.TagNumber(1)
  set iType($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIType() => $_has(0);
  @$pb.TagNumber(1)
  void clearIType() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<msg_cube_solution_order> get mOrderL => $_getList(1);
}

class msg_cube_review extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_cube_review', createEmptyInstance: create)
    ..pc<msg_cube_move>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mUserMoveL', $pb.PbFieldType.PM, protoName: 'mUserMoveL', subBuilder: msg_cube_move.create)
    ..pc<msg_cube_move>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mMoveL', $pb.PbFieldType.PM, protoName: 'mMoveL', subBuilder: msg_cube_move.create)
    ..pc<msg_cube_solution>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mSolutionL', $pb.PbFieldType.PM, protoName: 'mSolutionL', subBuilder: msg_cube_solution.create)
    ..hasRequiredFields = false
  ;

  msg_cube_review._() : super();
  factory msg_cube_review({
    $core.Iterable<msg_cube_move>? mUserMoveL,
    $core.Iterable<msg_cube_move>? mMoveL,
    $core.Iterable<msg_cube_solution>? mSolutionL,
  }) {
    final _result = create();
    if (mUserMoveL != null) {
      _result.mUserMoveL.addAll(mUserMoveL);
    }
    if (mMoveL != null) {
      _result.mMoveL.addAll(mMoveL);
    }
    if (mSolutionL != null) {
      _result.mSolutionL.addAll(mSolutionL);
    }
    return _result;
  }
  factory msg_cube_review.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_cube_review.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_cube_review clone() => msg_cube_review()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_cube_review copyWith(void Function(msg_cube_review) updates) => super.copyWith((message) => updates(message as msg_cube_review)) as msg_cube_review; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_cube_review create() => msg_cube_review._();
  msg_cube_review createEmptyInstance() => create();
  static $pb.PbList<msg_cube_review> createRepeated() => $pb.PbList<msg_cube_review>();
  @$core.pragma('dart2js:noInline')
  static msg_cube_review getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_cube_review>(create);
  static msg_cube_review? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<msg_cube_move> get mUserMoveL => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<msg_cube_move> get mMoveL => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<msg_cube_solution> get mSolutionL => $_getList(2);
}

class msg_cube_show extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_cube_show', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'modeId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'paster', $pb.PbFieldType.O3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'effects', $pb.PbFieldType.O3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'facade', $pb.PbFieldType.O3)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iEnableEffect', $pb.PbFieldType.O3, protoName: 'iEnableEffect')
    ..hasRequiredFields = false
  ;

  msg_cube_show._() : super();
  factory msg_cube_show({
    $core.int? modeId,
    $core.int? paster,
    $core.int? effects,
    $core.int? facade,
    $core.int? iEnableEffect,
  }) {
    final _result = create();
    if (modeId != null) {
      _result.modeId = modeId;
    }
    if (paster != null) {
      _result.paster = paster;
    }
    if (effects != null) {
      _result.effects = effects;
    }
    if (facade != null) {
      _result.facade = facade;
    }
    if (iEnableEffect != null) {
      _result.iEnableEffect = iEnableEffect;
    }
    return _result;
  }
  factory msg_cube_show.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_cube_show.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_cube_show clone() => msg_cube_show()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_cube_show copyWith(void Function(msg_cube_show) updates) => super.copyWith((message) => updates(message as msg_cube_show)) as msg_cube_show; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_cube_show create() => msg_cube_show._();
  msg_cube_show createEmptyInstance() => create();
  static $pb.PbList<msg_cube_show> createRepeated() => $pb.PbList<msg_cube_show>();
  @$core.pragma('dart2js:noInline')
  static msg_cube_show getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_cube_show>(create);
  static msg_cube_show? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get modeId => $_getIZ(0);
  @$pb.TagNumber(1)
  set modeId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasModeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearModeId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get paster => $_getIZ(1);
  @$pb.TagNumber(2)
  set paster($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPaster() => $_has(1);
  @$pb.TagNumber(2)
  void clearPaster() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get effects => $_getIZ(2);
  @$pb.TagNumber(3)
  set effects($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEffects() => $_has(2);
  @$pb.TagNumber(3)
  void clearEffects() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get facade => $_getIZ(3);
  @$pb.TagNumber(4)
  set facade($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFacade() => $_has(3);
  @$pb.TagNumber(4)
  void clearFacade() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get iEnableEffect => $_getIZ(4);
  @$pb.TagNumber(5)
  set iEnableEffect($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIEnableEffect() => $_has(4);
  @$pb.TagNumber(5)
  void clearIEnableEffect() => clearField(5);
}

class msg_solution_analyse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_solution_analyse', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iType', $pb.PbFieldType.O3, protoName: 'iType')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iOrder', $pb.PbFieldType.O3, protoName: 'iOrder')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iTotalDuration', $pb.PbFieldType.O3, protoName: 'iTotalDuration')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iDuration', $pb.PbFieldType.O3, protoName: 'iDuration')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iTurn', $pb.PbFieldType.O3, protoName: 'iTurn')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fTps', $pb.PbFieldType.OF, protoName: 'fTps')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iRotate', $pb.PbFieldType.O3, protoName: 'iRotate')
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iSmoothIndex', $pb.PbFieldType.O3, protoName: 'iSmoothIndex')
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iObserveTime', $pb.PbFieldType.O3, protoName: 'iObserveTime')
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iAdjustTime', $pb.PbFieldType.O3, protoName: 'iAdjustTime')
    ..a<$core.int>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iExecuteTime', $pb.PbFieldType.O3, protoName: 'iExecuteTime')
    ..a<$core.int>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iAUFTime', $pb.PbFieldType.O3, protoName: 'iAUFTime')
    ..a<$core.int>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iStartStep', $pb.PbFieldType.O3, protoName: 'iStartStep')
    ..a<$core.int>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iOverStep', $pb.PbFieldType.O3, protoName: 'iOverStep')
    ..hasRequiredFields = false
  ;

  msg_solution_analyse._() : super();
  factory msg_solution_analyse({
    $core.int? iType,
    $core.int? iOrder,
    $core.int? iTotalDuration,
    $core.int? iDuration,
    $core.int? iTurn,
    $core.double? fTps,
    $core.int? iRotate,
    $core.int? iSmoothIndex,
    $core.int? iObserveTime,
    $core.int? iAdjustTime,
    $core.int? iExecuteTime,
    $core.int? iAUFTime,
    $core.int? iStartStep,
    $core.int? iOverStep,
  }) {
    final _result = create();
    if (iType != null) {
      _result.iType = iType;
    }
    if (iOrder != null) {
      _result.iOrder = iOrder;
    }
    if (iTotalDuration != null) {
      _result.iTotalDuration = iTotalDuration;
    }
    if (iDuration != null) {
      _result.iDuration = iDuration;
    }
    if (iTurn != null) {
      _result.iTurn = iTurn;
    }
    if (fTps != null) {
      _result.fTps = fTps;
    }
    if (iRotate != null) {
      _result.iRotate = iRotate;
    }
    if (iSmoothIndex != null) {
      _result.iSmoothIndex = iSmoothIndex;
    }
    if (iObserveTime != null) {
      _result.iObserveTime = iObserveTime;
    }
    if (iAdjustTime != null) {
      _result.iAdjustTime = iAdjustTime;
    }
    if (iExecuteTime != null) {
      _result.iExecuteTime = iExecuteTime;
    }
    if (iAUFTime != null) {
      _result.iAUFTime = iAUFTime;
    }
    if (iStartStep != null) {
      _result.iStartStep = iStartStep;
    }
    if (iOverStep != null) {
      _result.iOverStep = iOverStep;
    }
    return _result;
  }
  factory msg_solution_analyse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_solution_analyse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_solution_analyse clone() => msg_solution_analyse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_solution_analyse copyWith(void Function(msg_solution_analyse) updates) => super.copyWith((message) => updates(message as msg_solution_analyse)) as msg_solution_analyse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_solution_analyse create() => msg_solution_analyse._();
  msg_solution_analyse createEmptyInstance() => create();
  static $pb.PbList<msg_solution_analyse> createRepeated() => $pb.PbList<msg_solution_analyse>();
  @$core.pragma('dart2js:noInline')
  static msg_solution_analyse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_solution_analyse>(create);
  static msg_solution_analyse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get iType => $_getIZ(0);
  @$pb.TagNumber(1)
  set iType($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIType() => $_has(0);
  @$pb.TagNumber(1)
  void clearIType() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get iOrder => $_getIZ(1);
  @$pb.TagNumber(2)
  set iOrder($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIOrder() => $_has(1);
  @$pb.TagNumber(2)
  void clearIOrder() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get iTotalDuration => $_getIZ(2);
  @$pb.TagNumber(3)
  set iTotalDuration($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasITotalDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearITotalDuration() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get iDuration => $_getIZ(3);
  @$pb.TagNumber(4)
  set iDuration($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIDuration() => $_has(3);
  @$pb.TagNumber(4)
  void clearIDuration() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get iTurn => $_getIZ(4);
  @$pb.TagNumber(5)
  set iTurn($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasITurn() => $_has(4);
  @$pb.TagNumber(5)
  void clearITurn() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get fTps => $_getN(5);
  @$pb.TagNumber(6)
  set fTps($core.double v) { $_setFloat(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFTps() => $_has(5);
  @$pb.TagNumber(6)
  void clearFTps() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get iRotate => $_getIZ(6);
  @$pb.TagNumber(7)
  set iRotate($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIRotate() => $_has(6);
  @$pb.TagNumber(7)
  void clearIRotate() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get iSmoothIndex => $_getIZ(7);
  @$pb.TagNumber(8)
  set iSmoothIndex($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasISmoothIndex() => $_has(7);
  @$pb.TagNumber(8)
  void clearISmoothIndex() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get iObserveTime => $_getIZ(8);
  @$pb.TagNumber(9)
  set iObserveTime($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIObserveTime() => $_has(8);
  @$pb.TagNumber(9)
  void clearIObserveTime() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get iAdjustTime => $_getIZ(9);
  @$pb.TagNumber(10)
  set iAdjustTime($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasIAdjustTime() => $_has(9);
  @$pb.TagNumber(10)
  void clearIAdjustTime() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get iExecuteTime => $_getIZ(10);
  @$pb.TagNumber(11)
  set iExecuteTime($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasIExecuteTime() => $_has(10);
  @$pb.TagNumber(11)
  void clearIExecuteTime() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get iAUFTime => $_getIZ(11);
  @$pb.TagNumber(12)
  set iAUFTime($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasIAUFTime() => $_has(11);
  @$pb.TagNumber(12)
  void clearIAUFTime() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get iStartStep => $_getIZ(12);
  @$pb.TagNumber(13)
  set iStartStep($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasIStartStep() => $_has(12);
  @$pb.TagNumber(13)
  void clearIStartStep() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get iOverStep => $_getIZ(13);
  @$pb.TagNumber(14)
  set iOverStep($core.int v) { $_setSignedInt32(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasIOverStep() => $_has(13);
  @$pb.TagNumber(14)
  void clearIOverStep() => clearField(14);
}

class msg_cube_common_data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_cube_common_data', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sCubeModel', protoName: 'sCubeModel')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iDuration', $pb.PbFieldType.O3, protoName: 'iDuration')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iTurn', $pb.PbFieldType.O3, protoName: 'iTurn')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iRotate', $pb.PbFieldType.O3, protoName: 'iRotate')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iSmoothIndex', $pb.PbFieldType.O3, protoName: 'iSmoothIndex')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sScramble', protoName: 'sScramble')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sReduction', protoName: 'sReduction')
    ..aOM<msg_cube_review>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mReview', protoName: 'mReview', subBuilder: msg_cube_review.create)
    ..pc<msg_solution_analyse>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mSolutionL', $pb.PbFieldType.PM, protoName: 'mSolutionL', subBuilder: msg_solution_analyse.create)
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iVersion', $pb.PbFieldType.O3, protoName: 'iVersion')
    ..a<$core.int>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iSolutionType', $pb.PbFieldType.O3, protoName: 'iSolutionType')
    ..a<$core.int>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iDownColor', $pb.PbFieldType.O3, protoName: 'iDownColor')
    ..a<$core.int>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iOLLIndex', $pb.PbFieldType.O3, protoName: 'iOLLIndex')
    ..a<$core.int>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iPLLIndex', $pb.PbFieldType.O3, protoName: 'iPLLIndex')
    ..hasRequiredFields = false
  ;

  msg_cube_common_data._() : super();
  factory msg_cube_common_data({
    $core.String? sCubeModel,
    $core.int? iDuration,
    $core.int? iTurn,
    $core.int? iRotate,
    $core.int? iSmoothIndex,
    $core.String? sScramble,
    $core.String? sReduction,
    msg_cube_review? mReview,
    $core.Iterable<msg_solution_analyse>? mSolutionL,
    $core.int? iVersion,
    $core.int? iSolutionType,
    $core.int? iDownColor,
    $core.int? iOLLIndex,
    $core.int? iPLLIndex,
  }) {
    final _result = create();
    if (sCubeModel != null) {
      _result.sCubeModel = sCubeModel;
    }
    if (iDuration != null) {
      _result.iDuration = iDuration;
    }
    if (iTurn != null) {
      _result.iTurn = iTurn;
    }
    if (iRotate != null) {
      _result.iRotate = iRotate;
    }
    if (iSmoothIndex != null) {
      _result.iSmoothIndex = iSmoothIndex;
    }
    if (sScramble != null) {
      _result.sScramble = sScramble;
    }
    if (sReduction != null) {
      _result.sReduction = sReduction;
    }
    if (mReview != null) {
      _result.mReview = mReview;
    }
    if (mSolutionL != null) {
      _result.mSolutionL.addAll(mSolutionL);
    }
    if (iVersion != null) {
      _result.iVersion = iVersion;
    }
    if (iSolutionType != null) {
      _result.iSolutionType = iSolutionType;
    }
    if (iDownColor != null) {
      _result.iDownColor = iDownColor;
    }
    if (iOLLIndex != null) {
      _result.iOLLIndex = iOLLIndex;
    }
    if (iPLLIndex != null) {
      _result.iPLLIndex = iPLLIndex;
    }
    return _result;
  }
  factory msg_cube_common_data.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_cube_common_data.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_cube_common_data clone() => msg_cube_common_data()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_cube_common_data copyWith(void Function(msg_cube_common_data) updates) => super.copyWith((message) => updates(message as msg_cube_common_data)) as msg_cube_common_data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_cube_common_data create() => msg_cube_common_data._();
  msg_cube_common_data createEmptyInstance() => create();
  static $pb.PbList<msg_cube_common_data> createRepeated() => $pb.PbList<msg_cube_common_data>();
  @$core.pragma('dart2js:noInline')
  static msg_cube_common_data getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_cube_common_data>(create);
  static msg_cube_common_data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sCubeModel => $_getSZ(0);
  @$pb.TagNumber(1)
  set sCubeModel($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSCubeModel() => $_has(0);
  @$pb.TagNumber(1)
  void clearSCubeModel() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get iDuration => $_getIZ(1);
  @$pb.TagNumber(2)
  set iDuration($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIDuration() => $_has(1);
  @$pb.TagNumber(2)
  void clearIDuration() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get iTurn => $_getIZ(2);
  @$pb.TagNumber(3)
  set iTurn($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasITurn() => $_has(2);
  @$pb.TagNumber(3)
  void clearITurn() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get iRotate => $_getIZ(3);
  @$pb.TagNumber(4)
  set iRotate($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIRotate() => $_has(3);
  @$pb.TagNumber(4)
  void clearIRotate() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get iSmoothIndex => $_getIZ(4);
  @$pb.TagNumber(5)
  set iSmoothIndex($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasISmoothIndex() => $_has(4);
  @$pb.TagNumber(5)
  void clearISmoothIndex() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get sScramble => $_getSZ(5);
  @$pb.TagNumber(6)
  set sScramble($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSScramble() => $_has(5);
  @$pb.TagNumber(6)
  void clearSScramble() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get sReduction => $_getSZ(6);
  @$pb.TagNumber(7)
  set sReduction($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSReduction() => $_has(6);
  @$pb.TagNumber(7)
  void clearSReduction() => clearField(7);

  @$pb.TagNumber(8)
  msg_cube_review get mReview => $_getN(7);
  @$pb.TagNumber(8)
  set mReview(msg_cube_review v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasMReview() => $_has(7);
  @$pb.TagNumber(8)
  void clearMReview() => clearField(8);
  @$pb.TagNumber(8)
  msg_cube_review ensureMReview() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.List<msg_solution_analyse> get mSolutionL => $_getList(8);

  @$pb.TagNumber(10)
  $core.int get iVersion => $_getIZ(9);
  @$pb.TagNumber(10)
  set iVersion($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasIVersion() => $_has(9);
  @$pb.TagNumber(10)
  void clearIVersion() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get iSolutionType => $_getIZ(10);
  @$pb.TagNumber(11)
  set iSolutionType($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasISolutionType() => $_has(10);
  @$pb.TagNumber(11)
  void clearISolutionType() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get iDownColor => $_getIZ(11);
  @$pb.TagNumber(12)
  set iDownColor($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasIDownColor() => $_has(11);
  @$pb.TagNumber(12)
  void clearIDownColor() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get iOLLIndex => $_getIZ(12);
  @$pb.TagNumber(13)
  set iOLLIndex($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasIOLLIndex() => $_has(12);
  @$pb.TagNumber(13)
  void clearIOLLIndex() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get iPLLIndex => $_getIZ(13);
  @$pb.TagNumber(14)
  set iPLLIndex($core.int v) { $_setSignedInt32(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasIPLLIndex() => $_has(13);
  @$pb.TagNumber(14)
  void clearIPLLIndex() => clearField(14);
}

class msg_mirror_image extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_mirror_image', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iDuration', $pb.PbFieldType.O3, protoName: 'iDuration')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sScramble', protoName: 'sScramble')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sReduction', protoName: 'sReduction')
    ..aOM<msg_cube_review>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mReview', protoName: 'mReview', subBuilder: msg_cube_review.create)
    ..hasRequiredFields = false
  ;

  msg_mirror_image._() : super();
  factory msg_mirror_image({
    $core.int? iDuration,
    $core.String? sScramble,
    $core.String? sReduction,
    msg_cube_review? mReview,
  }) {
    final _result = create();
    if (iDuration != null) {
      _result.iDuration = iDuration;
    }
    if (sScramble != null) {
      _result.sScramble = sScramble;
    }
    if (sReduction != null) {
      _result.sReduction = sReduction;
    }
    if (mReview != null) {
      _result.mReview = mReview;
    }
    return _result;
  }
  factory msg_mirror_image.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_mirror_image.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_mirror_image clone() => msg_mirror_image()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_mirror_image copyWith(void Function(msg_mirror_image) updates) => super.copyWith((message) => updates(message as msg_mirror_image)) as msg_mirror_image; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_mirror_image create() => msg_mirror_image._();
  msg_mirror_image createEmptyInstance() => create();
  static $pb.PbList<msg_mirror_image> createRepeated() => $pb.PbList<msg_mirror_image>();
  @$core.pragma('dart2js:noInline')
  static msg_mirror_image getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_mirror_image>(create);
  static msg_mirror_image? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get iDuration => $_getIZ(0);
  @$pb.TagNumber(1)
  set iDuration($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIDuration() => $_has(0);
  @$pb.TagNumber(1)
  void clearIDuration() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sScramble => $_getSZ(1);
  @$pb.TagNumber(2)
  set sScramble($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSScramble() => $_has(1);
  @$pb.TagNumber(2)
  void clearSScramble() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sReduction => $_getSZ(2);
  @$pb.TagNumber(3)
  set sReduction($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSReduction() => $_has(2);
  @$pb.TagNumber(3)
  void clearSReduction() => clearField(3);

  @$pb.TagNumber(4)
  msg_cube_review get mReview => $_getN(3);
  @$pb.TagNumber(4)
  set mReview(msg_cube_review v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasMReview() => $_has(3);
  @$pb.TagNumber(4)
  void clearMReview() => clearField(4);
  @$pb.TagNumber(4)
  msg_cube_review ensureMReview() => $_ensure(3);
}

class msg_referee_info extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_referee_info', createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iUserID', protoName: 'iUserID')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bOnline', protoName: 'bOnline')
    ..hasRequiredFields = false
  ;

  msg_referee_info._() : super();
  factory msg_referee_info({
    $fixnum.Int64? iUserID,
    $core.bool? bOnline,
  }) {
    final _result = create();
    if (iUserID != null) {
      _result.iUserID = iUserID;
    }
    if (bOnline != null) {
      _result.bOnline = bOnline;
    }
    return _result;
  }
  factory msg_referee_info.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_referee_info.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_referee_info clone() => msg_referee_info()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_referee_info copyWith(void Function(msg_referee_info) updates) => super.copyWith((message) => updates(message as msg_referee_info)) as msg_referee_info; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_referee_info create() => msg_referee_info._();
  msg_referee_info createEmptyInstance() => create();
  static $pb.PbList<msg_referee_info> createRepeated() => $pb.PbList<msg_referee_info>();
  @$core.pragma('dart2js:noInline')
  static msg_referee_info getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_referee_info>(create);
  static msg_referee_info? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get iUserID => $_getI64(0);
  @$pb.TagNumber(1)
  set iUserID($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearIUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get bOnline => $_getBF(1);
  @$pb.TagNumber(2)
  set bOnline($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBOnline() => $_has(1);
  @$pb.TagNumber(2)
  void clearBOnline() => clearField(2);
}

class msg_room_player_info extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_room_player_info', createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iUserID', protoName: 'iUserID')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sNickName', protoName: 'sNickName')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sAvatar', protoName: 'sAvatar')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iAvatarBoxID', $pb.PbFieldType.O3, protoName: 'iAvatarBoxID')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iFlagID', $pb.PbFieldType.O3, protoName: 'iFlagID')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iStatus', $pb.PbFieldType.O3, protoName: 'iStatus')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iCompID', $pb.PbFieldType.O3, protoName: 'iCompID')
    ..pc<msg_equipment>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mEquipments', $pb.PbFieldType.PM, protoName: 'mEquipments', subBuilder: msg_equipment.create)
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iAccType', $pb.PbFieldType.O3, protoName: 'iAccType')
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iCertificateType', $pb.PbFieldType.O3, protoName: 'iCertificateType')
    ..a<$core.int>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iRoomID', $pb.PbFieldType.O3, protoName: 'iRoomID')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sMajorNickName', protoName: 'sMajorNickName')
    ..a<$core.int>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iRecoverEffectsID', $pb.PbFieldType.O3, protoName: 'iRecoverEffectsID')
    ..a<$core.int>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iCup', $pb.PbFieldType.O3, protoName: 'iCup')
    ..hasRequiredFields = false
  ;

  msg_room_player_info._() : super();
  factory msg_room_player_info({
    $fixnum.Int64? iUserID,
    $core.String? sNickName,
    $core.String? sAvatar,
    $core.int? iAvatarBoxID,
    $core.int? iFlagID,
    $core.int? iStatus,
    $core.int? iCompID,
    $core.Iterable<msg_equipment>? mEquipments,
    $core.int? iAccType,
    $core.int? iCertificateType,
    $core.int? iRoomID,
    $core.String? sMajorNickName,
    $core.int? iRecoverEffectsID,
    $core.int? iCup,
  }) {
    final _result = create();
    if (iUserID != null) {
      _result.iUserID = iUserID;
    }
    if (sNickName != null) {
      _result.sNickName = sNickName;
    }
    if (sAvatar != null) {
      _result.sAvatar = sAvatar;
    }
    if (iAvatarBoxID != null) {
      _result.iAvatarBoxID = iAvatarBoxID;
    }
    if (iFlagID != null) {
      _result.iFlagID = iFlagID;
    }
    if (iStatus != null) {
      _result.iStatus = iStatus;
    }
    if (iCompID != null) {
      _result.iCompID = iCompID;
    }
    if (mEquipments != null) {
      _result.mEquipments.addAll(mEquipments);
    }
    if (iAccType != null) {
      _result.iAccType = iAccType;
    }
    if (iCertificateType != null) {
      _result.iCertificateType = iCertificateType;
    }
    if (iRoomID != null) {
      _result.iRoomID = iRoomID;
    }
    if (sMajorNickName != null) {
      _result.sMajorNickName = sMajorNickName;
    }
    if (iRecoverEffectsID != null) {
      _result.iRecoverEffectsID = iRecoverEffectsID;
    }
    if (iCup != null) {
      _result.iCup = iCup;
    }
    return _result;
  }
  factory msg_room_player_info.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_room_player_info.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_room_player_info clone() => msg_room_player_info()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_room_player_info copyWith(void Function(msg_room_player_info) updates) => super.copyWith((message) => updates(message as msg_room_player_info)) as msg_room_player_info; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_room_player_info create() => msg_room_player_info._();
  msg_room_player_info createEmptyInstance() => create();
  static $pb.PbList<msg_room_player_info> createRepeated() => $pb.PbList<msg_room_player_info>();
  @$core.pragma('dart2js:noInline')
  static msg_room_player_info getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_room_player_info>(create);
  static msg_room_player_info? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get iUserID => $_getI64(0);
  @$pb.TagNumber(1)
  set iUserID($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearIUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sNickName => $_getSZ(1);
  @$pb.TagNumber(2)
  set sNickName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSNickName() => $_has(1);
  @$pb.TagNumber(2)
  void clearSNickName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sAvatar => $_getSZ(2);
  @$pb.TagNumber(3)
  set sAvatar($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSAvatar() => $_has(2);
  @$pb.TagNumber(3)
  void clearSAvatar() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get iAvatarBoxID => $_getIZ(3);
  @$pb.TagNumber(4)
  set iAvatarBoxID($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIAvatarBoxID() => $_has(3);
  @$pb.TagNumber(4)
  void clearIAvatarBoxID() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get iFlagID => $_getIZ(4);
  @$pb.TagNumber(5)
  set iFlagID($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIFlagID() => $_has(4);
  @$pb.TagNumber(5)
  void clearIFlagID() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get iStatus => $_getIZ(5);
  @$pb.TagNumber(6)
  set iStatus($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearIStatus() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get iCompID => $_getIZ(6);
  @$pb.TagNumber(7)
  set iCompID($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasICompID() => $_has(6);
  @$pb.TagNumber(7)
  void clearICompID() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<msg_equipment> get mEquipments => $_getList(7);

  @$pb.TagNumber(9)
  $core.int get iAccType => $_getIZ(8);
  @$pb.TagNumber(9)
  set iAccType($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIAccType() => $_has(8);
  @$pb.TagNumber(9)
  void clearIAccType() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get iCertificateType => $_getIZ(9);
  @$pb.TagNumber(10)
  set iCertificateType($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasICertificateType() => $_has(9);
  @$pb.TagNumber(10)
  void clearICertificateType() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get iRoomID => $_getIZ(10);
  @$pb.TagNumber(11)
  set iRoomID($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasIRoomID() => $_has(10);
  @$pb.TagNumber(11)
  void clearIRoomID() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get sMajorNickName => $_getSZ(11);
  @$pb.TagNumber(12)
  set sMajorNickName($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasSMajorNickName() => $_has(11);
  @$pb.TagNumber(12)
  void clearSMajorNickName() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get iRecoverEffectsID => $_getIZ(12);
  @$pb.TagNumber(13)
  set iRecoverEffectsID($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasIRecoverEffectsID() => $_has(12);
  @$pb.TagNumber(13)
  void clearIRecoverEffectsID() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get iCup => $_getIZ(13);
  @$pb.TagNumber(14)
  set iCup($core.int v) { $_setSignedInt32(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasICup() => $_has(13);
  @$pb.TagNumber(14)
  void clearICup() => clearField(14);
}

class msg_player_team_info extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_player_team_info', createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iUserID', protoName: 'iUserID')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sNickName', protoName: 'sNickName')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sAvatar', protoName: 'sAvatar')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iAvatarBoxID', $pb.PbFieldType.O3, protoName: 'iAvatarBoxID')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iLogoutTime', $pb.PbFieldType.O3, protoName: 'iLogoutTime')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iCup', $pb.PbFieldType.O3, protoName: 'iCup')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'weekLiveness', $pb.PbFieldType.O3, protoName: 'weekLiveness')
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hisLiveness', $pb.PbFieldType.O3, protoName: 'hisLiveness')
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastWeekMatch', $pb.PbFieldType.O3, protoName: 'lastWeekMatch')
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'seasonMatch', $pb.PbFieldType.O3, protoName: 'seasonMatch')
    ..a<$core.int>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'teamPoint', $pb.PbFieldType.O3, protoName: 'teamPoint')
    ..a<$core.int>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'qualifyLv', $pb.PbFieldType.O3, protoName: 'qualifyLv')
    ..a<$core.int>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sportsVal', $pb.PbFieldType.O3, protoName: 'sportsVal')
    ..a<$core.int>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fightVal', $pb.PbFieldType.O3, protoName: 'fightVal')
    ..hasRequiredFields = false
  ;

  msg_player_team_info._() : super();
  factory msg_player_team_info({
    $fixnum.Int64? iUserID,
    $core.String? sNickName,
    $core.String? sAvatar,
    $core.int? iAvatarBoxID,
    $core.int? iLogoutTime,
    $core.int? iCup,
    $core.int? weekLiveness,
    $core.int? hisLiveness,
    $core.int? lastWeekMatch,
    $core.int? seasonMatch,
    $core.int? teamPoint,
    $core.int? qualifyLv,
    $core.int? sportsVal,
    $core.int? fightVal,
  }) {
    final _result = create();
    if (iUserID != null) {
      _result.iUserID = iUserID;
    }
    if (sNickName != null) {
      _result.sNickName = sNickName;
    }
    if (sAvatar != null) {
      _result.sAvatar = sAvatar;
    }
    if (iAvatarBoxID != null) {
      _result.iAvatarBoxID = iAvatarBoxID;
    }
    if (iLogoutTime != null) {
      _result.iLogoutTime = iLogoutTime;
    }
    if (iCup != null) {
      _result.iCup = iCup;
    }
    if (weekLiveness != null) {
      _result.weekLiveness = weekLiveness;
    }
    if (hisLiveness != null) {
      _result.hisLiveness = hisLiveness;
    }
    if (lastWeekMatch != null) {
      _result.lastWeekMatch = lastWeekMatch;
    }
    if (seasonMatch != null) {
      _result.seasonMatch = seasonMatch;
    }
    if (teamPoint != null) {
      _result.teamPoint = teamPoint;
    }
    if (qualifyLv != null) {
      _result.qualifyLv = qualifyLv;
    }
    if (sportsVal != null) {
      _result.sportsVal = sportsVal;
    }
    if (fightVal != null) {
      _result.fightVal = fightVal;
    }
    return _result;
  }
  factory msg_player_team_info.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_player_team_info.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_player_team_info clone() => msg_player_team_info()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_player_team_info copyWith(void Function(msg_player_team_info) updates) => super.copyWith((message) => updates(message as msg_player_team_info)) as msg_player_team_info; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_player_team_info create() => msg_player_team_info._();
  msg_player_team_info createEmptyInstance() => create();
  static $pb.PbList<msg_player_team_info> createRepeated() => $pb.PbList<msg_player_team_info>();
  @$core.pragma('dart2js:noInline')
  static msg_player_team_info getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_player_team_info>(create);
  static msg_player_team_info? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get iUserID => $_getI64(0);
  @$pb.TagNumber(1)
  set iUserID($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearIUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sNickName => $_getSZ(1);
  @$pb.TagNumber(2)
  set sNickName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSNickName() => $_has(1);
  @$pb.TagNumber(2)
  void clearSNickName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sAvatar => $_getSZ(2);
  @$pb.TagNumber(3)
  set sAvatar($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSAvatar() => $_has(2);
  @$pb.TagNumber(3)
  void clearSAvatar() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get iAvatarBoxID => $_getIZ(3);
  @$pb.TagNumber(4)
  set iAvatarBoxID($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIAvatarBoxID() => $_has(3);
  @$pb.TagNumber(4)
  void clearIAvatarBoxID() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get iLogoutTime => $_getIZ(4);
  @$pb.TagNumber(5)
  set iLogoutTime($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasILogoutTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearILogoutTime() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get iCup => $_getIZ(5);
  @$pb.TagNumber(6)
  set iCup($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasICup() => $_has(5);
  @$pb.TagNumber(6)
  void clearICup() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get weekLiveness => $_getIZ(6);
  @$pb.TagNumber(7)
  set weekLiveness($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasWeekLiveness() => $_has(6);
  @$pb.TagNumber(7)
  void clearWeekLiveness() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get hisLiveness => $_getIZ(7);
  @$pb.TagNumber(8)
  set hisLiveness($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasHisLiveness() => $_has(7);
  @$pb.TagNumber(8)
  void clearHisLiveness() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get lastWeekMatch => $_getIZ(8);
  @$pb.TagNumber(9)
  set lastWeekMatch($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasLastWeekMatch() => $_has(8);
  @$pb.TagNumber(9)
  void clearLastWeekMatch() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get seasonMatch => $_getIZ(9);
  @$pb.TagNumber(10)
  set seasonMatch($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasSeasonMatch() => $_has(9);
  @$pb.TagNumber(10)
  void clearSeasonMatch() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get teamPoint => $_getIZ(10);
  @$pb.TagNumber(11)
  set teamPoint($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasTeamPoint() => $_has(10);
  @$pb.TagNumber(11)
  void clearTeamPoint() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get qualifyLv => $_getIZ(11);
  @$pb.TagNumber(12)
  set qualifyLv($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasQualifyLv() => $_has(11);
  @$pb.TagNumber(12)
  void clearQualifyLv() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get sportsVal => $_getIZ(12);
  @$pb.TagNumber(13)
  set sportsVal($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasSportsVal() => $_has(12);
  @$pb.TagNumber(13)
  void clearSportsVal() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get fightVal => $_getIZ(13);
  @$pb.TagNumber(14)
  set fightVal($core.int v) { $_setSignedInt32(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasFightVal() => $_has(13);
  @$pb.TagNumber(14)
  void clearFightVal() => clearField(14);
}

class msg_player_page extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_player_page', createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iUserID', protoName: 'iUserID')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sNickName', protoName: 'sNickName')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sAvatar', protoName: 'sAvatar')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iAvatarBoxID', $pb.PbFieldType.O3, protoName: 'iAvatarBoxID')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iFlagID', $pb.PbFieldType.O3, protoName: 'iFlagID')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sSignature', protoName: 'sSignature')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iStatus', $pb.PbFieldType.O3, protoName: 'iStatus')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sCity', protoName: 'sCity')
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iTeamID', $pb.PbFieldType.O3, protoName: 'iTeamID')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sTeamName', protoName: 'sTeamName')
    ..a<$core.int>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iCertificateType', $pb.PbFieldType.O3, protoName: 'iCertificateType')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sCertificateCont', protoName: 'sCertificateCont')
    ..hasRequiredFields = false
  ;

  msg_player_page._() : super();
  factory msg_player_page({
    $fixnum.Int64? iUserID,
    $core.String? sNickName,
    $core.String? sAvatar,
    $core.int? iAvatarBoxID,
    $core.int? iFlagID,
    $core.String? sSignature,
    $core.int? iStatus,
    $core.String? sCity,
    $core.int? iTeamID,
    $core.String? sTeamName,
    $core.int? iCertificateType,
    $core.String? sCertificateCont,
  }) {
    final _result = create();
    if (iUserID != null) {
      _result.iUserID = iUserID;
    }
    if (sNickName != null) {
      _result.sNickName = sNickName;
    }
    if (sAvatar != null) {
      _result.sAvatar = sAvatar;
    }
    if (iAvatarBoxID != null) {
      _result.iAvatarBoxID = iAvatarBoxID;
    }
    if (iFlagID != null) {
      _result.iFlagID = iFlagID;
    }
    if (sSignature != null) {
      _result.sSignature = sSignature;
    }
    if (iStatus != null) {
      _result.iStatus = iStatus;
    }
    if (sCity != null) {
      _result.sCity = sCity;
    }
    if (iTeamID != null) {
      _result.iTeamID = iTeamID;
    }
    if (sTeamName != null) {
      _result.sTeamName = sTeamName;
    }
    if (iCertificateType != null) {
      _result.iCertificateType = iCertificateType;
    }
    if (sCertificateCont != null) {
      _result.sCertificateCont = sCertificateCont;
    }
    return _result;
  }
  factory msg_player_page.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_player_page.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_player_page clone() => msg_player_page()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_player_page copyWith(void Function(msg_player_page) updates) => super.copyWith((message) => updates(message as msg_player_page)) as msg_player_page; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_player_page create() => msg_player_page._();
  msg_player_page createEmptyInstance() => create();
  static $pb.PbList<msg_player_page> createRepeated() => $pb.PbList<msg_player_page>();
  @$core.pragma('dart2js:noInline')
  static msg_player_page getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_player_page>(create);
  static msg_player_page? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get iUserID => $_getI64(0);
  @$pb.TagNumber(1)
  set iUserID($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearIUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sNickName => $_getSZ(1);
  @$pb.TagNumber(2)
  set sNickName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSNickName() => $_has(1);
  @$pb.TagNumber(2)
  void clearSNickName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sAvatar => $_getSZ(2);
  @$pb.TagNumber(3)
  set sAvatar($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSAvatar() => $_has(2);
  @$pb.TagNumber(3)
  void clearSAvatar() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get iAvatarBoxID => $_getIZ(3);
  @$pb.TagNumber(4)
  set iAvatarBoxID($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIAvatarBoxID() => $_has(3);
  @$pb.TagNumber(4)
  void clearIAvatarBoxID() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get iFlagID => $_getIZ(4);
  @$pb.TagNumber(5)
  set iFlagID($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIFlagID() => $_has(4);
  @$pb.TagNumber(5)
  void clearIFlagID() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get sSignature => $_getSZ(5);
  @$pb.TagNumber(6)
  set sSignature($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSSignature() => $_has(5);
  @$pb.TagNumber(6)
  void clearSSignature() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get iStatus => $_getIZ(6);
  @$pb.TagNumber(7)
  set iStatus($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearIStatus() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get sCity => $_getSZ(7);
  @$pb.TagNumber(8)
  set sCity($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasSCity() => $_has(7);
  @$pb.TagNumber(8)
  void clearSCity() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get iTeamID => $_getIZ(8);
  @$pb.TagNumber(9)
  set iTeamID($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasITeamID() => $_has(8);
  @$pb.TagNumber(9)
  void clearITeamID() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get sTeamName => $_getSZ(9);
  @$pb.TagNumber(10)
  set sTeamName($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasSTeamName() => $_has(9);
  @$pb.TagNumber(10)
  void clearSTeamName() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get iCertificateType => $_getIZ(10);
  @$pb.TagNumber(11)
  set iCertificateType($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasICertificateType() => $_has(10);
  @$pb.TagNumber(11)
  void clearICertificateType() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get sCertificateCont => $_getSZ(11);
  @$pb.TagNumber(12)
  set sCertificateCont($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasSCertificateCont() => $_has(11);
  @$pb.TagNumber(12)
  void clearSCertificateCont() => clearField(12);
}

class msg_player_statistics extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_player_statistics', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iEnterNum', $pb.PbFieldType.O3, protoName: 'iEnterNum')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iFinishNum', $pb.PbFieldType.O3, protoName: 'iFinishNum')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iAvg', $pb.PbFieldType.O3, protoName: 'iAvg')
    ..hasRequiredFields = false
  ;

  msg_player_statistics._() : super();
  factory msg_player_statistics({
    $core.int? iEnterNum,
    $core.int? iFinishNum,
    $core.int? iAvg,
  }) {
    final _result = create();
    if (iEnterNum != null) {
      _result.iEnterNum = iEnterNum;
    }
    if (iFinishNum != null) {
      _result.iFinishNum = iFinishNum;
    }
    if (iAvg != null) {
      _result.iAvg = iAvg;
    }
    return _result;
  }
  factory msg_player_statistics.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_player_statistics.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_player_statistics clone() => msg_player_statistics()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_player_statistics copyWith(void Function(msg_player_statistics) updates) => super.copyWith((message) => updates(message as msg_player_statistics)) as msg_player_statistics; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_player_statistics create() => msg_player_statistics._();
  msg_player_statistics createEmptyInstance() => create();
  static $pb.PbList<msg_player_statistics> createRepeated() => $pb.PbList<msg_player_statistics>();
  @$core.pragma('dart2js:noInline')
  static msg_player_statistics getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_player_statistics>(create);
  static msg_player_statistics? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get iEnterNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set iEnterNum($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIEnterNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearIEnterNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get iFinishNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set iFinishNum($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIFinishNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearIFinishNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get iAvg => $_getIZ(2);
  @$pb.TagNumber(3)
  set iAvg($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIAvg() => $_has(2);
  @$pb.TagNumber(3)
  void clearIAvg() => clearField(3);
}

class msg_five_dimensional_map extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_five_dimensional_map', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iDuration', $pb.PbFieldType.O3, protoName: 'iDuration')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iSummary', $pb.PbFieldType.O3, protoName: 'iSummary')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iTps', $pb.PbFieldType.O3, protoName: 'iTps')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iTurn', $pb.PbFieldType.O3, protoName: 'iTurn')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iSmooth', $pb.PbFieldType.O3, protoName: 'iSmooth')
    ..hasRequiredFields = false
  ;

  msg_five_dimensional_map._() : super();
  factory msg_five_dimensional_map({
    $core.int? iDuration,
    $core.int? iSummary,
    $core.int? iTps,
    $core.int? iTurn,
    $core.int? iSmooth,
  }) {
    final _result = create();
    if (iDuration != null) {
      _result.iDuration = iDuration;
    }
    if (iSummary != null) {
      _result.iSummary = iSummary;
    }
    if (iTps != null) {
      _result.iTps = iTps;
    }
    if (iTurn != null) {
      _result.iTurn = iTurn;
    }
    if (iSmooth != null) {
      _result.iSmooth = iSmooth;
    }
    return _result;
  }
  factory msg_five_dimensional_map.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_five_dimensional_map.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_five_dimensional_map clone() => msg_five_dimensional_map()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_five_dimensional_map copyWith(void Function(msg_five_dimensional_map) updates) => super.copyWith((message) => updates(message as msg_five_dimensional_map)) as msg_five_dimensional_map; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_five_dimensional_map create() => msg_five_dimensional_map._();
  msg_five_dimensional_map createEmptyInstance() => create();
  static $pb.PbList<msg_five_dimensional_map> createRepeated() => $pb.PbList<msg_five_dimensional_map>();
  @$core.pragma('dart2js:noInline')
  static msg_five_dimensional_map getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_five_dimensional_map>(create);
  static msg_five_dimensional_map? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get iDuration => $_getIZ(0);
  @$pb.TagNumber(1)
  set iDuration($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIDuration() => $_has(0);
  @$pb.TagNumber(1)
  void clearIDuration() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get iSummary => $_getIZ(1);
  @$pb.TagNumber(2)
  set iSummary($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasISummary() => $_has(1);
  @$pb.TagNumber(2)
  void clearISummary() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get iTps => $_getIZ(2);
  @$pb.TagNumber(3)
  set iTps($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasITps() => $_has(2);
  @$pb.TagNumber(3)
  void clearITps() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get iTurn => $_getIZ(3);
  @$pb.TagNumber(4)
  set iTurn($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasITurn() => $_has(3);
  @$pb.TagNumber(4)
  void clearITurn() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get iSmooth => $_getIZ(4);
  @$pb.TagNumber(5)
  set iSmooth($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasISmooth() => $_has(4);
  @$pb.TagNumber(5)
  void clearISmooth() => clearField(5);
}

class msg_ranker extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'msg_ranker', createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rank', $pb.PbFieldType.O3)
    ..pPS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'strs')
    ..hasRequiredFields = false
  ;

  msg_ranker._() : super();
  factory msg_ranker({
    $fixnum.Int64? id,
    $core.int? rank,
    $core.Iterable<$core.String>? strs,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    if (strs != null) {
      _result.strs.addAll(strs);
    }
    return _result;
  }
  factory msg_ranker.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory msg_ranker.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  msg_ranker clone() => msg_ranker()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  msg_ranker copyWith(void Function(msg_ranker) updates) => super.copyWith((message) => updates(message as msg_ranker)) as msg_ranker; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static msg_ranker create() => msg_ranker._();
  msg_ranker createEmptyInstance() => create();
  static $pb.PbList<msg_ranker> createRepeated() => $pb.PbList<msg_ranker>();
  @$core.pragma('dart2js:noInline')
  static msg_ranker getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<msg_ranker>(create);
  static msg_ranker? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get rank => $_getIZ(1);
  @$pb.TagNumber(2)
  set rank($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRank() => $_has(1);
  @$pb.TagNumber(2)
  void clearRank() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get strs => $_getList(2);
}

