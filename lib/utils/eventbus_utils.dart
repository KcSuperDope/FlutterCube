import 'package:cubestation_flutter/cube/box/box_model.dart';
import 'package:cubestation_flutter/pb/login.pb.dart';
import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

class RotateSliceEvent {
  String id;
  RotateSliceEvent(this.id);
}

class ScrambleOkEvent {}

class SolvedEvent {}

///心跳包-10000
class HeartbeatEvent {
  s2c_heartbeat heartbeat;
  HeartbeatEvent(this.heartbeat);
}

///密码登录-10002
class LoginPasswordEvent {
  s2c_login_password loginPassword;
  LoginPasswordEvent(this.loginPassword);
}

///获取登录验证码-10003
class LoginGetVCodeEvent {
  s2c_login_get_v_code loginGetVCode;
  LoginGetVCodeEvent(this.loginGetVCode);
}

///获取账号信息-10005
class LoginAccInfoEvent {
  s2c_login_acc_info loginAccInfo;
  LoginAccInfoEvent(this.loginAccInfo);
}

///第三方开放授权登录(微信, QQ, Facebook)-10006
class LoginOauthEvent {
  s2c_login_oauth loginOauth;
  LoginOauthEvent(this.loginOauth);
}

///获取注册验证码, 另一个发空字符串表示-10010
class RegisterGetVCodeEvent {
  s2c_register_get_v_code registerGetVCode;
  RegisterGetVCodeEvent(this.registerGetVCode);
}

///手机或邮箱注册-10011
class RegisterEvent {
  s2c_register register;
  RegisterEvent(this.register);
}

///忘记密码获得验证码-10012
class ForgetPasswordGetVCodeEvent {
  s2c_forget_password_get_v_code forgetPasswordGetVCode;
  ForgetPasswordGetVCodeEvent(this.forgetPasswordGetVCode);
}

///通过验证码修改密码反馈-10013
class ForgetPasswordEvent {
  s2c_forget_password forgetPassword;
  ForgetPasswordEvent(this.forgetPassword);
}

///玩家id登录-10096
class LoginUserIdEvent {
  s2c_login_user_id loginUserId;
  LoginUserIdEvent(this.loginUserId);
}

///服务端踢玩家提示-10097
class LogoutEvent {
  s2c_logout logout;
  LogoutEvent(this.logout);
}

///登录成功反馈-10098
class LoginSuccessEvent {
  s2c_login_success loginSuccess;
  LoginSuccessEvent(this.loginSuccess);
}

///socket连接后首条协议, 同步一些信息-10099
class OriginEvent {
  s2c_origin origin;
  OriginEvent(this.origin);
}
