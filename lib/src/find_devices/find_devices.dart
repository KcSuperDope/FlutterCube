import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'find_devices_controller.dart';

class FindDevicesDialog extends StatelessWidget {
  FindDevicesDialog({Key? key}) : super(key: key);

  final FindDevicesController controller = Get.put(FindDevicesController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        height: 400,
        width: 400,
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    '设备列表',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  StreamBuilder<List<BluetoothDevice>>(
                      stream: Stream.periodic(const Duration(seconds: 1))
                          .asyncMap((_) => FlutterBluePlus.connectedDevices),
                      initialData: const [],
                      builder: (c, snapshot) => snapshot.data!.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                                title: SizedBox(width: 200, child: Text(snapshot.data!.first.name)),
                                subtitle: Text(
                                  snapshot.data!.first.id.toString(),
                                  style: Get.textTheme.caption,
                                ),
                                trailing: StreamBuilder<BluetoothConnectionState>(
                                  stream: snapshot.data!.first.connectionState,
                                  initialData: BluetoothConnectionState.disconnected,
                                  builder: (c, s) {
                                    return ElevatedButton(
                                      onPressed: s.data == BluetoothConnectionState.connected
                                          ? () => controller.disconnect(snapshot.data!.first)
                                          : null,
                                      child: const Text('断开连接'),
                                    );
                                  },
                                ),
                              ))
                          : const SizedBox()),
                  Expanded(
                    child: SingleChildScrollView(
                      child: StreamBuilder<List<ScanResult>>(
                        stream: FlutterBluePlus.scanResults,
                        initialData: const [],
                        builder: (c, snapshot) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: snapshot.data
                                      ?.map((r) => _scanResultTile(r)
                                          // r.device.name.startsWith('GANicV2S')
                                          //     ? Obx(() => r.device.id.toString() ==
                                          //             controller.connectedDeviceId.value
                                          //         ? const SizedBox()
                                          //         : _scanResultTile(r))
                                          //     : const SizedBox(),
                                          )
                                      .toList() ??
                                  [],
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  scanButton(),
                  const SizedBox(height: 20),
                  Text(
                    '搜索过程中请转动一下您的魔方，解除休眠',
                    style: Get.textTheme.titleSmall,
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(right: 8, top: 8),
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.close),
                  iconSize: 30,
                  alignment: Alignment.topRight,
                ))
          ],
        ),
      ),
    );
  }

  Widget scanButton() {
    return StreamBuilder<bool>(
      stream: FlutterBluePlus.isScanning,
      initialData: false,
      builder: (c, snapshot) {
        return snapshot.data!
            ? ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(180, 50)),
                    shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)))),
                child: Obx(() => Text('搜索中(${controller.countTime.value}s)')),
              )
            : ElevatedButton(
                onPressed: controller.startScan,
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(180, 50)),
                    shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)))),
                child: const Text('重新搜索'),
              );
      },
    );
  }

  Widget _scanResultTile(ScanResult result) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      title: SizedBox(
        width: 200,
        child: Text(
          result.device.name,  
          overflow: TextOverflow.ellipsis,
        ),
      ),
      subtitle: Text(
        result.device.id.toString(),
        style: Get.textTheme.caption,
      ),
      // leading: Text(result.rssi.toString()),
      trailing: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        onPressed: () => controller.connect(result),
        child: const Text('连接'),
      ),
    );
  }
}
