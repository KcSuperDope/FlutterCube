class ProtoId {
  ///心跳包
  static const int heartbeat = 10000;

  ///密码登录
  static const int loginPassword = 10002;

  ///获取登录验证码
  static const int loginGetVCode = 10003;

  ///获取账号信息
  static const int loginAccInfo = 10005;

  ///第三方开放授权登录(微信, QQ, Facebook)
  static const int loginOauth = 10006;

  ///token登录
  static const int tokenLogin = 10009;

  ///获取注册验证码, 另一个发空字符串表示
  static const int registerGetVCode = 10010;

  ///手机或邮箱注册
  static const int register = 10011;

  ///忘记密码获得验证码
  static const int forgetPasswordGetVCode = 10012;

  ///通过验证码修改密码
  static const int forgetPassword = 10013;

  ///玩家id登录
  static const int loginUserId = 10096;

  ///服务端踢玩家提示
  static const int logout = 10097;

  ///登录成功反馈
  static const int loginSuccess = 10098;

  ///socket连接后首条协议, 同步一些信息
  static const int origin = 10099;
}
