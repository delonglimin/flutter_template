import 'package:jpush_flutter/jpush_flutter.dart';

class PushManager {
  static setup() {
    JPush jpush = new JPush();
    jpush.addEventHandler(
      // 接收通知回调方法。
      onReceiveNotification: (Map<String, dynamic> message) async {
        print("flutter onReceiveNotification: $message");
      },
      // 点击通知回调方法。
      onOpenNotification: (Map<String, dynamic> message) async {
        print("flutter onOpenNotification: $message");
      },
      // 接收自定义消息回调方法。
      onReceiveMessage: (Map<String, dynamic> message) async {
        print("flutter onReceiveMessage: $message");
      },
    );
    jpush.setup(
      appKey: "5d833dcabc9466450a6e800d",
      production: false,
      debug: false, // 设置是否打印 debug 日志
    );
  }
}
