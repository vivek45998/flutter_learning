import 'package:flutter/material.dart';

import '../core/themes/text_styles.dart';
import '../core/values/app_colors.dart';
import '../core/values/app_diemen.dart';

class NeumorphismButton extends StatelessWidget {
  NeumorphismButton({Key? key, required this.buttonName, required this.onTap})
      : super(key: key);
  var buttonName = "Submit";
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppDimen.unitHeight * 30,
        width: AppDimen.screenWidth,
        decoration: BoxDecoration(
            color: AppColors.colorActionBlue,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                  color: AppColors.colorGreyShade600,
                  offset: Offset(4, 4),
                  blurRadius: 5,
                  spreadRadius: 1),
              BoxShadow(
                  color: AppColors.colorWhite,
                  offset: Offset(-5, -5),
                  blurRadius: 5,
                  spreadRadius: 1),
            ]),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              buttonName,
              style: TextStyles.modernistBold(
                AppColors.colorWhite,
                AppDimen.unitWidth * 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
