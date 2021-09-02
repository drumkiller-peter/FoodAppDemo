import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class CustomTextStyle {
  static textStyle10_400({Color? color, bool? needOpenSans}) {
    return TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        color: color == null ? AppColors.white : color,
        fontFamily: needOpenSans == true ? "OpenSans" : "MPlusRounded");
  }

  static textStyle11_400({Color? color, bool? needOpenSans}) {
    return TextStyle(
        fontSize: 11.sp,
        fontWeight: FontWeight.w700,
        color: color == null ? AppColors.white : color,
        fontFamily: needOpenSans == true ? "OpenSans" : "MPlusRounded");
  }

  static textStyle12_600({Color? color, bool? needOpenSans}) {
    return TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        color: color == null ? AppColors.white : color,
        fontFamily: needOpenSans == true ? "OpenSans" : "MPlusRounded");
  }

  static textStyle12_700({Color? color, bool? needOpenSans}) {
    return TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        color: color == null ? AppColors.white : color,
        fontFamily: needOpenSans == true ? "OpenSans" : "MPlusRounded");
  }

  static textStyle14_700({Color? color, bool? needOpenSans}) {
    return TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: color == null ? AppColors.white : color,
        fontFamily: needOpenSans == true ? "OpenSans" : "MPlusRounded");
  }

  static textStyle15_700({Color? color, bool? needOpenSans}) {
    return TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w700,
        color: color == null ? AppColors.white : color,
        fontFamily: needOpenSans == true ? "OpenSans" : "MPlusRounded");
  }
    static textStyle18_400({Color? color, bool? needOpenSans}) {
    return TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        color: color == null ? AppColors.white : color,
        fontFamily: needOpenSans == true ? "OpenSans" : "MPlusRounded");
  }

  static textStyle18_600({Color? color, bool? needOpenSans}) {
    return TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: color == null ? AppColors.white : color,
        fontFamily: needOpenSans == true ? "OpenSans" : "MPlusRounded");
  }

  static textStyle19_700({Color? color, bool? needOpenSans}) {
    return TextStyle(
        fontSize: 19.sp,
        fontWeight: FontWeight.w700,
        color: color == null ? AppColors.white : color,
        fontFamily: needOpenSans == true ? "OpenSans" : "MPlusRounded");
  }

  static textStyle22_700({Color? color, bool? needOpenSans}) {
    return TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
        color: color == null ? AppColors.white : color,
        fontFamily: needOpenSans == true ? "OpenSans" : "MPlusRounded");
  }
}
