import 'package:flutter/material.dart';
import 'package:flutter_getx_template/components/x_dropdown_menu/gzx_dropdown_menu.dart';
import 'package:flutter_getx_template/router/app_pages.dart';
import 'package:get/get.dart';

import '../../components/dl_animal_size.dart';
import 'worklist_controller.dart';

class WorklistPage extends GetView<WorklistController> {
  const WorklistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("data")),
      floatingActionButton: FloatingActionButton(onPressed: () {
        controller.showFirst.value = false;
      }),
      body: Stack(
        key: controller.stackKey,
        children: [
          Column(children: [
            DLAnimatedSize(
              duration: Duration(seconds: 2),
              child: Container(
              width: double.infinity,
              color: Colors.red,
              child: Text("data"*100),
            ),
              ),
            GZXDropDownHeader(
              items: [
                GZXDropDownHeaderItem(controller.dropDownHeaderItemStrings[0]),
                GZXDropDownHeaderItem(
                  controller.dropDownHeaderItemStrings[1],
                ),
                GZXDropDownHeaderItem(
                  controller.dropDownHeaderItemStrings[2],
                ),
              ],
              stackKey: controller.stackKey,
              controller: controller.dropdownMenuController,
              onItemTap: (index) {
                if (index != 2) {
                  Get.toNamed(AppRoutes.NotFound);
                  return true;
                }
                return false;
              },
            ),
            Expanded(
              child: ListView.separated(
                  itemCount: 30,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(height: 1.0),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: ListTile(
                        leading: Text('test$index'),
                      ),
                      onTap: () {},
                    );
                  }),
            ),
          ]),
          GZXDropDownMenu(
            controller: controller.dropdownMenuController,
            dropdownMenuChanging: (isShow, index) {
              print(isShow);
            },
            dropdownMenuChanged: (isShow, index) {
              print(isShow);
            },
            menus: [
              GZXDropdownMenuBuilder(
                  dropDownHeight: 0, dropDownWidget: Container()),
              GZXDropdownMenuBuilder(
                  dropDownHeight: 0, dropDownWidget: Container()),
              GZXDropdownMenuBuilder(
                  dropDownWidget: _buildConditionListWidget()),
            ],
          ),
        ],
      ),
    );
  }

  _buildConditionListWidget() {
    List<Widget> items = [];
    controller.selectItems.forEach((key, value) {
      items.add(Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(key)),
            Wrap(
              spacing: 10,
              children: value
                  .map((e) => ElevatedButton(onPressed: () {}, child: Text(e)))
                  .toList(),
            ),
          ],
        ),
      ));
    });

    return Container(
        child: SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: items)),
    ));
  }
}
