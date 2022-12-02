import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_getx_template/common/colors/theme.dart';
import 'package:flutter_getx_template/common/langs/translation_service.dart';
import 'package:flutter_getx_template/global.dart';
import 'package:flutter_getx_template/router/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => Global.init().then((e) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        title: 'Flutter With GetX',
        debugShowCheckedModeBanner: false,
        enableLog: true,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        unknownRoute: AppPages.unknownRoute,
        builder: EasyLoading.init(),
        locale: TranslationService.locale,
        fallbackLocale: TranslationService.fallbackLocale,
        translations: TranslationService(),
        defaultTransition: Transition.rightToLeft,
        theme: lightTheme,
        darkTheme: darkTheme,
      ),
    );
  }
}
