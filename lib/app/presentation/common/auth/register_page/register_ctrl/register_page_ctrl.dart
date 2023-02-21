import 'package:flutter/material.dart';
import 'package:flutter_lerning_with_rest_api/app/core/data/remote/remote_repo.dart';
import 'package:flutter_lerning_with_rest_api/app/core/services/controller.dart';
import 'package:flutter_lerning_with_rest_api/app/routes/app_routes.dart';
import 'package:get/get.dart';

import '../../../../../core/data/local_storage/local_storage.dart';
import '../../../../../core/data/model/register_response_model.dart';
import '../../../../../core/values/app_strings.dart';

class RegisterController extends BaseLoaderController{
  var userNameController=TextEditingController().obs;
  var userPassword=TextEditingController().obs;
  var userEmailController=TextEditingController().obs;
  var fullNameController=TextEditingController().obs;
  var registerUser=UserRegisterResponse().obs;
  ///navigate to register page
  navigateToLoginPage(){
    Get.toNamed(AppRoutes.loginPage);
  }
  ///after registered navigate to user list page
  afterRegistationNavigateToDashboard() async {
    if(validateData()){

   var userData={
    "username":userNameController.value.text.trim(),
    "password":userPassword.value.text.trim(),
    "email":userEmailController.value.text.trim(),
    "fullName":fullNameController.value.text.trim()
    };
      registerUser.value=await userRegister(userData);
      if(registerUser.value!=null){
        DataStorage.saveData(
            DataStorage.keyIsLoggedIn,registerUser.value.userProfile?.id );
        print("Success");
        Get.offNamed(AppRoutes.userList);
      }
      else{
        print("Failed to register data");
      }
    }
 update();
  }
  /// validate user input field
  validateData() {
    var name = userNameController.value.text.trim();
    var fullName= fullNameController.value.text.trim();
    var email= userEmailController.value.text.trim();
    var pass = userPassword.value.text.trim();
    if (name.isEmpty) {
      print(AppStrings.emptyUserName);
      return false;
    }
    else if (fullName.isEmpty) {
      print(AppStrings.emptyFullName);
      return false;
    }else if (email.isEmpty) {
      print(AppStrings.emptyEmail);
      return false;
    }  else if (pass.isEmpty) {
      print(AppStrings.emptyPassword);
      return false;
    } else {
      return true;
    }
  }
}