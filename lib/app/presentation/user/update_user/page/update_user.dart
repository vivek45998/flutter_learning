import 'package:flutter/material.dart';
import 'package:flutter_lerning_with_rest_api/app/core/values/app_colors.dart';
import 'package:flutter_lerning_with_rest_api/app/core/values/app_strings.dart';
import 'package:get/get.dart';
import '../../../../core/data/model/user_list_model.dart';
import '../../../../global_widgets/k_text_widget.dart';
import '../../user_list/ctrl/user_list_ctrl.dart';
import '../ctrl/update_user_ctrl.dart';

// ignore: must_be_immutable
class UpdateUser extends StatelessWidget {
  UpdateUser({Key? key, this.isEnable, this.data}) : super(key: key);

  UserData? data;
  bool? isEnable = false;

  var ctrl = Get.put(UpdateController());

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
                nameController: ctrl.username.value,
                fullName: AppStrings.titleUserName,
                isObsecure: false,
              ),
              KTextWidget(
                nameController: ctrl.fullNameController.value,
                fullName: AppStrings.titleFullName,
                isObsecure: true,
              ),

              KTextWidget(
                nameController: ctrl.emailController.value,
                fullName: AppStrings.titleEmail,
                isObsecure: false,
              ),

              InkWell(
                onTap: () {
                  data?.fullName = ctrl.fullNameController.value.text;

                  data?.username = ctrl.emailController.value.text;
                  ctrl.updateUserList();
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
