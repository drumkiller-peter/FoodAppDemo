import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intern_project/configs/styles/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final IconData? suffixIcon;
  final bool obscureText;
  final String hintText;

  final Function()? onTapSuffix;
  final Function(String) validator;
  final TextInputType? keyboardType;
  final TextStyle? hintStyle;
  final bool? needBorder;
  final int? maxLines;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? fillColor;

  CustomTextFormField({
    required this.controller,
    this.suffixIcon,
    required this.validator,
    this.obscureText = true,
    required this.hintText,
    this.onTapSuffix,
    this.keyboardType,
    this.hintStyle,
    this.needBorder = true,
    this.maxLines = 1,
    this.fillColor,
    this.borderRadius,
    this.padding,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.borderRadius == null
          ? BorderRadius.circular(26.r)
          : widget.borderRadius,
      child: TextFormField(
        controller: widget.controller,
        validator: (value) => widget.validator(value!),
        style: TextStyle(
          fontFamily: "OpenSans",
          color: AppColors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.w300,
        ),
        maxLines: widget.maxLines,
        obscureText: widget.obscureText,
        cursorColor: AppColors.black,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.white,
            ),
            filled: true,
            fillColor:
                widget.fillColor == null ? Color(0xffF5F7FB) : widget.fillColor,
            hintText: widget.hintText,
            hintStyle: widget.hintStyle != null
                ? widget.hintStyle
                : TextStyle(
                    color: AppColors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: "OpenSans",
                  ),
            enabledBorder: widget.needBorder == true
                ? OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffACACAC),
                    ),
                  )
                : InputBorder.none,
            suffixIcon: widget.suffixIcon != null
                ? InkWell(
                    onTap: widget.onTapSuffix,
                    child: Icon(
                      widget.suffixIcon,
                      color: Color(0xffC1C6CC),
                      size: 15.sp,
                    ),
                  )
                : null,
            contentPadding:
                widget.padding == null ? EdgeInsets.all(25.w) : widget.padding,
            focusColor: AppColors.white,
            border: widget.needBorder == true
                ? OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffACACAC),
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                  )
                : InputBorder.none,
            focusedBorder: widget.needBorder == true
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
                      color: Color(0xffACACAC),
                    ),
                  )
                : InputBorder.none,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: Color(0xffFF6881),
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: Color(0xffFF6881),
              ),
            )),
      ),
    );
  }
}
