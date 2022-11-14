import 'package:flutter_easyloading/flutter_easyloading.dart';

void showToast(String title) {
  EasyLoading.showToast(title);
}
void showLoading(String title) {
  EasyLoading.show(status: title);
}
void hideLoading() {
  EasyLoading.dismiss();
}
