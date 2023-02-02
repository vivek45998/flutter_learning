import 'package:flutter/material.dart';
import 'package:flutter_lerning_with_rest_api/app/core/themes/text_styles.dart';
import 'package:get/get.dart';

import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_diemen.dart';
import '../../../../core/values/app_strings.dart';
import '../splash_ctrl/splash_ctrl.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final ctrl = Get.put(SplashController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorActionBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              AppStrings.appName,
              style: TextStyles.modernistBold(
                AppColors.colorWhite,
                AppDimen.unitWidth * 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}