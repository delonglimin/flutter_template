import 'package:flutter_getx_template/pages/Index/Index_view.dart';
import 'package:flutter_getx_template/pages/Index/index_binding.dart';
import 'package:flutter_getx_template/pages/login/login_binding.dart';
import 'package:flutter_getx_template/pages/login/login_view.dart';
import 'package:flutter_getx_template/pages/notfound/notfound_view.dart';
import 'package:flutter_getx_template/pages/splash/spalsh_view.dart';
import 'package:flutter_getx_template/pages/splash/splash_binding.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.Splash;

  static final routes = [
    GetPage(
      name: AppRoutes.Splash,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.Index,
      page: () => IndexPage(),
      binding: IndexBinding(),
    ),
    GetPage(
      name: AppRoutes.Login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
  ];

  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => NotfoundPage(),
  );

}
