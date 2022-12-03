import 'package:flutter/material.dart';
import 'package:flutter_getx_template/model/article_model.dart';
import 'package:flutter_getx_template/router/app_pages.dart';
import 'package:flutter_getx_template/services/user.dart';
import 'package:flutter_getx_template/utils/common_util.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final count = 0.obs;
  final listData = <ArticleModel>[].obs;

  ScrollController scrollController = ScrollController();

  void doLogin() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      hideLoading();
      showToast('success');
      Get.toNamed(AppRoutes.Index);
    });
  }

  void getList() {
    UserAPI.getArticleList(params: {'type': 3}).then((pageData) {
      listData.addAll(pageData.rows!);
    }).catchError((error) {
      print(error);
    });
  }

  @override
  void onInit() {
    scrollController.addListener(() {
      print(scrollController.position.pixels);
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print('loading');
      }
    });
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  increment() => count.value++;
}
