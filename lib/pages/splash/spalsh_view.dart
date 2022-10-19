import 'package:flutter/material.dart';
import 'package:flutter_getx_template/common/values/r.dart';
import 'package:flutter_getx_template/components/timer_tag.dart';
import 'package:flutter_getx_template/pages/splash/spalsh_controller.dart';
import 'package:flutter_getx_template/router/app_pages.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          child: Image.asset(R.assetsImagesSplash,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: TimerTag(
              time: controller.timerNum,
              onEnd: () {
                Get.offNamed(AppRoutes.Index);
              }),
        )
      ]),
    );
  }
}
