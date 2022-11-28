import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_getx_template/utils/index.dart';

class NetworkManager {
  static ConnectivityResult networkState = ConnectivityResult.wifi;
  static listenNetworkState() async {
    networkState = await Connectivity().checkConnectivity();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      mylog(result);
      networkState = result;
    });
  }
}
