///
//  Generated code. Do not modify.
//  source: login.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use c2s_heartbeatDescriptor instead')
const c2s_heartbeat$json = const {
  '1': 'c2s_heartbeat',
};

/// Descriptor for `c2s_heartbeat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c2s_heartbeatDescriptor = $convert.base64Decode('Cg1jMnNfaGVhcnRiZWF0');
@$core.Deprecated('Use s2c_heartbeatDescriptor instead')
const s2c_heartbeat$json = const {
  '1': 's2c_heartbeat',
  '2': const [
    const {'1': 'timestamp', '3': 1, '4': 1, '5': 3, '10': 'timestamp'},
  ],
};

/// Descriptor for `s2c_heartbeat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s2c_heartbeatDescriptor = $convert.base64Decode('Cg1zMmNfaGVhcnRiZWF0EhwKCXRpbWVzdGFtcBgBIAEoA1IJdGltZXN0YW1w');
@$core.Deprecated('Use c2s_login_visitorDescriptor instead')
const c2s_login_visitor$json = const {
  '1': 'c2s_login_visitor',
  '2': const [
    const {'1': 'sMachineCode', '3': 1, '4': 1, '5': 9, '10': 'sMachineCode'},
    const {'1': 'iChannelID', '3': 2, '4': 1, '5': 5, '9': 0, '10': 'iChannelID', '17': true},
  ],
  '8': const [
    const {'1': '_iChannelID'},
  ],
};

/// Descriptor for `c2s_login_visitor`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c2s_login_visitorDescriptor = $convert.base64Decode('ChFjMnNfbG9naW5fdmlzaXRvchIiCgxzTWFjaGluZUNvZGUYASABKAlSDHNNYWNoaW5lQ29kZRIjCgppQ2hhbm5lbElEGAIgASgFSABSCmlDaGFubmVsSUSIAQFCDQoLX2lDaGFubmVsSUQ=');
@$core.Deprecated('Use s2c_login_visitorDescriptor instead')
const s2c_login_visitor$json = const {
  '1': 's2c_login_visitor',
  '2': const [
    const {'1': 'eCode', '3': 1, '4': 1, '5': 14, '6': '.response_code', '10': 'eCode'},
  ],
};

/// Descriptor for `s2c_login_visitor`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s2c_login_visitorDescriptor = $convert.base64Decode('ChFzMmNfbG9naW5fdmlzaXRvchIkCgVlQ29kZRgBIAEoDjIOLnJlc3BvbnNlX2NvZGVSBWVDb2Rl');
@$core.Deprecated('Use c2s_login_passwordDescriptor instead')
const c2s_login_password$json = const {
  '1': 'c2s_login_password',
  '2': const [
    const {'1': 'sPhoneNum', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'sPhoneNum', '17': true},
    const {'1': 'sEmail', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'sEmail', '17': true},
    const {'1': 'sPassword', '3': 3, '4': 1, '5': 9, '10': 'sPassword'},
    const {'1': 'iLoginTime', '3': 4, '4': 1, '5': 5, '10': 'iLoginTime'},
    const {'1': 'iChannelID', '3': 5, '4': 1, '5': 5, '9': 2, '10': 'iChannelID', '17': true},
  ],
  '8': const [
    const {'1': '_sPhoneNum'},
    const {'1': '_sEmail'},
    const {'1': '_iChannelID'},
  ],
};

/// Descriptor for `c2s_login_password`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c2s_login_passwordDescriptor = $convert.base64Decode('ChJjMnNfbG9naW5fcGFzc3dvcmQSIQoJc1Bob25lTnVtGAEgASgJSABSCXNQaG9uZU51bYgBARIbCgZzRW1haWwYAiABKAlIAVIGc0VtYWlsiAEBEhwKCXNQYXNzd29yZBgDIAEoCVIJc1Bhc3N3b3JkEh4KCmlMb2dpblRpbWUYBCABKAVSCmlMb2dpblRpbWUSIwoKaUNoYW5uZWxJRBgFIAEoBUgCUgppQ2hhbm5lbElEiAEBQgwKCl9zUGhvbmVOdW1CCQoHX3NFbWFpbEINCgtfaUNoYW5uZWxJRA==');
@$core.Deprecated('Use s2c_login_passwordDescriptor instead')
const s2c_login_password$json = const {
  '1': 's2c_login_password',
  '2': const [
    const {'1': 'eCode', '3': 1, '4': 1, '5': 14, '6': '.response_code', '10': 'eCode'},
  ],
};

