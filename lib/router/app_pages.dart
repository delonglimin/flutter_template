import 'package:flutter_getx_template/pages/Index/Index_view.dart';
import 'package:flutter_getx_template/pages/Index/index_binding.dart';
import 'package:flutter_getx_template/pages/test/test_binding.dart';
import 'package:flutter_getx_template/pages/test/test_view.dart';
import 'package:flutter_getx_template/pages/notfound/notfound_view.dart';
import 'package:flutter_getx_template/pages/splash/spalsh_view.dart';
import 'package:flutter_getx_template/pages/splash/splash_binding.dart';
import 'package:flutter_getx_template/pages/work/worklist_binding.dart';
import 'package:flutter_getx_template/pages/work/worklist_view.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.Worklist;

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
      name: AppRoutes.Test,
      page: () => TestPage(),
      binding: TestBinding(),
    ),
    GetPage(
      name: AppRoutes.Worklist,
      page: () => WorklistPage(),
      binding: WorklistBinding(),
    ),
  ];

  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => NotfoundPage(),
  );
}
