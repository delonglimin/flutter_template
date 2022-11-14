import 'package:flutter_getx_template/model/article_model.dart';
import 'package:flutter_getx_template/router/app_pages.dart';
import 'package:flutter_getx_template/services/user.dart';
import 'package:flutter_getx_template/utils/common_util.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final count = 0.obs;

  void doLogin() {
    showLoading('loading...');
    Future.delayed(Duration(seconds: 2)).then((value) {
      hideLoading();
      showToast('success');
      Get.toNamed(AppRoutes.Index);
    });
  }

  void getList() {
    showLoading('loading...');
    UserAPI.getArticleList(params: {'type': 3}).then((value) {
      List<ArticleModel>? l = value.rows?.map((item) {
        return ArticleModel.fromMap(item);
      }).toList();
      print(l);
    }).whenComplete(() => hideLoading());
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  increment() => count.value++;
}


 
