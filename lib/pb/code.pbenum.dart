///
//  Generated code. Do not modify.
//  source: code.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class response_code extends $pb.ProtobufEnum {
  static const response_code normal = response_code._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'normal');
  static const response_code fail = response_code._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'fail');
  static const response_code account_err = response_code._(101, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'account_err');
  static const response_code password_err = response_code._(102, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'password_err');
  static const response_code token_err = response_code._(103, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'token_err');
  static const response_code phone_num_used = response_code._(104, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'phone_num_used');
  static const response_code email_used = response_code._(105, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'email_used');
  static const response_code nickname_illegal = response_code._(106, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'nickname_illegal');
  static const response_code nickname_too_short = response_code._(107, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'nickname_too_short');
  static const response_code nickname_too_long = response_code._(108, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'nickname_too_long');
  static const response_code nickname_used = response_code._(109, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'nickname_used');
  static const response_code password_already_set = response_code._(110, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'password_already_set');
  static const response_code old_password_err = response_code._(111, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'old_password_err');
  static const response_code already_bind_phone = response_code._(112, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'already_bind_phone');
  static const response_code already_bind_email = response_code._(113, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'already_bind_email');
  static const response_code send_v_code_err = response_code._(114, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'send_v_code_err');
  static const response_code v_code_expire = response_code._(115, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'v_code_expire');
  static const response_code v_code_fail = response_code._(116, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'v_code_fail');
  static const response_code account_not_bind = response_code._(117, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'account_not_bind');
  static const response_code phone_num_wrong = response_code._(118, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'phone_num_wrong');
  static const response_code email_wrong = response_code._(119, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'email_wrong');
  static const response_code can_not_register = response_code._(132, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'can_not_register');
  static const response_code oauth_type_err = response_code._(120, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'oauth_type_err');
  static const response_code oauth_resp_err = response_code._(121, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'oauth_resp_err');
  static const response_code not_elite = response_code._(122, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'not_elite');
  static const response_code elite_expire = response_code._(123, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'elite_expire');
  static const response_code content_too_long = response_code._(124, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'content_too_long');
  static const response_code no_data = response_code._(125, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'no_data');
  static const response_code time_out_of_sync = response_code._(130, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'time_out_of_sync');
  static const response_code account_merge = response_code._(131, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'account_merge');
  static const response_code is_friend = response_code._(201, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'is_friend');
  static const response_code is_black = response_code._(202, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'is_black');
  static const response_code not_apply = response_code._(203, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'not_apply');
  static const response_code not_friend = response_code._(204, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'not_friend');
  static const response_code friend_limit = response_code._(205, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'friend_limit');
  static const response_code black_limit = response_code._(206, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'black_limit');
  static const response_code apply_limit = response_code._(207, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'apply_limit');
  static const response_code not_his_friend = response_code._(208, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'not_his_friend');
  static const response_code group_name_exist = response_code._(211, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'group_name_exist');
  static const response_code mark_num_limit = response_code._(212, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mark_num_limit');
  static const response_code group_num_limit = response_code._(213, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'group_num_limit');
  static const response_code in_room = response_code._(221, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'in_room');
  static const response_code no_room = response_code._(222, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'no_room');
  static const response_code room_lock = response_code._(223, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'room_lock');
  static const response_code room_full = response_code._(224, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'room_full');
  static const response_code not_master = response_code._(225, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'not_master');
  static const response_code invitee_offline = response_code._(226, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'invitee_offline');
  static const response_code not_all_ready = response_code._(227, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'not_all_ready');
  static const response_code not_member_enough = response_code._(228, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'not_member_enough');
  static const response_code in_comp = response_code._(229, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'in_comp');
  static const response_code in_match = response_code._(230, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'in_match');
  static const response_code room_in_comp = response_code._(231, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'room_in_comp');
  static const response_code site_not_empty = response_code._(232, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'site_not_empty');
  static const response_code duration_limit = response_code._(233, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'duration_limit');
  static const response_code no_right = response_code._(234, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'no_right');
  static const response_code comp_not_open = response_code._(235, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'comp_not_open');
  static const response_code comp_end = response_code._(236, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'comp_end');
  static const response_code exist_referee = response_code._(237, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'exist_referee');
  static const response_code not_in_match1v1 = response_code._(240, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'not_in_match1v1');
  static const response_code match1v1_timeout = response_code._(241, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'match1v1_timeout');
  static const response_code not_in_match = response_code._(242, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'not_in_match');
  static const response_code match_timeout = response_code._(243, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'match_timeout');
  static const response_code match_cd = response_code._(244, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'match_cd');
  static const response_code forbid_sit_out = response_code._(245, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'forbid_sit_out');
  static const response_code not_in_comp = response_code._(246, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'not_in_comp');
  static const response_code period_err = response_code._(247, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'period_err');
  static const response_code is_rewarded = response_code._(248, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'is_rewarded');
  static const response_code time_trial_no_num = response_code._(250, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'time_trial_no_num');
  static const response_code password_illegal = response_code._(251, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'password_illegal');
  static const response_code repository_limit = response_code._(260, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'repository_limit');
  static const response_code cd_key_active = response_code._(300, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'cd_key_active');
  static const response_code cd_key_invalid = response_code._(301, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'cd_key_invalid');
  static const response_code cd_key_used = response_code._(302, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'cd_key_used');
  static const response_code invitation_code_invalid = response_code._(303, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'invitation_code_invalid');
  static const response_code invitation_code_used = response_code._(304, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'invitation_code_used');
  static const response_code quest_un_commit = response_code._(306, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'quest_un_commit');
  static const response_code quest_rewarded = response_code._(307, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'quest_rewarded');
  static const response_code old_acc_rewarded = response_code._(310, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'old_acc_rewarded');
  static const response_code not_old_acc = response_code._(311, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'not_old_acc');
  static const response_code chat_not_in_comp = response_code._(320, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'chat_not_in_comp');
  static const response_code chat_not_in_room = response_code._(321, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'chat_not_in_room');
  static const response_code chat_mute = response_code._(322, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'chat_mute');
  static const response_code score_not_enough = response_code._(330, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'score_not_enough');
  static const response_code bag_limit = response_code._(331, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'bag_limit');
  static const response_code shop_limit = response_code._(332, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'shop_limit');
  static const response_code cost_limit = response_code._(333, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'cost_limit');
  static const response_code item_not_enough = response_code._(334, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'item_not_enough');
  static const response_code no_effect = response_code._(335, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'no_effect');
  static const response_code exchange_code_invalid = response_code._(351, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'exchange_code_invalid');
  static const response_code exchange_code_used = response_code._(352, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'exchange_code_used');
  static const response_code exchange_code_limit = response_code._(353, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'exchange_code_limit');
  static const response_code activity_not_reach = response_code._(400, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'activity_not_reach');
  static const response_code activity_rewarded = response_code._(401, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'activity_rewarded');
  static const response_code no_brake_through = response_code._(500, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'no_brake_through');
  static const response_code not_in_closing = response_code._(600, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'not_in_closing');
  static const response_code account_risk = response_code._(601, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'account_risk');
  static const response_code account_close = response_code._(602, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'account_close');
  static const response_code account_closing = response_code._(603, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'account_closing');
  static const response_code major_time_error = response_code._(610, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'major_time_error');
  static const response_code major_unauthorized = response_code._(611, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'major_unauthorized');
  static const response_code major_edit_forbid = response_code._(612, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'major_edit_forbid');
  static const response_code major_info_required = response_code._(613, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'major_info_required');
  static const response_code major_num_limit = response_code._(614, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'major_num_limit');
  static const response_code major_not_start = response_code._(615, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'major_not_start');
  static const response_code major_round_error = response_code._(616, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'major_round_error');
  static const response_code major_round_not_over = response_code._(617, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'major_round_not_over');
  static const response_code major_repeat_appeal = response_code._(618, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'major_repeat_appeal');
  static const response_code major_competitor_limit = response_code._(620, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'major_competitor_limit');
  static const response_code major_already_started = response_code._(621, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'major_already_started');
  static const response_code team_name_edit_limit = response_code._(630, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'team_name_edit_limit');
  static const response_code team_not_join = response_code._(631, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'team_not_join');
  static const response_code team_already_join = response_code._(632, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'team_already_join');
  static const response_code team_repeat_request = response_code._(633, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'team_repeat_request');
  static const response_code team_target_no_exist = response_code._(634, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'team_target_no_exist');
  static const response_code team_target_op_limit = response_code._(635, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'team_target_op_limit');
  static const response_code team_logout_not_enough = response_code._(636, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'team_logout_not_enough');
  static const response_code team_role_num_limit = response_code._(637, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'team_role_num_limit');
  static const response_code team_prepare_denied_join = response_code._(638, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'team_prepare_denied_join');
  static const response_code team_info_required = response_code._(639, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'team_info_required');
  static const response_code team_cond_not_met = response_code._(640, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'team_cond_not_met');
  static const response_code team_auto_reject = response_code._(641, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'team_auto_reject');
  static const response_code team_invite_repeat = response_code._(642, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'team_invite_repeat');
  static const response_code team_recruit_limit = response_code._(643, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'team_recruit_limit');
  static const response_code team_join_cd = response_code._(644, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'team_join_cd');
  static const response_code team_impeach_notice_limit = response_code._(645, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'team_impeach_notice_limit');
  static const response_code team_reason_null = response_code._(646, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'team_reason_null');
  static const response_code db_err = response_code._(900, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'db_err');
  static const response_code data_err = response_code._(901, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'data_err');
  static const response_code net_err = response_code._(902, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'net_err');
  static const response_code cd_err = response_code._(903, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'cd_err');
  static const response_code data_null = response_code._(904, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'data_null');
  static const response_code permission_denied = response_code._(905, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'permission_denied');
  static const response_code input_illegal = response_code._(906, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'input_illegal');

  static const $core.List<response_code> values = <response_code> [
    normal,
    fail,
    account_err,
    password_err,
    token_err,
    phone_num_used,
    email_used,
    nickname_illegal,
    nickname_too_short,
    nickname_too_long,
    nickname_used,
    password_already_set,
    old_password_err,
    already_bind_phone,
    already_bind_email,
    send_v_code_err,
    v_code_expire,
    v_code_fail,
    account_not_bind,
    phone_num_wrong,
    email_wrong,
    can_not_register,
    oauth_type_err,
    oauth_resp_err,
    not_elite,
    elite_expire,
    content_too_long,
    no_data,
    time_out_of_sync,
    account_merge,
    is_friend,
    is_black,
    not_apply,
    not_friend,
    friend_limit,
    black_limit,
    apply_limit,
    not_his_friend,
    group_name_exist,
    mark_num_limit,
    group_num_limit,
    in_room,
    no_room,
    room_lock,
    room_full,
    not_master,
    invitee_offline,
    not_all_ready,
    not_member_enough,
    in_comp,
    in_match,
    room_in_comp,
    site_not_empty,
    duration_limit,
    no_right,
    comp_not_open,
    comp_end,
    exist_referee,
    not_in_match1v1,
    match1v1_timeout,
    not_in_match,
    match_timeout,
    match_cd,
    forbid_sit_out,
    not_in_comp,
    period_err,
    is_rewarded,
    time_trial_no_num,
    password_illegal,
    repository_limit,
    cd_key_active,
    cd_key_invalid,
    cd_key_used,
    invitation_code_invalid,
    invitation_code_used,
    quest_un_commit,
    quest_rewarded,
    old_acc_rewarded,
    not_old_acc,
    chat_not_in_comp,
    chat_not_in_room,
    chat_mute,
    score_not_enough,
    bag_limit,
    shop_limit,
    cost_limit,
    item_not_enough,
    no_effect,
    exchange_code_invalid,
    exchange_code_used,
    exchange_code_limit,
    activity_not_reach,
    activity_rewarded,
    no_brake_through,
    not_in_closing,
    account_risk,
    account_close,
    account_closing,
    major_time_error,
    major_unauthorized,
    major_edit_forbid,
    major_info_required,
    major_num_limit,
    major_not_start,
    major_round_error,
    major_round_not_over,
    major_repeat_appeal,
    major_competitor_limit,
    major_already_started,
    team_name_edit_limit,
    team_not_join,
    team_already_join,
    team_repeat_request,
    team_target_no_exist,
    team_target_op_limit,
    team_logout_not_enough,
    team_role_num_limit,
    team_prepare_denied_join,
    team_info_required,
    team_cond_not_met,
    team_auto_reject,
    team_invite_repeat,
    team_recruit_limit,
    team_join_cd,
    team_impeach_notice_limit,
    team_reason_null,
    db_err,
    data_err,
    net_err,
    cd_err,
    data_null,
    permission_denied,
    input_illegal,
  ];

  static final $core.Map<$core.int, response_code> _byValue = $pb.ProtobufEnum.initByValue(values);
  static response_code? valueOf($core.int value) => _byValue[value];

  const response_code._($core.int v, $core.String n) : super(v, n);
}

