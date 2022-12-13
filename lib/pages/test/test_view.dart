import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/components/work_item.dart';
import 'package:flutter_getx_template/pages/test/test_controller.dart';
import 'package:flutter_getx_template/utils/update_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../components/PhotoPreview.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({Key? key}) : super(key: key);
  final List<String> _imgs = List.filled(10,
      'https://oss.eqianhuo.com/a378b448a8e3416daa4543b1bb345357-1669017831777-.bmp');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 400,
                  color: Colors.grey,
                  padding: EdgeInsets.all(12.w),
                  child: Obx(() => ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: controller.listData.length,
                      itemBuilder: (context, index) {
                        return WorkItem();
                      }))),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    color: Colors.amber,
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: Row(children: _getRowImgs()),
                  )),
              TextButton(
                onPressed: () {
                  controller.doLogin();
                },
                child: Text('login'.tr),
              ),
              TextButton(
                onPressed: () {
                  UpdateManager.checkUpdate();
                },
                child: Text('checkupdate'),
              ),
              TextButton(
                onPressed: () {
                  controller.getList();
                },
                child: Text('getList'.tr),
              ),
              Text('默认主题颜色'),
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
              Obx(() => Text("${controller.count}")),
              Container(
                  height: 200,
                  padding: EdgeInsets.all(0),
                  child: Obx(() => ListView.builder(
                      padding: EdgeInsets.zero,
                      controller: controller.scrollController,
                      scrollDirection: Axis.vertical,
                      itemCount: controller.listData.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title:
                              Text('${controller.listData[index].createTime}'),
                        );
                      }))),
              Container(
                height: 200,
                color: Colors.amber,
              )
            ]),
      ),
    ));
  }

  List<Widget> _getRowImgs() {
    return List.generate(_imgs.length, (index) {
      return Container(
          margin: EdgeInsets.only(right: 10),
          child: GestureDetector(
            onTap: () {
              Get.to(PhotoPreview(
                galleryItems: _imgs,
                defaultImage: index,
              ));
            },
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: _imgs[index],
              height: 100.w,
              width: 100.w,
            ),
          ));
    });
  }
}
