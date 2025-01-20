import 'package:cubestation_flutter/common/color.dart';
import 'package:cubestation_flutter/route/app_pages.dart';
import 'package:cubestation_flutter/route/routes.dart';
import 'package:cubestation_flutter/src/initial/initial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'src/home/home.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

var appOrientation = Orientation.portrait.obs;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        print(orientation);
        appOrientation.value = orientation;
        return ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (context, child) {
              return GetMaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(useMaterial3: true, colorSchemeSeed: CSColors.primary),
                initialRoute: Routes.HOME2,
                getPages: AppPages.pages,
                debugShowCheckedModeBanner: false,
              );
            });
      },
    );
  }
}
