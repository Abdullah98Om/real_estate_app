import 'package:flutter/material.dart';

import '../utils/constant.dart';
import '../utils/myStyle.dart';

AppBar Myappbar({required String title, Widget? icon}) {
  return AppBar(
    backgroundColor: myPrimaryColor,
    leading: icon,
    title: Text(title, style: AppStyles.h1()),
    centerTitle: true,
  );
}
