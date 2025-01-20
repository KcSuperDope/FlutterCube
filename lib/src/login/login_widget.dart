import 'dart:async';

import 'package:cubestation_flutter/common/button.dart';
import 'package:cubestation_flutter/common/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PhoneTextField extends StatefulWidget {
  final FormFieldSetter<String?>? onSaved;
  final FormFieldSetter<String?>? onChanged;
  final FormFieldSetter<String?>? onSelectAreaCode;
  const PhoneTextField({super.key, this.onSaved, this.onChanged, this.onSelectAreaCode});

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  TextEditingController textEditingController = TextEditingController();
  final FocusNode buttonFocusNode = FocusNode(debugLabel: 'Menu Button');
  var areaCode = '+86'.obs;
  List<String> areaCodes = ['+86', '+852', '+853', '+886'];
  final _phone = ''.obs;

  @override
  void dispose() {
    buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.7,
      child: TextFormField(
        style:
            TextStyle(fontSize: 16.0, color: CSColors.primaryText, fontWeight: FontWeight.normal),
        controller: textEditingController,
        keyboardType: const TextInputType.numberWithOptions(),
        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          isCollapsed: true,
          errorStyle: const TextStyle(height: 0.5),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CSColors.commonRed),
              borderRadius: BorderRadius.circular(24)),
          border: OutlineInputBorder(
              borderSide: BorderSide.none, borderRadius: BorderRadius.circular(24)),
          filled: true,
          fillColor: CSColors.lightBackground,
          hintText: '请输入手机号',
          hintStyle: TextStyle(
              fontSize: 16.0, color: CSColors.secondaryText, fontWeight: FontWeight.normal),
          contentPadding: const EdgeInsets.only(top: 12),
          prefixIcon: SizedBox(
            width: 78,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: MenuAnchor(
                    childFocusNode: buttonFocusNode,
                    builder: (BuildContext context, MenuController menuController, Widget? child) {
                      return TextButton(
                        focusNode: buttonFocusNode,
                        onPressed: () {
                          if (menuController.isOpen) {
                            menuController.close();
                          } else {
                            menuController.open();
                          }
                        },
                        child: Obx(() => Text(areaCode.value)),
                      );
                    },
                    menuChildren: areaCodes
                        .map((e) => MenuItemButton(
                              onPressed: () {
                                areaCode.value = e;
                                if (widget.onSelectAreaCode != null) {
                                  widget.onSelectAreaCode!(areaCode.value);
                                }
                              },
                              child: MenuAcceleratorLabel(e),
                            ))
                        .toList(),
                  ),
                ),
                Container(
                  height: 22,
                  width: 1,
                  color: CSColors.secondaryText,
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
          suffixIcon: Container(
            width: 40,
            alignment: Alignment.center,
            child: Obx(() => Offstage(
                  offstage: _phone.value.isEmpty,
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.cancel,
                        color: CSColors.secondaryText,
                        size: 20,
                      ),
                      onPressed: () {
                        textEditingController.clear();
                      }),
                )),
          ),
        ),
        validator: (String? value) {
          if (value == '') {
            return '请输入手机号';
          }
          if (!GetUtils.isPhoneNumber(value!)) {
            return '请输入正确的手机号';
          }
        },
        onSaved: widget.onSaved,
        onChanged: (value) {
          _phone.value = value;
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
      ),
    );
  }
}

