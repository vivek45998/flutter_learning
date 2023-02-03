import 'package:flutter/material.dart';
import 'package:flutter_lerning_with_rest_api/app/core/services/controller.dart';
import 'package:flutter_lerning_with_rest_api/app/routes/app_routes.dart';
import 'package:get/get.dart';

class RegisterController extends BaseLoaderController{
  var userNameController=TextEditingController().obs;
  var userPassword=TextEditingController().obs;
  var userEmailController=TextEditingController().obs;
  var fullNameController=TextEditingController().obs;
  navigateToLoginPage(){
    Get.toNamed(AppRoutes.loginPage);
  }
  afterRegistationNavigateToDashboard(){
    Get.offNamed(AppRoutes.userList);
  }
}