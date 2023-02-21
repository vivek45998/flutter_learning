import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_lerning_with_rest_api/app/core/data/local_storage/local_storage.dart';
import 'package:flutter_lerning_with_rest_api/app/core/data/remote/remote_repo.dart';
import 'package:flutter_lerning_with_rest_api/app/core/services/controller.dart';
import 'package:flutter_lerning_with_rest_api/app/core/values/app_strings.dart';
import 'package:flutter_lerning_with_rest_api/app/routes/app_routes.dart';
import 'package:get/get.dart';

import '../../../../../core/data/model/user_data.dart';

class LoginController extends BaseLoaderController {
  var userNameController = TextEditingController().obs;
  var userPassword = TextEditingController().obs;
  var userData = UserDataInfo().obs;

  ///navigate to register page
  navigateToRegisterPage() {
    Get.toNamed(AppRoutes.registerPage);
  }

  ///login user and get user data from database using restApi
  loginUserToNavigateDashboard() async {
    var name = userNameController.value.text.trim();
    var pass = userPassword.value.text.trim();
    var mapData = {"username": name, "password": pass};
    if (validateData()) {
      userData.value = await userLogin(userData: mapData);
      Get.offNamed(AppRoutes.userList);
      DataStorage.saveData(
          DataStorage.keyIsLoggedIn, userData.value.userProfile?.id);
      DataStorage.saveData(
          DataStorage.tokenId, userData.value.userProfile?.token);
      DataStorage.saveData(DataStorage.passwordKey, userData.value.userProfile?.password);
      if (kDebugMode) {
        print("${userData.value.message}");
      }
    }

    update();
  }

  /// validate user input field
  validateData() {
    var name = userNameController.value.text.trim();
    var pass = userPassword.value.text.trim();
    if (name.isEmpty) {
      print(AppStrings.emptyUserName);
      return false;
    } else if (pass.isEmpty) {
      print(AppStrings.emptyPassword);
      return false;
    } else {
      return true;
    }
  }
}
