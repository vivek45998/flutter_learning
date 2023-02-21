import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_lerning_with_rest_api/app/core/data/local_storage/local_storage.dart';
import 'package:flutter_lerning_with_rest_api/app/core/data/remote/remote_repo.dart';
import 'package:flutter_lerning_with_rest_api/app/core/services/controller.dart';
import 'package:flutter_lerning_with_rest_api/app/routes/app_routes.dart';
import 'package:get/get.dart';

import '../../../../core/data/model/user_list_model.dart';

class UserListCtrl extends BaseLoaderController {
  var userListDetail = UserData().obs;
  var userList = <UserData>[].obs;
  var fullNameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var username = TextEditingController().obs;
  var editData = TextEditingController().obs;


  @override
  onInit() async {
    getUserDetail();
    super.onInit();
  }

  /// get user list
  getUserDetail() async {
    userList.clear();
    var data = await getUserDetailWithAuthToken();
    print(data);
    userList.addAll(data);
    print("userList===========$userList");
    userList.refresh();
    update();
  }

  ///log out user
  logOut() {
    DataStorage.removeStorage(DataStorage.keyIsLoggedIn);
    Get.offAllNamed(AppRoutes.loginPage);
  }

  ///update user data after that back on userList page
  updateUserList(UserData? data) async {
    print("==========update user list=====");
    var userData = {
      "username": data?.username ?? '',
      "fullName": "dev",
      "email": "dev@gmail.com"
    };
    // user.value=data;
    userListDetail.value = await updateUserData(userData);
    if (userListDetail.value != null) {
      await getUserDetail();
      Get.back();
    }
  }
  navigateToUpadteUserListPage(UserData data){
    Get.toNamed(AppRoutes.updateUser,arguments: data);
  }
  deleteUserFromList(UserData userData) async {
    showLoader(true);
    var data=await deleteUser(userData);
    if(data!=null){
      if (kDebugMode) {
        print(data);
      }
      if (kDebugMode) {
        print("deleted user data Successfully");
      }
      getUserDetail();
      showLoader(false);
    }
    else{
      if (kDebugMode) {
        print("failed to delete user data from db..");
      }
      showLoader(false);
    }
  }

}
