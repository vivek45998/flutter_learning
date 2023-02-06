import 'package:flutter_lerning_with_rest_api/app/core/data/local_storage/local_storage.dart';
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
    var userID = DataStorage.getData(DataStorage.keyIsLoggedIn);
    if (userID != null) {
      /// after success full login navigate to user list page.
      Get.offNamed(AppRoutes.userList);
    } else {
      /// after splash screen when user not loggedIn navigate to login page.
      Get.offAllNamed(AppRoutes.loginPage);
    }
  }
}
