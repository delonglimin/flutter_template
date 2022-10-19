import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndexController extends GetxController   {

  var  position = 0.obs;
  final iconsMap = {
    "首页": Icons.home,
    "动态": Icons.toys,
    "喜欢": Icons.favorite,
    "手册": Icons.class_,
    "我的": Icons.account_circle,
  };
 late PageController  paegController;

  @override
  void onInit() {
     paegController = PageController();
    super.onInit();
  }

  @override
  void onReady() {
  }

  @override
  void onClose() {}

  @override
  void dispose() {
     paegController.dispose();
    super.dispose();
  }
}
