import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lerning_with_rest_api/app/core/themes/text_styles.dart';
import 'package:flutter_lerning_with_rest_api/app/core/values/app_colors.dart';
import 'package:flutter_lerning_with_rest_api/app/core/values/app_diemen.dart';
import 'package:flutter_lerning_with_rest_api/app/global_widgets/neumorfic_text_field.dart';
import 'package:flutter_lerning_with_rest_api/app/global_widgets/padding_widgets.dart';
import 'package:get/get.dart';

import '../../../../../core/values/app_strings.dart';
import '../../../../../global_widgets/k_button.dart';
import '../login_ctrl/login_ctrl.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  var ctrl = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorApp,
        title: Text(
          AppStrings.login,
          style: TextStyles.sfProDisplayRegular(
              AppColors.colorWhite, AppDimen.unitHeight * 10),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: AppDimen.unitHeight * 10,
              ),
              Text(
                AppStrings.appName,
                style: TextStyles.modernistBold(
                  AppColors.colorApp,
                  AppDimen.unitWidth * 30,
                ),
              ),
              SizedBox(
                height: AppDimen.unitHeight * 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    AppStrings.signupAndLoginTitleString,
                    style: TextStyles.modernistBold(
                      AppColors.colorApp,
                      AppDimen.unitWidth * 15,
                    ),
                  ),
                ),
              ),
              PaddingWidgets(
                bottom: 0,
                top: 20,
                widget: NeumorficTextField(
                  text: ctrl.userNameController.value,
                  titleName: AppStrings.titleUserName,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: AppDimen.unitHeight * 10,
              ),
              PaddingWidgets(
                bottom: 20,
                top: 0,
                widget: NeumorficTextField(
                  titleName: AppStrings.titlePassword,
                  text: ctrl.userPassword.value,
                  isObscure: true,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              PaddingWidgets(
                bottom: 20,
                top: 20,
                widget: NeumorphismButton(
                  buttonName: AppStrings.login,
                  onTap: () {
                    ctrl.loginUserToNavigateDashboard();
                    // ctrl.navigateToRegisterPage();
                  },
                ),
              ),
              SizedBox(
                height: AppDimen.unitHeight * 10,
              ),
              RichText(
                text: TextSpan(
                  text: AppStrings.doNotHaveAccount,
                  style: const TextStyle(color: AppColors.colorTextField),
                  children: <TextSpan>[
                    TextSpan(
                      text: AppStrings.register,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.colorApp),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          ctrl.navigateToRegisterPage();
                        },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