/// Descriptor for `s2c_login_password`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s2c_login_passwordDescriptor = $convert.base64Decode('ChJzMmNfbG9naW5fcGFzc3dvcmQSJAoFZUNvZGUYASABKA4yDi5yZXNwb25zZV9jb2RlUgVlQ29kZQ==');
@$core.Deprecated('Use c2s_login_get_v_codeDescriptor instead')
const c2s_login_get_v_code$json = const {
  '1': 'c2s_login_get_v_code',
  '2': const [
    const {'1': 'sPhoneNum', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'sPhoneNum', '17': true},
    const {'1': 'sEmail', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'sEmail', '17': true},
  ],
  '8': const [
    const {'1': '_sPhoneNum'},
    const {'1': '_sEmail'},
  ],
};

/// Descriptor for `c2s_login_get_v_code`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c2s_login_get_v_codeDescriptor = $convert.base64Decode('ChRjMnNfbG9naW5fZ2V0X3ZfY29kZRIhCglzUGhvbmVOdW0YASABKAlIAFIJc1Bob25lTnVtiAEBEhsKBnNFbWFpbBgCIAEoCUgBUgZzRW1haWyIAQFCDAoKX3NQaG9uZU51bUIJCgdfc0VtYWls');
@$core.Deprecated('Use s2c_login_get_v_codeDescriptor instead')
const s2c_login_get_v_code$json = const {
  '1': 's2c_login_get_v_code',
  '2': const [
    const {'1': 'eCode', '3': 1, '4': 1, '5': 14, '6': '.response_code', '10': 'eCode'},
  ],
};

/// Descriptor for `s2c_login_get_v_code`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s2c_login_get_v_codeDescriptor = $convert.base64Decode('ChRzMmNfbG9naW5fZ2V0X3ZfY29kZRIkCgVlQ29kZRgBIAEoDjIOLnJlc3BvbnNlX2NvZGVSBWVDb2Rl');
@$core.Deprecated('Use c2s_login_verifyDescriptor instead')
const c2s_login_verify$json = const {
  '1': 'c2s_login_verify',
  '2': const [
    const {'1': 'sPhoneNum', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'sPhoneNum', '17': true},
    const {'1': 'sEmail', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'sEmail', '17': true},
    const {'1': 'iVCode', '3': 3, '4': 1, '5': 5, '10': 'iVCode'},
    const {'1': 'sMachineCode', '3': 4, '4': 1, '5': 9, '10': 'sMachineCode'},
    const {'1': 'iChannelID', '3': 5, '4': 1, '5': 5, '9': 2, '10': 'iChannelID', '17': true},
  ],
  '8': const [
    const {'1': '_sPhoneNum'},
    const {'1': '_sEmail'},
    const {'1': '_iChannelID'},
  ],
};

/// Descriptor for `c2s_login_verify`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c2s_login_verifyDescriptor = $convert.base64Decode('ChBjMnNfbG9naW5fdmVyaWZ5EiEKCXNQaG9uZU51bRgBIAEoCUgAUglzUGhvbmVOdW2IAQESGwoGc0VtYWlsGAIgASgJSAFSBnNFbWFpbIgBARIWCgZpVkNvZGUYAyABKAVSBmlWQ29kZRIiCgxzTWFjaGluZUNvZGUYBCABKAlSDHNNYWNoaW5lQ29kZRIjCgppQ2hhbm5lbElEGAUgASgFSAJSCmlDaGFubmVsSUSIAQFCDAoKX3NQaG9uZU51bUIJCgdfc0VtYWlsQg0KC19pQ2hhbm5lbElE');
@$core.Deprecated('Use s2c_login_verifyDescriptor instead')
const s2c_login_verify$json = const {
  '1': 's2c_login_verify',
  '2': const [
    const {'1': 'eCode', '3': 1, '4': 1, '5': 14, '6': '.response_code', '10': 'eCode'},
  ],
};