Widget emailTextField({
  FormFieldSetter<String?>? onSaved,
  FormFieldSetter<String?>? onChanged,
}) {
  final TextEditingController textEditingController = TextEditingController();
  final email = ''.obs;
  return SizedBox(
    width: Get.width * 0.7,
    child: TextFormField(
      style: TextStyle(fontSize: 16.0, color: CSColors.primaryText, fontWeight: FontWeight.normal),
      controller: textEditingController,
      decoration: InputDecoration(
        isCollapsed: true,
        errorStyle: const TextStyle(height: 0.5),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CSColors.commonRed),
            borderRadius: BorderRadius.circular(24)),
        border: OutlineInputBorder(
            borderSide: BorderSide.none, borderRadius: BorderRadius.circular(24)),
        filled: true,
        fillColor: CSColors.lightBackground,
        hintText: '请输入邮箱',
        hintStyle:
            TextStyle(fontSize: 16.0, color: CSColors.secondaryText, fontWeight: FontWeight.normal),
        contentPadding: const EdgeInsets.only(top: 12),
        prefixIcon: SizedBox(
          width: 78,
          child: Row(
            children: [
              const Padding(
                  padding: EdgeInsets.only(left: 26, right: 19),
                  child: Icon(Icons.email_rounded, size: 24)),
              Container(
                height: 22,
                width: 1,
                color: CSColors.secondaryText,
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
        suffixIcon: Container(
            width: 40,
            alignment: Alignment.center,
            child: Obx(() => Offstage(
                  offstage: email.value.isEmpty,
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.cancel,
                        color: CSColors.secondaryText,
                        size: 20,
                      ),
                      onPressed: () {
                        textEditingController.clear();
                      }),
                ))),
      ),
      validator: (String? value) {
        if (value == '') {
          return '请输入邮箱';
        }
        if (!GetUtils.isEmail(value!)) {
          return '请输入正确的邮箱';
        }
      },
      onSaved: onSaved,
      onChanged: (value) {
        email.value = value;
        if (onChanged != null) {
          onChanged(value);
        }
      },
    ),
  );
}

Widget passwordTextField(
    {String? hintText, FormFieldValidator<String>? validator, FormFieldSetter<String?>? onSaved}) {
  var isObscure = true.obs;
  return SizedBox(
    width: Get.width * 0.7,
    child: Obx(
      () => TextFormField(
          obscureText: isObscure.value,
          obscuringCharacter: '*',
          style:
              TextStyle(fontSize: 16.0, color: CSColors.primaryText, fontWeight: FontWeight.normal),
          decoration: InputDecoration(
              isCollapsed: true,
              errorStyle: const TextStyle(height: 0.5),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: CSColors.commonRed),
                  borderRadius: BorderRadius.circular(24)),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none, borderRadius: BorderRadius.circular(24)),
              filled: true,
              fillColor: CSColors.lightBackground,
              hintText: hintText,
              hintStyle: TextStyle(
                  fontSize: 16.0, color: CSColors.secondaryText, fontWeight: FontWeight.normal),
              contentPadding: const EdgeInsets.only(top: 12),
              prefixIcon: SizedBox(
                width: 78,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 26, right: 19),
                      child: Image.asset(
                        'assets/icon_password.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                    Container(
                      height: 22,
                      width: 1,
                      color: CSColors.secondaryText,
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
              suffixIcon: IconButton(
                icon: Image.asset(
                  isObscure.value ? 'assets/icon_eye_close.png' : 'assets/icon_eye.png',
                  width: 16,
                  height: 16,
                ),
                onPressed: () {
                  isObscure.value = !isObscure.value;
                },
              )),
          validator: validator,
          onSaved: onSaved),
    ),
  );
}

class GetVCodeTextField extends StatefulWidget {
  final FormFieldSetter<String>? onSaved;
  final Future<bool> Function()? onSend;
  const GetVCodeTextField({super.key, this.onSaved, this.onSend});

  @override
  State<GetVCodeTextField> createState() => _GetVCodeTextFieldState();
}

