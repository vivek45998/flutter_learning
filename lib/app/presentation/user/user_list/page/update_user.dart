import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/data/model/user_list_model.dart';
import '../../../../global_widgets/k_text_widget.dart';
import '../ctrl/user_list_ctrl.dart';

class UpdateUser extends StatefulWidget {
  UpdateUser({Key? key, this.isEnable, this.data}) : super(key: key);

  UserList? data;
  bool? isEnable = false;

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  var ctrl = Get.put(UserListCtrl());

  @override
  void initState() {
    ctrl.fullNameController.value.text = widget.data?.fullName?? "";
    ctrl.emailController.value.text = widget.data?.email ?? "";

    ctrl.username.value.text = widget.data?.username?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update user"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KTextWidget(
                nameController: ctrl.fullNameController.value,
                fullName: "user_name",
              ),
              KTextWidget(
                nameController: ctrl.emailController.value,
                fullName: "student_email",
              ),
              KTextWidget(
                nameController: ctrl.username.value,
                fullName: "student_roll_number",
              ),

              InkWell(
                onTap: () {
                  widget.data?.fullName= ctrl.fullNameController.value.text;

                  widget.data?.username = ctrl.emailController.value.text;
                  //ctrl.updateUserList(widget.data);
                },
                child: const Center(child: Text("Update")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}