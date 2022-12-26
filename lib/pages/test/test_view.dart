import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/components/drop_select/drop_select.dart';
import 'package:flutter_getx_template/components/icon_text.dart';
import 'package:flutter_getx_template/components/work_item.dart';
import 'package:flutter_getx_template/pages/test/test_controller.dart';
import 'package:flutter_getx_template/router/app_pages.dart';
import 'package:flutter_getx_template/utils/update_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/colors/colors.dart';
import '../../components/photo_preview.dart';
import '../../components/search_bar.dart';

class TestPage extends GetView<TestController> {
  TestPage({Key? key}) : super(key: key);
  final List<String> _imgs = List.filled(10,
      'https://oss.eqianhuo.com/a378b448a8e3416daa4543b1bb345357-1669017831777-.bmp');

  final List<String> items = ['工种', '地区', '筛选'];
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
              SearchBar<String>(
                searchList: _imgs,
                searchQueryBuilder: (query, list) {
                  return list
                      .where((item) =>
                          item.toLowerCase().contains(query.toLowerCase()))
                      .toList();
                },
                overlaySearchListItemBuilder: (item) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      item,
                      style: const TextStyle(fontSize: 18),
                    ),
                  );
                },
                onItemSelected: (item) {
                  print('$item');
                },
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.Worklist);
                },
                child: Container(
                  height: 20,
                  color: Colors.amber,
                ),
              ),
              DLDropdownSelect<String>(
                  items: items,
                  itemBuilder: (index) {
                    return Container(
                        padding: EdgeInsets.all(10),
                        child: IconText(
                          text: items[index],
                          icon: Icon(Icons.arrow_drop_down),
                          style: TextStyle(
                              color: AppColors.primaryColor, fontSize: 12.sp),
                        ));
                  },
                  selectBuilder: (index) {
                    return Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        color: Colors.red[200],
                        child: Text(items[index]));
                  }),
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
                  // Toast.makeText(context:context, content:'底部弹出隐藏到底部').show();
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
              Obx(
                () => AnimatedContainer(
                  width: 100.w,
                  height: controller.count.value.toDouble(),
                  color: Colors.amber,
                  duration: const Duration(seconds: 1),
                ),
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
