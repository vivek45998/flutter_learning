import 'package:flutter/cupertino.dart';
import 'package:flutter_lerning_with_rest_api/app/core/data/remote/remote_repo.dart';
import 'package:flutter_lerning_with_rest_api/app/core/services/controller.dart';
import 'package:flutter_lerning_with_rest_api/app/presentation/user/user_list/ctrl/user_list_ctrl.dart';
import 'package:get/get.dart';

import '../../../../core/data/model/user_list_model.dart';

class UpdateController extends BaseLoaderController {
  var fullNameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var username = TextEditingController().obs;
  var userListDetail = UserData().obs;
  var id =TextEditingController().obs;
  var password=TextEditingController().obs;



  @override
  onInit() async {
    super.onInit();
    var data = await Get.arguments;
    fullNameController.value.text = data?.fullName ?? "";
    emailController.value.text = data?.email ?? "";
    username.value.text = data?.username ?? "";
    id.value.text=data.id??"";
    password.value.text=data.password??"";
    update();
  }

  updateUserList() async {
    print("==========update user list=====");

    var userData = {
      "username":username.value.text.trim().toString(),
      "fullName":  fullNameController.value.text ?? '',
      "password":password.value.text,
      "id":id.value.text.trim().toString()
    };
    // user.value=data;
    userListDetail.value = await updateUserData(userData);
    if (userListDetail.value != null) {
      var ctrl = Get.isRegistered<UserListCtrl>()
          ? Get.find<UserListCtrl>()
          : Get.put(UserListCtrl(), permanent: true);
      await ctrl.getUserDetail();
      Get.back();
    }
    update();
  }


}
