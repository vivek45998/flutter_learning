import 'package:flutter/material.dart';
import 'package:flutter_lerning_with_rest_api/app/core/values/app_colors.dart';

// ignore: must_be_immutable
class NeumorficTextField extends StatelessWidget {
  NeumorficTextField({Key? key, required this.text, required this.titleName,required this.isObscure})
      : super(key: key);
  TextEditingController text;
  var titleName = "fullName";
  bool isObscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: AppColors.colorGrey,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
                //color: AppColors.colorWhite,
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
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: TextField(
          controller: text,
          cursorColor: AppColors.colorApp,
          obscureText: isObscure,
          style: const TextStyle(color: AppColors.colorTextField),
          decoration: InputDecoration(
            labelText: titleName,
            labelStyle: const TextStyle(color: AppColors.colorApp),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
