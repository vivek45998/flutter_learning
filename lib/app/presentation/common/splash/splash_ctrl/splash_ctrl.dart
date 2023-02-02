import 'package:flutter_lerning_with_rest_api/app/routes/app_routes.dart';
import 'package:get/get.dart';

import '../../../../core/services/controller.dart';

class SplashController extends BaseLoaderController {
  @override
  initializeData() {
    Future.delayed(const Duration(seconds: 3), navigateToNext);
    super.initializeData();
  }

  navigateToNext() {
    Get.toNamed(AppRoutes.userList);
  }
}
