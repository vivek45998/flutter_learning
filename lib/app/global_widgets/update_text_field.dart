import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/data/model/user_list_model.dart';
import '../presentation/user/user_list/ctrl/user_list_ctrl.dart';

class UpdateTextFieldWidget extends StatelessWidget {
  UpdateTextFieldWidget(
      {Key? key, this.nameController, this.isEnable, this.data})
      : super(key: key);
  TextEditingController? nameController;
  UserData? data;
  bool? isEnable = false;
  var ctrl = Get.put(UserListCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextField(
          controller: nameController,
          enabled: isEnable,
          onChanged: (value){
            ctrl.editData.value.text=value;
            data?.fullName=ctrl.editData.value.text;
            // ctrl.updateUserList(data);
          },
        ),
      ),
    );
  }
}