/// Descriptor for `s2c_login_verify`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s2c_login_verifyDescriptor = $convert.base64Decode('ChBzMmNfbG9naW5fdmVyaWZ5EiQKBWVDb2RlGAEgASgOMg4ucmVzcG9uc2VfY29kZVIFZUNvZGU=');
@$core.Deprecated('Use c2s_login_acc_infoDescriptor instead')
const c2s_login_acc_info$json = const {
  '1': 'c2s_login_acc_info',
  '2': const [
    const {'1': 'sPhoneNum', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'sPhoneNum', '17': true},
    const {'1': 'sEmail', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'sEmail', '17': true},
  ],
  '8': const [
    const {'1': '_sPhoneNum'},
    const {'1': '_sEmail'},
  ],
};

/// Descriptor for `c2s_login_acc_info`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c2s_login_acc_infoDescriptor = $convert.base64Decode('ChJjMnNfbG9naW5fYWNjX2luZm8SIQoJc1Bob25lTnVtGAEgASgJSABSCXNQaG9uZU51bYgBARIbCgZzRW1haWwYAiABKAlIAVIGc0VtYWlsiAEBQgwKCl9zUGhvbmVOdW1CCQoHX3NFbWFpbA==');
@$core.Deprecated('Use s2c_login_acc_infoDescriptor instead')
const s2c_login_acc_info$json = const {
  '1': 's2c_login_acc_info',
  '2': const [
    const {'1': 'eState', '3': 1, '4': 1, '5': 14, '6': '.login.s2c_login_acc_info.acc_state', '10': 'eState'},
    const {'1': 'sPhoneNum', '3': 2, '4': 1, '5': 9, '10': 'sPhoneNum'},
    const {'1': 'sEmail', '3': 3, '4': 1, '5': 9, '10': 'sEmail'},
  ],
  '4': const [s2c_login_acc_info_acc_state$json],
};

@$core.Deprecated('Use s2c_login_acc_infoDescriptor instead')
const s2c_login_acc_info_acc_state$json = const {
  '1': 'acc_state',
  '2': const [
    const {'1': 'unregister', '2': 0},
    const {'1': 'no_password', '2': 1},
    const {'1': 'has_password', '2': 2},
  ],
};

/// Descriptor for `s2c_login_acc_info`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s2c_login_acc_infoDescriptor = $convert.base64Decode('ChJzMmNfbG9naW5fYWNjX2luZm8SOwoGZVN0YXRlGAEgASgOMiMubG9naW4uczJjX2xvZ2luX2FjY19pbmZvLmFjY19zdGF0ZVIGZVN0YXRlEhwKCXNQaG9uZU51bRgCIAEoCVIJc1Bob25lTnVtEhYKBnNFbWFpbBgDIAEoCVIGc0VtYWlsIj4KCWFjY19zdGF0ZRIOCgp1bnJlZ2lzdGVyEAASDwoLbm9fcGFzc3dvcmQQARIQCgxoYXNfcGFzc3dvcmQQAg==');
@$core.Deprecated('Use c2s_login_oauthDescriptor instead')
const c2s_login_oauth$json = const {
  '1': 'c2s_login_oauth',
  '2': const [
    const {'1': 'iType', '3': 1, '4': 1, '5': 5, '10': 'iType'},
    const {'1': 'sOpenID', '3': 2, '4': 1, '5': 9, '10': 'sOpenID'},
    const {'1': 'sJson', '3': 3, '4': 1, '5': 9, '10': 'sJson'},
    const {'1': 'sMachineCode', '3': 4, '4': 1, '5': 9, '10': 'sMachineCode'},
    const {'1': 'iChannelID', '3': 5, '4': 1, '5': 5, '9': 0, '10': 'iChannelID', '17': true},
  ],
  '8': const [
    const {'1': '_iChannelID'},
  ],
};

/// Descriptor for `c2s_login_oauth`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c2s_login_oauthDescriptor = $convert.base64Decode('Cg9jMnNfbG9naW5fb2F1dGgSFAoFaVR5cGUYASABKAVSBWlUeXBlEhgKB3NPcGVuSUQYAiABKAlSB3NPcGVuSUQSFAoFc0pzb24YAyABKAlSBXNKc29uEiIKDHNNYWNoaW5lQ29kZRgEIAEoCVIMc01hY2hpbmVDb2RlEiMKCmlDaGFubmVsSUQYBSABKAVIAFIKaUNoYW5uZWxJRIgBAUINCgtfaUNoYW5uZWxJRA==');
@$core.Deprecated('Use s2c_login_oauthDescriptor instead')
const s2c_login_oauth$json = const {
  '1': 's2c_login_oauth',
  '2': const [
    const {'1': 'eCode', '3': 1, '4': 1, '5': 14, '6': '.response_code', '10': 'eCode'},
  ],
};

