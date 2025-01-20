import 'dart:typed_data';
import 'package:cubestation_flutter/common/data_manager.dart';
import 'package:cubestation_flutter/network/proto_id.dart';
import 'package:cubestation_flutter/pb/code.pbenum.dart';
import 'package:cubestation_flutter/route/routes.dart';
import 'package:cubestation_flutter/utils/eventbus_utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:protobuf/protobuf.dart';
import 'package:cubestation_flutter/pb/login.pb.dart';
import 'package:web_socket_channel/io.dart';

///前后端通讯协议(protobuf)
/*
协议包格式
| ProtoLength | ProtoID | ProtoBody |
| 2bytes     | 2 bytes | c2s_test1 |

ProtoLength 协议号+协议体长度，小端整数
ProtoID     协议号，小端整数
ProtoBody   消息内容，协议号对应结构体信息

数据包格式 c2s
| Length  | Body       |
| 2bytes | ProtoPacks |

Length      Body长度，小端整数
Body        由n个协议包组成

数据包格式 s2c
| Length  | IsCompress | Body       |
| 2bytes | 1 bytes    | ProtoPacks |

Length      Body长度，小端整数
IsCompress  是否压缩，服务端发消息给客户端时，如果包体超过一定长途，进行压缩
Body        由n个协议包组成
*/

// String baseSocketUrl = 'ws://192.168.10.111:15550/ws';
String baseSocketUrl = 'ws://192.168.80.133:15550/ws';

///协议号+协议体长度用两个字节表示
const int protoLen = 2;

///协议号长度
const int protoIdLen = 2;

class NetWorkManager {
  static NetWorkManager? _instance;

//单例方法
  factory NetWorkManager() => _instance ?? NetWorkManager._internal();

  NetWorkManager._internal() {
    // 初始化
    _instance = this;
  }

  //socket实例
  late IOWebSocketChannel _channel;

  void initSocket() {
//建立链接
    try {
      _channel = IOWebSocketChannel.connect(baseSocketUrl);
      print("建立socket连接");
    } catch (e) {
      print("连接socket出现异常，e=${e.toString()}");
    }
//添加数据监听
    _channel.stream.listen(_onData, onError: _onError, onDone: _onDone);
  }

  void _onData(message) {
    print('received:$message');
    _parseData(message);
  }

  void _onError(error, StackTrace trace) {
    print("捕获socket异常信息：error=$error，trace=${trace.toString()}");
    _channel.sink.close();
  }

  void _onDone() {
    print("断连，5秒后执行重连");
    Future.delayed(5.seconds, () => initSocket());
  }

