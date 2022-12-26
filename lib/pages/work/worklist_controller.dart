import 'package:flutter/material.dart';
import 'package:flutter_getx_template/components/x_dropdown_menu/gzx_dropdown_menu.dart';
import 'package:get/get.dart';

class WorklistController extends GetxController {
  List<String> dropDownHeaderItemStrings = ['全城', '品牌', '筛选'];
  GZXDropdownMenuController dropdownMenuController =
      GZXDropdownMenuController();

  GlobalKey stackKey = GlobalKey();

  Map<String,List<String>> selectItems = {
    '招工类型':['招工人','招班组'],
    '招工方式':['企业直聘','个人招聘'],
    '用工形式':['全职','零工'],
    '实名认证':['已认证','未认证'],
    '其他':['包吃','包住','包吃','包住','包吃','包住','包吃','包住'],
  };

final showFirst = true.obs;



  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
}