/// Descriptor for `s2c_login_oauth`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s2c_login_oauthDescriptor = $convert.base64Decode('Cg9zMmNfbG9naW5fb2F1dGgSJAoFZUNvZGUYASABKA4yDi5yZXNwb25zZV9jb2RlUgVlQ29kZQ==');
@$core.Deprecated('Use c2s_re_loginDescriptor instead')
const c2s_re_login$json = const {
  '1': 'c2s_re_login',
  '2': const [
    const {'1': 'iUserID', '3': 1, '4': 1, '5': 3, '10': 'iUserID'},
    const {'1': 'iToken', '3': 2, '4': 1, '5': 13, '10': 'iToken'},
  ],
};

/// Descriptor for `c2s_re_login`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c2s_re_loginDescriptor = $convert.base64Decode('CgxjMnNfcmVfbG9naW4SGAoHaVVzZXJJRBgBIAEoA1IHaVVzZXJJRBIWCgZpVG9rZW4YAiABKA1SBmlUb2tlbg==');
@$core.Deprecated('Use s2c_re_loginDescriptor instead')
const s2c_re_login$json = const {
  '1': 's2c_re_login',
  '2': const [
    const {'1': 'eCode', '3': 1, '4': 1, '5': 14, '6': '.response_code', '10': 'eCode'},
    const {'1': 'iUserID', '3': 2, '4': 1, '5': 3, '10': 'iUserID'},
  ],
};

/// Descriptor for `s2c_re_login`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s2c_re_loginDescriptor = $convert.base64Decode('CgxzMmNfcmVfbG9naW4SJAoFZUNvZGUYASABKA4yDi5yZXNwb25zZV9jb2RlUgVlQ29kZRIYCgdpVXNlcklEGAIgASgDUgdpVXNlcklE');
@$core.Deprecated('Use c2s_token_loginDescriptor instead')
const c2s_token_login$json = const {
  '1': 'c2s_token_login',
  '2': const [
    const {'1': 'iUserID', '3': 1, '4': 1, '5': 3, '10': 'iUserID'},
    const {'1': 'iToken', '3': 2, '4': 1, '5': 13, '10': 'iToken'},
  ],
};

/// Descriptor for `c2s_token_login`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c2s_token_loginDescriptor = $convert.base64Decode('Cg9jMnNfdG9rZW5fbG9naW4SGAoHaVVzZXJJRBgBIAEoA1IHaVVzZXJJRBIWCgZpVG9rZW4YAiABKA1SBmlUb2tlbg==');
@$core.Deprecated('Use s2c_token_loginDescriptor instead')
const s2c_token_login$json = const {
  '1': 's2c_token_login',
  '2': const [
    const {'1': 'eCode', '3': 1, '4': 1, '5': 14, '6': '.response_code', '10': 'eCode'},
    const {'1': 'iUserID', '3': 2, '4': 1, '5': 3, '10': 'iUserID'},
  ],
};

/// Descriptor for `s2c_token_login`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s2c_token_loginDescriptor = $convert.base64Decode('Cg9zMmNfdG9rZW5fbG9naW4SJAoFZUNvZGUYASABKA4yDi5yZXNwb25zZV9jb2RlUgVlQ29kZRIYCgdpVXNlcklEGAIgASgDUgdpVXNlcklE');
@$core.Deprecated('Use c2s_register_get_v_codeDescriptor instead')
const c2s_register_get_v_code$json = const {
  '1': 'c2s_register_get_v_code',
  '2': const [
    const {'1': 'sPhoneNum', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'sPhoneNum', '17': true},
    const {'1': 'sEmail', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'sEmail', '17': true},
  ],
  '8': const [
    const {'1': '_sPhoneNum'},
    const {'1': '_sEmail'},
  ],
};

/// Descriptor for `c2s_register_get_v_code`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c2s_register_get_v_codeDescriptor = $convert.base64Decode('ChdjMnNfcmVnaXN0ZXJfZ2V0X3ZfY29kZRIhCglzUGhvbmVOdW0YASABKAlIAFIJc1Bob25lTnVtiAEBEhsKBnNFbWFpbBgCIAEoCUgBUgZzRW1haWyIAQFCDAoKX3NQaG9uZU51bUIJCgdfc0VtYWls');
@$core.Deprecated('Use s2c_register_get_v_codeDescriptor instead')
const s2c_register_get_v_code$json = const {
  '1': 's2c_register_get_v_code',
  '2': const [
    const {'1': 'eCode', '3': 1, '4': 1, '5': 14, '6': '.response_code', '10': 'eCode'},
  ],
};

