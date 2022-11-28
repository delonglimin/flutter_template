import 'dart:io';

import 'package:flutter_getx_template/utils/index.dart';
import 'package:flutter_xupdate/flutter_xupdate.dart';

class UpdateManager {
  // static String _updateUrl = SERVER_API_URL + '/jobCard/getJobDetail?id=3';
  static String _updateUrl =
      'https://mock.apifox.cn/m1/1999165-0-default/upgrade';

  ///初始化
  static checkUpdate() {
    if (Platform.isAndroid) {
      FlutterXUpdate.init(
              debug: true,
              isPost: false,
              isPostJson: false,
              timeout: 25000,
              isWifiOnly: false,
              isAutoMode: false,
              supportSilentInstall: false,
              enableRetry: false)
          .then((value) {
        FlutterXUpdate.checkUpdate(url: _updateUrl);
      }).catchError((error) {
        print(error);
      });

      FlutterXUpdate.setErrorHandler(
          onUpdateError: (Map<String, dynamic>? message) async {
        mylog(message);
      });
    } else {
      print('ios 需在appstore');
    }
  }
}
