import 'package:flutter_lerning_with_rest_api/app/presentation/common/splash/splash_page/splash_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splashPage, page: () => SplashPage()),

  ];
}