/// Descriptor for `s2c_register_get_v_code`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s2c_register_get_v_codeDescriptor = $convert.base64Decode('ChdzMmNfcmVnaXN0ZXJfZ2V0X3ZfY29kZRIkCgVlQ29kZRgBIAEoDjIOLnJlc3BvbnNlX2NvZGVSBWVDb2Rl');
@$core.Deprecated('Use c2s_registerDescriptor instead')
const c2s_register$json = const {
  '1': 'c2s_register',
  '2': const [
    const {'1': 'sPhoneNum', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'sPhoneNum', '17': true},
    const {'1': 'sEmail', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'sEmail', '17': true},
    const {'1': 'sPassword', '3': 3, '4': 1, '5': 9, '10': 'sPassword'},
    const {'1': 'iVCode', '3': 4, '4': 1, '5': 5, '10': 'iVCode'},
    const {'1': 'iChannelID', '3': 5, '4': 1, '5': 5, '9': 2, '10': 'iChannelID', '17': true},
  ],
  '8': const [
    const {'1': '_sPhoneNum'},
    const {'1': '_sEmail'},
    const {'1': '_iChannelID'},
  ],
};

/// Descriptor for `c2s_register`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c2s_registerDescriptor = $convert.base64Decode('CgxjMnNfcmVnaXN0ZXISIQoJc1Bob25lTnVtGAEgASgJSABSCXNQaG9uZU51bYgBARIbCgZzRW1haWwYAiABKAlIAVIGc0VtYWlsiAEBEhwKCXNQYXNzd29yZBgDIAEoCVIJc1Bhc3N3b3JkEhYKBmlWQ29kZRgEIAEoBVIGaVZDb2RlEiMKCmlDaGFubmVsSUQYBSABKAVIAlIKaUNoYW5uZWxJRIgBAUIMCgpfc1Bob25lTnVtQgkKB19zRW1haWxCDQoLX2lDaGFubmVsSUQ=');
@$core.Deprecated('Use s2c_registerDescriptor instead')
const s2c_register$json = const {
  '1': 's2c_register',
  '2': const [
    const {'1': 'eCode', '3': 1, '4': 1, '5': 14, '6': '.response_code', '10': 'eCode'},
  ],
};

/// Descriptor for `s2c_register`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s2c_registerDescriptor = $convert.base64Decode('CgxzMmNfcmVnaXN0ZXISJAoFZUNvZGUYASABKA4yDi5yZXNwb25zZV9jb2RlUgVlQ29kZQ==');
@$core.Deprecated('Use c2s_forget_password_get_v_codeDescriptor instead')
const c2s_forget_password_get_v_code$json = const {
  '1': 'c2s_forget_password_get_v_code',
  '2': const [
    const {'1': 'sPhoneNum', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'sPhoneNum', '17': true},
    const {'1': 'sEmail', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'sEmail', '17': true},
  ],
  '8': const [
    const {'1': '_sPhoneNum'},
    const {'1': '_sEmail'},
  ],
};

/// Descriptor for `c2s_forget_password_get_v_code`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c2s_forget_password_get_v_codeDescriptor = $convert.base64Decode('Ch5jMnNfZm9yZ2V0X3Bhc3N3b3JkX2dldF92X2NvZGUSIQoJc1Bob25lTnVtGAEgASgJSABSCXNQaG9uZU51bYgBARIbCgZzRW1haWwYAiABKAlIAVIGc0VtYWlsiAEBQgwKCl9zUGhvbmVOdW1CCQoHX3NFbWFpbA==');
@$core.Deprecated('Use s2c_forget_password_get_v_codeDescriptor instead')
const s2c_forget_password_get_v_code$json = const {
  '1': 's2c_forget_password_get_v_code',
  '2': const [
    const {'1': 'eCode', '3': 1, '4': 1, '5': 14, '6': '.response_code', '10': 'eCode'},
  ],
};

