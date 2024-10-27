import 'package:flutter/material.dart';

import '../utils/constant.dart';

Widget loader({Color? color}) {
  return Center(
      child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color ?? myPrimaryColor)));
}
