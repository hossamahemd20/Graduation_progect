import 'package:flutter/material.dart';

import '../model/colors_palette/colors_palette.dart';

class ApplicationThemeManager {
  static ThemeData themeData = ThemeData(
    primaryColor: ColorsPalette.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsPalette.primaryColor,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      iconTheme: IconThemeData(size: 40, color: Colors.white),
    ),
  );
}