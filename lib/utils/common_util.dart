import 'package:flutter_easyloading/flutter_easyloading.dart';

void showToast(String title) {
  EasyLoading.showToast(title);
}
void showLoading({String title = 'loading'}) {
  EasyLoading.show(status: title);
}
void hideLoading() {
  EasyLoading.dismiss();
}
void mylog(Object? info){
  print('s======================================');
  print(info);
  print('======================================e');
}