/// Descriptor for `s2c_forget_password_get_v_code`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s2c_forget_password_get_v_codeDescriptor = $convert.base64Decode('Ch5zMmNfZm9yZ2V0X3Bhc3N3b3JkX2dldF92X2NvZGUSJAoFZUNvZGUYASABKA4yDi5yZXNwb25zZV9jb2RlUgVlQ29kZQ==');
@$core.Deprecated('Use c2s_forget_passwordDescriptor instead')
const c2s_forget_password$json = const {
  '1': 'c2s_forget_password',
  '2': const [
    const {'1': 'iVCode', '3': 1, '4': 1, '5': 5, '10': 'iVCode'},
    const {'1': 'sPhoneNum', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'sPhoneNum', '17': true},
    const {'1': 'sEmail', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'sEmail', '17': true},
    const {'1': 'sPassword', '3': 4, '4': 1, '5': 9, '10': 'sPassword'},
  ],
  '8': const [
    const {'1': '_sPhoneNum'},
    const {'1': '_sEmail'},
  ],
};

/// Descriptor for `c2s_forget_password`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c2s_forget_passwordDescriptor = $convert.base64Decode('ChNjMnNfZm9yZ2V0X3Bhc3N3b3JkEhYKBmlWQ29kZRgBIAEoBVIGaVZDb2RlEiEKCXNQaG9uZU51bRgCIAEoCUgAUglzUGhvbmVOdW2IAQESGwoGc0VtYWlsGAMgASgJSAFSBnNFbWFpbIgBARIcCglzUGFzc3dvcmQYBCABKAlSCXNQYXNzd29yZEIMCgpfc1Bob25lTnVtQgkKB19zRW1haWw=');
@$core.Deprecated('Use s2c_forget_passwordDescriptor instead')
const s2c_forget_password$json = const {
  '1': 's2c_forget_password',
  '2': const [
    const {'1': 'eCode', '3': 1, '4': 1, '5': 14, '6': '.response_code', '10': 'eCode'},
  ],
};

/// Descriptor for `s2c_forget_password`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s2c_forget_passwordDescriptor = $convert.base64Decode('ChNzMmNfZm9yZ2V0X3Bhc3N3b3JkEiQKBWVDb2RlGAEgASgOMg4ucmVzcG9uc2VfY29kZVIFZUNvZGU=');
@$core.Deprecated('Use c2s_login_metaDescriptor instead')
const c2s_login_meta$json = const {
  '1': 'c2s_login_meta',
};

/// Descriptor for `c2s_login_meta`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c2s_login_metaDescriptor = $convert.base64Decode('Cg5jMnNfbG9naW5fbWV0YQ==');
@$core.Deprecated('Use s2c_login_metaDescriptor instead')
const s2c_login_meta$json = const {
  '1': 's2c_login_meta',
  '2': const [
    const {'1': 'myCube', '3': 1, '4': 1, '5': 11, '6': '.msg_cube_show', '9': 0, '10': 'myCube', '17': true},
  ],
  '8': const [
    const {'1': '_myCube'},
  ],
};

/// Descriptor for `s2c_login_meta`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s2c_login_metaDescriptor = $convert.base64Decode('Cg5zMmNfbG9naW5fbWV0YRIrCgZteUN1YmUYASABKAsyDi5tc2dfY3ViZV9zaG93SABSBm15Q3ViZYgBAUIJCgdfbXlDdWJl');
@$core.Deprecated('Use s2c_login_againDescriptor instead')
const s2c_login_again$json = const {
  '1': 's2c_login_again',
};

/// Descriptor for `s2c_login_again`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s2c_login_againDescriptor = $convert.base64Decode('Cg9zMmNfbG9naW5fYWdhaW4=');
@$core.Deprecated('Use c2s_login_user_idDescriptor instead')
const c2s_login_user_id$json = const {
  '1': 'c2s_login_user_id',
  '2': const [
    const {'1': 'iUserID', '3': 1, '4': 1, '5': 3, '10': 'iUserID'},
  ],
};

/// Descriptor for `c2s_login_user_id`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c2s_login_user_idDescriptor = $convert.base64Decode('ChFjMnNfbG9naW5fdXNlcl9pZBIYCgdpVXNlcklEGAEgASgDUgdpVXNlcklE');
@$core.Deprecated('Use s2c_login_user_idDescriptor instead')
const s2c_login_user_id$json = const {
  '1': 's2c_login_user_id',
  '2': const [
    const {'1': 'eCode', '3': 1, '4': 1, '5': 14, '6': '.response_code', '10': 'eCode'},
  ],
};

