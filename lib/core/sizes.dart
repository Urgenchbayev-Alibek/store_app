import 'package:flutter/material.dart';

class AppSizes {
  static late double wRatio;
  static late double hRatio;
  static late double padding24;
  static late double padding25;

  static void init(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    wRatio = size.width / 390;
    hRatio = size.height / 844;
    padding24 = 24 * wRatio;
    padding25 = 25 * wRatio;
  }
}