class e_reach_state extends $pb.ProtobufEnum {
  static const e_reach_state reach_state_not = e_reach_state._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'reach_state_not');
  static const e_reach_state reach_state_reach = e_reach_state._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'reach_state_reach');
  static const e_reach_state reach_state_rewarded = e_reach_state._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'reach_state_rewarded');

  static const $core.List<e_reach_state> values = <e_reach_state> [
    reach_state_not,
    reach_state_reach,
    reach_state_rewarded,
  ];

  static final $core.Map<$core.int, e_reach_state> _byValue = $pb.ProtobufEnum.initByValue(values);
  static e_reach_state? valueOf($core.int value) => _byValue[value];

  const e_reach_state._($core.int v, $core.String n) : super(v, n);
}

class e_respond_launch extends $pb.ProtobufEnum {
  static const e_respond_launch client_launch = e_respond_launch._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'client_launch');
  static const e_respond_launch server_launch = e_respond_launch._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'server_launch');

  static const $core.List<e_respond_launch> values = <e_respond_launch> [
    client_launch,
    server_launch,
  ];

  static final $core.Map<$core.int, e_respond_launch> _byValue = $pb.ProtobufEnum.initByValue(values);
  static e_respond_launch? valueOf($core.int value) => _byValue[value];

  const e_respond_launch._($core.int v, $core.String n) : super(v, n);
}