  void _parseData(Uint8List message) {
    Uint8List id = message.sublist(5, 7); // 截取协议号
    int protoId = ByteData.view(id.buffer).getUint16(0); // 获取到协议号值

    Uint8List protolength = message.sublist(3, 5);
    int bodylength = ByteData.view(protolength.buffer).getUint16(0) - protoIdLen;
    var data = message.sublist(7, 7 + bodylength); //body数据

    switch (protoId) {
      case ProtoId.heartbeat:
        s2c_heartbeat heartbeat = s2c_heartbeat.fromBuffer(data); // 反序列化数据
        print('heartbeat:$heartbeat');
        eventBus.fire(HeartbeatEvent(heartbeat));
        break;
      case ProtoId.loginPassword:
        s2c_login_password loginPassword = s2c_login_password.fromBuffer(data); // 反序列化数据
        print('loginPassword:$loginPassword');
        eventBus.fire(LoginPasswordEvent(loginPassword));
        break;
      case ProtoId.loginGetVCode:
        s2c_login_get_v_code loginGetVCode = s2c_login_get_v_code.fromBuffer(data); // 反序列化数据
        print('loginGetVCode:$loginGetVCode');
        eventBus.fire(LoginGetVCodeEvent(loginGetVCode));
        break;
      case ProtoId.loginAccInfo:
        s2c_login_acc_info loginAccInfo = s2c_login_acc_info.fromBuffer(data); // 反序列化数据
        print('loginAccInfo:$loginAccInfo');
        eventBus.fire(LoginAccInfoEvent(loginAccInfo));
        break;
      case ProtoId.loginOauth:
        s2c_login_oauth loginOauth = s2c_login_oauth.fromBuffer(data); // 反序列化数据
        print('loginOauth:$loginOauth');
        eventBus.fire(LoginOauthEvent(loginOauth));
        break;
      case ProtoId.tokenLogin:
        s2c_token_login tokenLogin = s2c_token_login.fromBuffer(data); // 反序列化数据
        print('tokenLogin:$tokenLogin');
        _tokenLogin(tokenLogin);
        break;
      case ProtoId.registerGetVCode:
        s2c_register_get_v_code registerGetVCode =
            s2c_register_get_v_code.fromBuffer(data); // 反序列化数据
        print('registerGetVCode:$registerGetVCode');
        eventBus.fire(RegisterGetVCodeEvent(registerGetVCode));
        break;
      case ProtoId.register:
        s2c_register register = s2c_register.fromBuffer(data); // 反序列化数据
        print('register:$register');
        eventBus.fire(RegisterEvent(register));
        break;
      case ProtoId.forgetPasswordGetVCode:
        s2c_forget_password_get_v_code forgetPasswordGetVCode =
            s2c_forget_password_get_v_code.fromBuffer(data); // 反序列化数据
        print('forgetPasswordGetVCode:$forgetPasswordGetVCode');
        eventBus.fire(ForgetPasswordGetVCodeEvent(forgetPasswordGetVCode));
        break;
      case ProtoId.forgetPassword:
        s2c_forget_password forgetPassword = s2c_forget_password.fromBuffer(data); // 反序列化数据
        print('forgetPassword:$forgetPassword');
        eventBus.fire(ForgetPasswordEvent(forgetPassword));
        break;
      case ProtoId.loginUserId:
        s2c_login_user_id loginUserId = s2c_login_user_id.fromBuffer(data); // 反序列化数据
        print('loginUserId:$loginUserId');
        eventBus.fire(LoginUserIdEvent(loginUserId));
        break;
      case ProtoId.logout:
        s2c_logout logout = s2c_logout.fromBuffer(data); // 反序列化数据
        print('logout:$logout');
        // eventBus.fire(LogoutEvent(logout));
        _logout(logout);
        break;
      case ProtoId.loginSuccess:
        s2c_login_success loginSuccess = s2c_login_success.fromBuffer(data); // 反序列化数据
        print('loginSuccess:$loginSuccess');
        // eventBus.fire(LoginSuccessEvent(loginSuccess));
        _loginSuccess(loginSuccess);
        break;
      case ProtoId.origin:
        s2c_origin origin = s2c_origin.fromBuffer(data); // 反序列化数据
        print('origin:$origin');
        eventBus.fire(OriginEvent(origin));
        break;

      default:
    }
  }

  void send(int protoId, [GeneratedMessage? body]) {
    //序列化pb对象
    Uint8List? pbBody;
    // 消息内容
    int bodyLength = 0;
    if (body != null) {
      pbBody = body.writeToBuffer();
      bodyLength = pbBody.length;
    }

    // 协议字段
    ByteData header = ByteData(6);
    header.setUint16(0, protoLen + protoIdLen + bodyLength);
    header.setUint16(2, protoIdLen + bodyLength);
    header.setUint16(4, protoId);

    //包头+pb组合成一个完整的数据包
    var msg = pbBody == null
        ? header.buffer.asUint8List()
        : header.buffer.asUint8List() + pbBody.buffer.asUint8List();
    print('sendMessage=$msg');
    try {
      _channel.sink.add(msg);
    } catch (e) {
      print(e);
    }
  }

  void dispose() {
    _channel.sink.close();
  }

  void _tokenLogin(s2c_token_login model) {
    if (model.eCode != response_code.normal) {
      DataManager.clearLoginModel();
      Get.offAllNamed(Routes.LOGIN, predicate: (route) => Get.currentRoute == Routes.INITIAL);
    }
  }

  void _loginSuccess(s2c_login_success model) {
    DataManager.loginModel.value = model;
    GetStorage localStorage = GetStorage();
    localStorage.write('iUserID', model.mAccountInfo.iUserID.toInt());
    localStorage.write('iToken', model.iToken);
  }

  void _logout(s2c_logout model) {
    DataManager.clearLoginModel();
    Get.offAllNamed(Routes.LOGIN, predicate: (route) => Get.currentRoute == Routes.INITIAL);
  }
}
