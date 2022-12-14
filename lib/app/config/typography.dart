import 'package:ayopay_assessment/app/config/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dimens.dart';

class AppTypography {
  static TextStyle poppins = GoogleFonts.poppins();

  // Title / Large / Bold
  static TextStyle get title1 => poppins.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: AppDimens.s20,
      color: AppColor.colorBlack40);

  // Title / Medium / Semibold
  static TextStyle get title2 => poppins.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: AppDimens.s18,
      color: AppColor.colorBlack40);

  // Title / Small / Semibold
  static TextStyle get title3 => poppins.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: AppDimens.s16,
      color: AppColor.colorBlack40);

  // Title / Small / Extrabold
  static TextStyle get title4 => poppins.copyWith(
      fontWeight: FontWeight.w800,
      fontSize: AppDimens.s16,
      color: AppColor.colorBlack40);

  // Body / Medium / Semibold
  static TextStyle get body1 => poppins.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: AppDimens.s16,
      color: AppColor.colorBlack40);

  // Body / Medium / Regular
  static TextStyle get body2 => poppins.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: AppDimens.s16,
      color: AppColor.colorBlack40);

  // Body / Small / Bold
  static TextStyle get body3 => poppins.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: AppDimens.s14,
      color: AppColor.colorBlack40);

  // Body / Small / Semibold
  static TextStyle get body4 => poppins.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: AppDimens.s14,
      color: AppColor.colorBlack40);

  // Body / Small / Regular
  static TextStyle get body5 => poppins.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: AppDimens.s14,
      color: AppColor.colorBlack40);

  // Body / Small / Light
  static TextStyle get body6 => poppins.copyWith(
      fontWeight: FontWeight.w300,
      fontSize: AppDimens.s14,
      color: AppColor.colorBlack40);

  // Caption / Medium / Bold
  static TextStyle get caption1 => poppins.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: AppDimens.s12,
      color: AppColor.colorBlack40);

  // Caption / Medium / Semibold
  static TextStyle get caption2 => poppins.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: AppDimens.s12,
      color: AppColor.colorBlack40);

  // Caption / Medium / Regular
  static TextStyle get caption3 => poppins.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: AppDimens.s12,
      color: AppColor.colorBlack40);

  // Caption / Medium / Light
  static TextStyle get caption4 => poppins.copyWith(
      fontWeight: FontWeight.w300,
      fontSize: AppDimens.s12,
      color: AppColor.colorBlack40);

  // Caption / Small / Bold
  static TextStyle get caption5 => poppins.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: AppDimens.s10,
      color: AppColor.colorBlack40);

  // Caption / Small / Semibold
  static TextStyle get caption6 => poppins.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: AppDimens.s10,
      color: AppColor.colorBlack40);

  // Caption / Small / Regular
  static TextStyle get caption7 => poppins.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: AppDimens.s10,
      color: AppColor.colorBlack40);
}