/// Descriptor for `s2c_login_user_id`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s2c_login_user_idDescriptor = $convert.base64Decode('ChFzMmNfbG9naW5fdXNlcl9pZBIkCgVlQ29kZRgBIAEoDjIOLnJlc3BvbnNlX2NvZGVSBWVDb2Rl');
@$core.Deprecated('Use s2c_logoutDescriptor instead')
const s2c_logout$json = const {
  '1': 's2c_logout',
  '2': const [
    const {'1': 'eType', '3': 1, '4': 1, '5': 14, '6': '.login.s2c_logout.logout_type', '10': 'eType'},
  ],
  '4': const [s2c_logout_logout_type$json],
};

@$core.Deprecated('Use s2c_logoutDescriptor instead')
const s2c_logout_logout_type$json = const {
  '1': 'logout_type',
  '2': const [
    const {'1': 'normal', '2': 0},
    const {'1': 'timeout', '2': 1},
    const {'1': 'self_kick', '2': 2},
    const {'1': 'admin_kick', '2': 3},
    const {'1': 'server_busy', '2': 4},
    const {'1': 'server_stop', '2': 5},
    const {'1': 'account_ban', '2': 6},
    const {'1': 'server_starting', '2': 7},
    const {'1': 'account_cancelled', '2': 8},
  ],
};

/// Descriptor for `s2c_logout`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s2c_logoutDescriptor = $convert.base64Decode('CgpzMmNfbG9nb3V0EjMKBWVUeXBlGAEgASgOMh0ubG9naW4uczJjX2xvZ291dC5sb2dvdXRfdHlwZVIFZVR5cGUipAEKC2xvZ291dF90eXBlEgoKBm5vcm1hbBAAEgsKB3RpbWVvdXQQARINCglzZWxmX2tpY2sQAhIOCgphZG1pbl9raWNrEAMSDwoLc2VydmVyX2J1c3kQBBIPCgtzZXJ2ZXJfc3RvcBAFEg8KC2FjY291bnRfYmFuEAYSEwoPc2VydmVyX3N0YXJ0aW5nEAcSFQoRYWNjb3VudF9jYW5jZWxsZWQQCA==');
@$core.Deprecated('Use s2c_login_successDescriptor instead')
const s2c_login_success$json = const {
  '1': 's2c_login_success',
  '2': const [
    const {'1': 'iToken', '3': 1, '4': 1, '5': 13, '10': 'iToken'},
    const {'1': 'iExpireTime', '3': 2, '4': 1, '5': 5, '10': 'iExpireTime'},
    const {'1': 'bSetPassword', '3': 3, '4': 1, '5': 8, '10': 'bSetPassword'},
    const {'1': 'mAccountInfo', '3': 4, '4': 1, '5': 11, '6': '.msg_account_info', '10': 'mAccountInfo'},
  ],
};

/// Descriptor for `s2c_login_success`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s2c_login_successDescriptor = $convert.base64Decode('ChFzMmNfbG9naW5fc3VjY2VzcxIWCgZpVG9rZW4YASABKA1SBmlUb2tlbhIgCgtpRXhwaXJlVGltZRgCIAEoBVILaUV4cGlyZVRpbWUSIgoMYlNldFBhc3N3b3JkGAMgASgIUgxiU2V0UGFzc3dvcmQSNQoMbUFjY291bnRJbmZvGAQgASgLMhEubXNnX2FjY291bnRfaW5mb1IMbUFjY291bnRJbmZv');
@$core.Deprecated('Use c2s_originDescriptor instead')
const c2s_origin$json = const {
  '1': 'c2s_origin',
  '2': const [
    const {'1': 'iTimeZone', '3': 1, '4': 1, '5': 5, '10': 'iTimeZone'},
    const {'1': 'iChannelID', '3': 2, '4': 1, '5': 5, '10': 'iChannelID'},
    const {'1': 'iTerminalType', '3': 3, '4': 1, '5': 5, '10': 'iTerminalType'},
    const {'1': 'sTerminalName', '3': 4, '4': 1, '5': 9, '10': 'sTerminalName'},
    const {'1': 'sMachineCode', '3': 5, '4': 1, '5': 9, '10': 'sMachineCode'},
    const {'1': 'iTerminalVersion', '3': 6, '4': 1, '5': 9, '9': 0, '10': 'iTerminalVersion', '17': true},
    const {'1': 'sTerminalVendor', '3': 7, '4': 1, '5': 9, '9': 1, '10': 'sTerminalVendor', '17': true},
    const {'1': 'sTerminalSize', '3': 8, '4': 1, '5': 9, '9': 2, '10': 'sTerminalSize', '17': true},
    const {'1': 'sTerminalCPU', '3': 9, '4': 1, '5': 9, '9': 3, '10': 'sTerminalCPU', '17': true},
    const {'1': 'clientVersion', '3': 10, '4': 1, '5': 9, '9': 4, '10': 'clientVersion', '17': true},
    const {'1': 'networkType', '3': 11, '4': 1, '5': 5, '9': 5, '10': 'networkType', '17': true},
  ],
  '8': const [
    const {'1': '_iTerminalVersion'},
    const {'1': '_sTerminalVendor'},
    const {'1': '_sTerminalSize'},
    const {'1': '_sTerminalCPU'},
    const {'1': '_clientVersion'},
    const {'1': '_networkType'},
  ],
};

