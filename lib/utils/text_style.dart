import 'package:flutter/material.dart';

import 'font_family.dart';

class AppTextStyle {
  static TextStyle splashTextStyle =
      TextStyle(fontSize: 30.0, fontFamily: FontFamily.trainOneFontFamily);
  static TextStyle iFoodTextStyle = TextStyle(
      fontSize: 30,
      color: Colors.white,
      fontFamily: FontFamily.kiwimaruFontFamily);
  static TextStyle authLoginAndRegister = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: FontFamily.kiwimaruFontFamily);
  static TextStyle textFieldHintTextStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Colors.grey,
      fontFamily: FontFamily.kiwimaruFontFamily);
  static TextStyle textFieldTextStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Colors.black,
      fontFamily: FontFamily.kiwimaruFontFamily);

  static TextStyle drawerTextStyle =
      TextStyle(fontFamily: FontFamily.kiwimaruFontFamily);
}
