import 'package:flutter/cupertino.dart';
import 'package:flutter_lerning_with_rest_api/app/core/data/local_storage/local_storage.dart';
import 'package:flutter_lerning_with_rest_api/app/core/data/remote/remote_repo.dart';
import 'package:flutter_lerning_with_rest_api/app/core/services/controller.dart';
import 'package:flutter_lerning_with_rest_api/app/routes/app_routes.dart';
import 'package:get/get.dart';

import '../../../../core/data/model/user_data.dart';

class LoginController extends BaseLoaderController {
  var userNameController = TextEditingController().obs;
  var userPassword = TextEditingController().obs;
  var data = UserData().obs;

  navigateToRegisterPage() {
    Get.toNamed(AppRoutes.registerPage);
  }

  loginUserToNavigateDashboard() async {
    var name = userNameController.value.text.trim();
    var pass = userPassword.value.text.trim();
    var mapData={
      "username":name,
      "password":pass
    };
    if (validateData()) {
      data.value =await userLogin(userData: mapData);
      Get.offNamed(AppRoutes.userList);
      DataStorage.saveData(DataStorage.keyIsLoggedIn, data.value.data?.id);
      DataStorage.saveData(DataStorage.tokenId, data.value.data?.token);
      print("${data.value.message}");
    }

    update();
  }

  validateData() {
    var name = userNameController.value.text.trim();
    var pass = userPassword.value.text.trim();
    if (name.isEmpty) {
      print("Please enter valid username.");
      return false;
    } else if (pass.isEmpty) {
      print("Please enter valid password");
      return false;
    } else {
      return true;
    }
  }
}