/// Descriptor for `c2s_origin`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c2s_originDescriptor = $convert.base64Decode('CgpjMnNfb3JpZ2luEhwKCWlUaW1lWm9uZRgBIAEoBVIJaVRpbWVab25lEh4KCmlDaGFubmVsSUQYAiABKAVSCmlDaGFubmVsSUQSJAoNaVRlcm1pbmFsVHlwZRgDIAEoBVINaVRlcm1pbmFsVHlwZRIkCg1zVGVybWluYWxOYW1lGAQgASgJUg1zVGVybWluYWxOYW1lEiIKDHNNYWNoaW5lQ29kZRgFIAEoCVIMc01hY2hpbmVDb2RlEi8KEGlUZXJtaW5hbFZlcnNpb24YBiABKAlIAFIQaVRlcm1pbmFsVmVyc2lvbogBARItCg9zVGVybWluYWxWZW5kb3IYByABKAlIAVIPc1Rlcm1pbmFsVmVuZG9yiAEBEikKDXNUZXJtaW5hbFNpemUYCCABKAlIAlINc1Rlcm1pbmFsU2l6ZYgBARInCgxzVGVybWluYWxDUFUYCSABKAlIA1IMc1Rlcm1pbmFsQ1BViAEBEikKDWNsaWVudFZlcnNpb24YCiABKAlIBFINY2xpZW50VmVyc2lvbogBARIlCgtuZXR3b3JrVHlwZRgLIAEoBUgFUgtuZXR3b3JrVHlwZYgBAUITChFfaVRlcm1pbmFsVmVyc2lvbkISChBfc1Rlcm1pbmFsVmVuZG9yQhAKDl9zVGVybWluYWxTaXplQg8KDV9zVGVybWluYWxDUFVCEAoOX2NsaWVudFZlcnNpb25CDgoMX25ldHdvcmtUeXBl');
@$core.Deprecated('Use s2c_originDescriptor instead')
const s2c_origin$json = const {
  '1': 's2c_origin',
  '2': const [
    const {'1': 'timestamp', '3': 1, '4': 1, '5': 3, '10': 'timestamp'},
    const {'1': 'sIPCountry', '3': 2, '4': 1, '5': 9, '10': 'sIPCountry'},
    const {'1': 'sIPProvince', '3': 3, '4': 1, '5': 9, '10': 'sIPProvince'},
    const {'1': 'sIPCity', '3': 4, '4': 1, '5': 9, '10': 'sIPCity'},
    const {'1': 'sIp', '3': 5, '4': 1, '5': 9, '9': 0, '10': 'sIp', '17': true},
  ],
  '8': const [
    const {'1': '_sIp'},
  ],
};

/// Descriptor for `s2c_origin`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s2c_originDescriptor = $convert.base64Decode('CgpzMmNfb3JpZ2luEhwKCXRpbWVzdGFtcBgBIAEoA1IJdGltZXN0YW1wEh4KCnNJUENvdW50cnkYAiABKAlSCnNJUENvdW50cnkSIAoLc0lQUHJvdmluY2UYAyABKAlSC3NJUFByb3ZpbmNlEhgKB3NJUENpdHkYBCABKAlSB3NJUENpdHkSFQoDc0lwGAUgASgJSABSA3NJcIgBAUIGCgRfc0lw');
