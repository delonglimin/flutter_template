import 'package:flutter/material.dart';
import 'package:flutter_getx_template/pages/Index/Index_controller.dart';
import 'package:get/get.dart';

class IndexPage extends GetView<IndexController> {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView(
          controller: controller.paegController,
          children: controller.iconsMap.keys.map((e) => Center(
            child: Text(e),
          )).toList(),
          onPageChanged: (value) => controller.position.value = value,
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) =>
      Obx(() => BottomNavigationBar(
            onTap: (position) {
              controller.paegController.jumpToPage(position);
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).primaryColor,
            currentIndex: controller.position.value,
            items: controller.iconsMap.keys
                .map((key) => BottomNavigationBarItem(
                      label: key,
                      icon: Icon(controller.iconsMap[key]),
                    ))
                .toList(),
          ));
}
