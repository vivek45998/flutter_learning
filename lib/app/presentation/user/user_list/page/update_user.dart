import 'package:flutter/material.dart';
import 'package:flutter_lerning_with_rest_api/app/core/values/app_colors.dart';
import 'package:flutter_lerning_with_rest_api/app/core/values/app_strings.dart';
import 'package:get/get.dart';

import '../../../../core/data/model/user_list_model.dart';
import '../../../../global_widgets/k_text_widget.dart';
import '../ctrl/user_list_ctrl.dart';

// ignore: must_be_immutable
class UpdateUser extends StatefulWidget {
  UpdateUser({Key? key, this.isEnable, this.data}) : super(key: key);

  UserData? data;
  bool? isEnable = false;

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  var ctrl = Get.put(UserListCtrl());

  @override
  void initState() {
    ctrl.fullNameController.value.text = widget.data?.fullName ?? "";
    ctrl.emailController.value.text = widget.data?.email ?? "";

    ctrl.username.value.text = widget.data?.username ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text(
          AppStrings.appBarUpdateUserTitle,
        ),
        backgroundColor: AppColors.colorApp,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KTextWidget(
                nameController: ctrl.fullNameController.value,
                fullName: AppStrings.titlePassword,
                isObsecure: true,
              ),
              KTextWidget(
                nameController: ctrl.emailController.value,
                fullName: AppStrings.titleEmail,
                isObsecure: false,
              ),
              KTextWidget(
                nameController: ctrl.username.value,
                fullName: AppStrings.titleUserName,
                isObsecure: false,
              ),
              InkWell(
                onTap: () {
                  widget.data?.fullName = ctrl.fullNameController.value.text;

                  widget.data?.username = ctrl.emailController.value.text;
                  ctrl.updateUserList(widget.data);
                },
                child: const Center(
                  child: Text(AppStrings.update),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
