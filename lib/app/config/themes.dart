import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'color.dart';

import 'typography.dart';

class AppThemes {
  static ThemeData get lightThemeData {
    return ThemeData(
      primaryColor: AppColor.colorPrimary,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColor.colorBackground,
      bottomAppBarColor: AppColor.colorBlack,
      appBarTheme: const AppBarTheme(
        color: AppColor.colorWhite,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppColor.colorRed2A, //change your color here
        ),
      ),
      canvasColor: AppColor.colorWhite,
      cardTheme: const CardTheme(color: AppColor.colorWhite),
      colorScheme: ColorScheme.fromSwatch().copyWith(
          brightness: Brightness.light,
          primary: AppColor.colorPrimary,
          onPrimary: AppColor.colorWhite,
          secondary: AppColor.colorPrimary),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: AppColor.colorPrimary,
          minimumSize: const Size(115, 49),
          padding: const EdgeInsets.all(13),
          textStyle: AppTypography.body3.copyWith(color: AppColor.colorWhite),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          primary: AppColor.colorPrimary,
          minimumSize: const Size(115, 49),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          textStyle: AppTypography.body3.copyWith(color: AppColor.colorPrimary),
          side: const BorderSide(color: AppColor.colorPrimary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
