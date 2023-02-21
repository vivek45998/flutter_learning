import 'package:flutter/material.dart';
import 'package:flutter_lerning_with_rest_api/app/core/values/app_colors.dart';
import 'package:flutter_lerning_with_rest_api/app/core/values/app_diemen.dart';
import 'package:flutter_lerning_with_rest_api/app/core/values/app_strings.dart';
import 'package:flutter_lerning_with_rest_api/app/presentation/user/user_list/ctrl/user_list_ctrl.dart';
import 'package:get/get.dart';

import '../../../../global_widgets/update_text_field.dart';

// ignore: must_be_immutable
class UserListPage extends StatelessWidget {
  UserListPage({Key? key}) : super(key: key);
  var ctrl = Get.put(UserListCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorApp,
        title: const Text(AppStrings.userList),
        actions: [
          InkWell(
            onTap: () {
              ctrl.logOut();
            },
            child: const Icon(
              Icons.logout,
              color: AppColors.colorWhite,
            ),
          )
        ],
      ),
      body: Obx(() {
        if (ctrl.isLoading.value) {
          return const CircularProgressIndicator();
        } else {
          return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, index) {
              var data = ctrl.userList[index];
              return Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.cyanAccent,
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 6.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          UpdateTextFieldWidget(
                            nameController: ctrl.editData.value,
                            isEnable: true,
                            key: UniqueKey(),
                          );
                        },
                        child: Text(
                          data.fullName.toString(),
                          style: const TextStyle(
                              color: Colors.red,
                              height: 2,
                              fontWeight: FontWeight.w900),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        width: AppDimen.unitHeight * 90,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            ctrl.editData.value.text = data.username!;
                            ctrl.navigateToUpadteUserListPage(data);
                          },
                          child: const Icon(Icons.edit),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            ctrl.deleteUserFromList(data);
                          },
                          child: const Icon(Icons.delete),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: ctrl.userList.length,
          );
        }
      }),
    );
    return GetX(builder: (_ctrl) {});
  }
}
