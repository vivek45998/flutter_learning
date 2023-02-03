import 'package:flutter/cupertino.dart';
import 'package:flutter_lerning_with_rest_api/app/core/data/local_storage/local_storage.dart';
import 'package:flutter_lerning_with_rest_api/app/core/data/remote/remote_repo.dart';
import 'package:flutter_lerning_with_rest_api/app/core/services/controller.dart';
import 'package:flutter_lerning_with_rest_api/app/routes/app_routes.dart';
import 'package:get/get.dart';

import '../../../../core/data/model/user_list_model.dart';

class UserListCtrl extends BaseLoaderController{
  var userListDetail=UserList().obs;
  var userList=<UserList>[].obs;
  var fullNameController=TextEditingController().obs;
  var emailController=TextEditingController().obs;
  var username=TextEditingController().obs;
  var editData=TextEditingController().obs;
  // @override
  // initializeData() {
  //   getUserDetail();
  //  super.initializeData();
  // }
  @override
  onInit()async {
    getUserDetail();
    super.onInit();
  }
  getUserDetail() async {
    userList.clear();
  var data= await getUserDetailWithAuthToken();

  print(data);
  userList.addAll(data);
  print("userList===========$userList");
  userList.refresh();
  update();
  }
  logOut(){
    DataStorage.removeStorage(DataStorage.keyIsLoggedIn);
    Get.offAllNamed(AppRoutes.loginPage);
  }
  updateUserList(UserList? data) async {
    print("==========update user list=====");
    var userData={
      "username": data?.username??'',

      "fullName":"dev",
      "email":"dev@gmail.com"

    };
    // user.value=data;
    userListDetail.value=await updateUserData(data);
    if(userListDetail.value!=null){
      await  getUserDetail();
      Get.back();
    }
  }
}