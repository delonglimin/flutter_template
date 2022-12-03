import 'package:flutter/material.dart';
import 'package:flutter_getx_template/common/values/index.dart';
import 'package:flutter_getx_template/utils/index.dart';
import 'package:flutter_getx_template/utils/network_manager.dart';

import 'utils/push_manager.dart';
import 'package:get/get.dart';

/// 全局配置
class Global {
  /// 用户配置

  /// 是否第一次打开
  static bool isFirstOpen = false;

  /// 是否 release
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  /// init
  static Future init() async {
    // 运行初始
    WidgetsFlutterBinding.ensureInitialized();

    // Ruquest 模块初始化
    Request();
    // 本地存储初始化
    await LoacalStorage.init();
    // 推送服务
    await PushManager.setup();

    // 网络监听
    NetworkManager.listenNetworkState();

    isFirstOpen = !LoacalStorage().getBool(STORAGE_DEVICE_ALREADY_OPEN_KEY);
    if (isFirstOpen) {
      LoacalStorage().setBool(STORAGE_DEVICE_ALREADY_OPEN_KEY, true);
    }
  }
}