class _GetVCodeTextFieldState extends State<GetVCodeTextField> {
  Timer? _timer;
  var countTime = 60.obs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.7,
      child: TextFormField(
        keyboardType: const TextInputType.numberWithOptions(),
        inputFormatters: <TextInputFormatter>[
          LengthLimitingTextInputFormatter(4), //限制长度
          FilteringTextInputFormatter.digitsOnly
        ],
        style:
            TextStyle(fontSize: 16.0, color: CSColors.primaryText, fontWeight: FontWeight.normal),
        decoration: InputDecoration(
          isCollapsed: true,
          errorStyle: const TextStyle(height: 0.5),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CSColors.commonRed),
              borderRadius: BorderRadius.circular(24)),
          border: OutlineInputBorder(
              borderSide: BorderSide.none, borderRadius: BorderRadius.circular(24)),
          filled: true,
          fillColor: CSColors.lightBackground,
          hintText: '请输入验证码',
          hintStyle: TextStyle(
              fontSize: 16.0, color: CSColors.secondaryText, fontWeight: FontWeight.normal),
          contentPadding: const EdgeInsets.only(top: 12),
          prefixIcon: SizedBox(
            width: 78,
            child: Row(
              children: [
                const Padding(
                    padding: EdgeInsets.only(left: 26, right: 19),
                    child: Icon(Icons.verified_user, size: 24)),
                Container(
                  height: 22,
                  width: 1,
                  color: CSColors.secondaryText,
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
          suffixIcon: Container(
            width: 40,
            alignment: Alignment.center,
            child: Obx(() => countTime.value == 60
                ? TextButton(
                    onPressed: _send,
                    child: Text(
                      '发送',
                      style: TextStyle(color: CSColors.primary),
                    ))
                : Text(
                    countTime.value.toString(),
                    style: TextStyle(
                        fontSize: 14.0,
                        color: CSColors.secondaryText,
                        fontWeight: FontWeight.normal),
                  )),
          ),
        ),
        validator: (String? value) {
          if (value == '') {
            return '请输入验证码';
          }
        },
        onSaved: widget.onSaved,
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  void _send() async {
    if (ButtonUtils.isDoubleClick()) {
      return;
    }
    if (widget.onSend != null) {
      if (await widget.onSend!()) {
        _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          if (countTime.value <= 0) {
            countTime.value = 60;
            timer.cancel();
            return;
          }
          countTime.value--;
        });
      }
    }
  }
}

// Widget _getVCode() {
//   return SizedBox(
//     width: Get.width * 0.7,
//     child: TextFormField(
//       keyboardType: const TextInputType.numberWithOptions(),
//       inputFormatters: <TextInputFormatter>[
//         LengthLimitingTextInputFormatter(4), //限制长度
//         FilteringTextInputFormatter.digitsOnly
//       ],
//       style: TextStyle(fontSize: 16.0, color: CSColors.primaryText, fontWeight: FontWeight.normal),
//       decoration: InputDecoration(
//         isCollapsed: true,
//         errorStyle: const TextStyle(height: 0.5),
//         errorBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: CSColors.commonRed),
//             borderRadius: BorderRadius.circular(24)),
//         border: OutlineInputBorder(
//             borderSide: BorderSide.none, borderRadius: BorderRadius.circular(24)),
//         filled: true,
//         fillColor: CSColors.lightBackground,
//         hintText: '请输入验证码',
//         hintStyle:
//             TextStyle(fontSize: 16.0, color: CSColors.secondaryText, fontWeight: FontWeight.normal),
//         contentPadding: const EdgeInsets.only(top: 12),
//         prefixIcon: SizedBox(
//           width: 78,
//           child: Row(
//             children: [
//               const Padding(
//                   padding: EdgeInsets.only(left: 26, right: 19),
//                   child: Icon(Icons.verified_user, size: 24)),
//               Container(
//                 height: 22,
//                 width: 1,
//                 color: CSColors.secondaryText,
//               ),
//               const SizedBox(width: 8),
//             ],
//           ),
//         ),
//         suffixIcon: Container(
//           width: 40,
//           alignment: Alignment.center,
//           child: Obx(() => countTime.value == 60
//               ? TextButton(
//                   onPressed: controller.registerGetVCode,
//                   child: Text(
//                     '发送',
//                     style: TextStyle(color: CSColors.primary),
//                   ))
//               : Text(
//                   controller.countTime.value.toString(),
//                   style: TextStyle(
//                       fontSize: 14.0, color: CSColors.secondaryText, fontWeight: FontWeight.normal),
//                 )),
//         ),
//       ),
//       validator: (String? value) {
//         if (value == '') {
//           return '请输入验证码';
//         }
//       },
//       onSaved: (String? value) => controller.vCode = value,
//     ),
//   );
// }
