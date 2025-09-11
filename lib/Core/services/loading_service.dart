import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45
    ..radius = 10
    ..maskType = EasyLoadingMaskType.black
    ..backgroundColor = Colors.black
    ..textColor = Colors.white
    ..indicatorColor = Colors.amber
    ..userInteractions = false
    ..dismissOnTap = false;
}
