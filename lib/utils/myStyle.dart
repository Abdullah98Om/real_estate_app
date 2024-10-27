import 'package:flutter/material.dart';

class AppStyles {
  static TextStyle h1({Color textColor = Colors.white}) =>
      TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: textColor);

  static TextStyle h2({Color textColor = Colors.white}) =>
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor);

  static TextStyle h3({Color textColor = Colors.white}) =>
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textColor);

  static TextStyle h4({Color textColor = Colors.white}) =>
      TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: textColor);
}
