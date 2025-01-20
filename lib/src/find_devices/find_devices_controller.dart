import 'dart:async';
import 'package:cubestation_flutter/handler/ble_data_handler.dart';
import 'package:cubestation_flutter/src/home/home_controller.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class FindDevicesController extends GetxController {
  var connectedDeviceId = ''.obs;
  late BluetoothCharacteristic _writeCharacteristic;
  StreamSubscription<List<int>>? _subscription;
  StreamSubscription? _deviceStateSubscription;
  bool _isConnected = false;
  Timer? _timer;
  final int _timeout = 10;
  var countTime = 0.obs;
  final HomeController _homeController = Get.find<HomeController>();

  @override
  void onInit() async {
    BleDataHandler().onInit();
    startScan();
    super.onInit();
  }

  @override
  void onClose() {
    print(_subscription);
    _subscription?.cancel();
    _timer?.cancel();
    _timer = null;
    super.onClose();
  }

  Future startScan() async {
    countTime.value = _timeout;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countTime <= 0) {
        timer.cancel();
        return;
      }
      countTime--;
    });
    await FlutterBluePlus.stopScan();
    await FlutterBluePlus.startScan(timeout: Duration(seconds: _timeout));
  }

  void connect(ScanResult result) async {
    List<BluetoothDevice> connectedDevices = await FlutterBluePlus.connectedDevices;
    if (connectedDevices.isNotEmpty) {
      BluetoothDevice device = connectedDevices.first;
      disconnect(device);
    }
    final device = result.device;
    _timer?.cancel();
    countTime.value = 0;
    await FlutterBluePlus.stopScan();
    Fluttertoast.showToast(msg: '正在连接ing');
    await device.connect(autoConnect: false, timeout: const Duration(seconds: 10));
    _deviceStateSubscription = device.state.listen((state) async {
      if (state == BluetoothDeviceState.connected) {
        if (!_isConnected) {
          Fluttertoast.cancel();
          Fluttertoast.showToast(msg: '连接成功');
          connectedDeviceId.value = device.id.toString();
          notify();
          _isConnected = true;
          _homeController.deviceConnected.value = true;
          _homeController.deviceInfoModel.set(deviceName: device.name);
          _homeController.deviceInfoModel.set(deviceId: device.id.toString());
          print(result.advertisementData.manufacturerData);
          _homeController.deviceInfoModel
              .set(macAddress: result.advertisementData.manufacturerData[1]);
          Get.back();
        }
      }
      // if (state == BluetoothDeviceState.disconnected) {
      //   _subscription?.cancel();
      //   _deviceStateSubscription?.cancel();
      //   Fluttertoast.cancel();
      //   Fluttertoast.showToast(msg: '已断开连接');
      //   _isConnected = false;
      //   _homeController.deviceConnected.value = false;
      //   connectedDeviceId.value = '';
      //   _homeController.deviceInfoModel.clear();
      // }
    });
  }

  void disconnect(BluetoothDevice device) async {
    Fluttertoast.showToast(msg: '正在断开连接ing');
    await device.disconnect();
    _subscription?.cancel();
    _deviceStateSubscription?.cancel();
    Fluttertoast.cancel();
    Fluttertoast.showToast(msg: '已断开连接');
    _isConnected = false;
    _homeController.deviceConnected.value = false;
    connectedDeviceId.value = '';
    _homeController.deviceInfoModel.clear();
  }

  //接收数据
  void notify() async {
    List<BluetoothDevice> connectedDevices = await FlutterBluePlus.connectedDevices;
    if (connectedDevices.isNotEmpty) {
      BluetoothDevice device = connectedDevices.first;
      List<BluetoothService> services = await device.discoverServices();
      BluetoothService service =
          services.firstWhere((s) => s.uuid.toString().toUpperCase().substring(4, 8) == '000A');
      List<BluetoothCharacteristic> characteristics = service.characteristics;
      BluetoothCharacteristic characteristic = characteristics
          .firstWhere((c) => c.uuid.toString().toUpperCase().substring(4, 8) == '000B');
      _writeCharacteristic = characteristics
          .firstWhere((c) => c.uuid.toString().toUpperCase().substring(4, 8) == '000C');
      await characteristic.setNotifyValue(true);
      BleDataHandler().initCharacteristic(_writeCharacteristic);
      _subscription = characteristic.value.listen((value) {
        // print("device is online: " + value.toString());
        BleDataHandler().decode(value);
      });
    }
  }
}
