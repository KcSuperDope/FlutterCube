import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';

class EncryptUtil {
  static const key = [
    0x01,
    0x02,
    0x42,
    0x28,
    0x31,
    0x91,
    0x16,
    0x07,
    0x20,
    0x05,
    0x18,
    0x54,
    0x42,
    0x11,
    0x12,
    0x53
  ];

  static const iv = [
    0x11,
    0x03,
    0x32,
    0x28,
    0x21,
    0x01,
    0x76,
    0x27,
    0x20,
    0x95,
    0x78,
    0x14,
    0x32,
    0x12,
    0x02,
    0x43
  ];

  static List<int> macIv = [];
  static List<int> macKey = [];

  static void handleMac(List<int> macAddress) {
    if (macAddress.length < 6) return;
    macIv = List.from(iv);
    macKey = List.from(key);
    var mac = macAddress.sublist(macAddress.length - 6, macAddress.length);
    for (int i = 0; i < 6; i++) {
      macKey[i] = (mac[i] + key[i]) % 255;
      macIv[i] = (mac[i] + iv[i]) % 255;
    }
    var macKeyString = " ";
    var macIvString = " ";
    for (var element in macKey) {
      macKeyString += element.toRadixString(16) + " ";
    }
    for (var element in macIv) {
      macIvString += element.toRadixString(16) + " ";
    }
    print("00000000000000000000000000000000000");
    print(macKeyString);
    print(macIvString);
  }

  static List<int> encrypt(List<int> data) {
    if (data.length < 16) {
      data.addAll(List.filled(16 - data.length, 0));
    }
    final encrypter =
        Encrypter(AES(Key(Uint8List.fromList(macKey)), mode: AESMode.cbc, padding: null));
    final encrypted = encrypter.encryptBytes(data, iv: IV(Uint8List.fromList(macIv)));
    final res = encrypted.bytes.toList();
    print(res);
    return res;
  }

  static List<int> decrypt(List<int> data) {
    if (data.length == 16) {
      final res = decrypt2(data);
      return res;
      // final realLength = res[2];
      // print("------------------------- 等于 16 ------------------------------");
      // print(data);
      // print(res);
      // if (res[realLength + 5] == 0) {
      //   final res1 = res.sublist(0, 5 + realLength);
      //   print(res1);
      //   return res1;
      // }
      // print(res);
      // print("------------------------- 等于 16 ------------------------------");
      // return res;
    } else {
      final subData1 = data.sublist(data.length - 16, data.length);
      final res1 = decrypt2(subData1);
      final subData2 = data.sublist(0, data.length - 16) + res1.sublist(0, 16 - (data.length - 16));
      final res2 = decrypt2(subData2);
      final res = res2 + res1.sublist(16 - (data.length - 16), 16);
      print("------------------------- 大于 16 ------------------------------");
      print(data.length);
      print(data);
      print(subData1);
      print(res1);
      print(subData2);
      print(res2);
      print(res);
      print("------------------------- 大于 16 ------------------------------");
      return res;
    }
  }

  static List<int> decrypt2(List<int> data) {
    final encrypter =
        Encrypter(AES(Key(Uint8List.fromList(macKey)), mode: AESMode.cbc, padding: null));
    final res = encrypter.decryptBytes(
      Encrypted(Uint8List.fromList(data)),
      iv: IV(Uint8List.fromList(macIv)),
    );
    return res;
  }
}
