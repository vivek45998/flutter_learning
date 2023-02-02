import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle italianaRegular(color, fontSize) {
    return GoogleFonts.aclonica(
      textStyle: Theme.of(Get.context!).textTheme.headline4,
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle sfProDisplayRegular(
      Color color,
      double fontSize, {
        decoration = TextDecoration.none,
      }) {
    return TextStyle(
      fontFamily: 'SfProDisplay',
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: color,
      decoration: decoration,
    );
  }

  static TextStyle modernistRegular(
      Color color,
      double fontSize, {
        decoration = TextDecoration.none,
      }) {
    return TextStyle(
      fontFamily: 'Sk-Modernist',
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: color,
      decoration: decoration,
    );
  }

  static TextStyle modernistBold(
      Color color,
      double fontSize, {
        decoration = TextDecoration.none,
      }) {
    return TextStyle(
      fontFamily: 'Sk-Modernist',
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: color,
      decoration: decoration,
    );
  }
}