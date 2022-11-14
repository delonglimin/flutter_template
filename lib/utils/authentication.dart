import 'dart:async';
import 'package:flutter_getx_template/common/values/index.dart';
import 'package:flutter_getx_template/utils/index.dart';
import 'package:get/get.dart';

/// 检查是否有 token
Future<bool> isAuthenticated() async {
  var profileJSON = LoacalStorage().getJSON(STORAGE_USER_PROFILE_KEY);
  return profileJSON != null ? true : false;
}

/// 删除缓存token
Future deleteAuthentication() async {
  await LoacalStorage().remove(STORAGE_USER_PROFILE_KEY);
}

/// 重新登录
void deleteTokenAndReLogin() async {
  await deleteAuthentication();
  Get.offAndToNamed('/login');
}
