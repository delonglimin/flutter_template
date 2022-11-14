import 'package:flutter/material.dart';
import 'package:flutter_getx_template/pages/login/login_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                controller.doLogin();
              },
              child: Text('login'.tr),
            ),
             TextButton(
              onPressed: () {
                controller.getList();
              },
              child: Text('getList'.tr),
            ),
            Text('默认主题颜色'),
            SizedBox(
              height: 10.w,
            ),
            Container(
              width: 100.w,
              // width: ScreenUtil().setWidth(20),
              height: 100.w,
              color: Colors.amber,
            ),
            TextButton(
                onPressed: () {
                  controller.increment();
                },
                child: Text(
                  "测试数据状态",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                )),
            Obx(() => Text("${controller.count}"))
          ]),
    ));
  }
}
