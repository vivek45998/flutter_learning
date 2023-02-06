import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PaddingWidgets extends StatelessWidget {
  PaddingWidgets(
      {Key? key, required this.bottom, required this.top, required this.widget})
      : super(key: key);
  var bottom = 8.0;
  var top = 8.0;
  Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 20.0, right: 20.0, bottom: bottom, top: top),
      child: widget,
    );
  }
}
