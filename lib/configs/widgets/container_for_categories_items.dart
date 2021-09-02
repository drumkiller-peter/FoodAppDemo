import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:intern_project/configs/styles/custom_text_style.dart';

class ContainerForCategoriesItems extends StatelessWidget {
  const ContainerForCategoriesItems({
    Key? key,
    required this.categoryTitle,
    required this.imagePath,
    required this.containerColor,
    required this.imageColor,
    this.onTap,
  }) : super(key: key);

  final String imagePath;
  final String categoryTitle;
  final Color containerColor;
  final Color imageColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 155.h,
        width: 153.w,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(21.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 48.h,
              backgroundColor: Color(0xffECFBF5),
              child: Image.asset(
                imagePath,
                color: imageColor,
                height: 50.h,
                width: 42.w,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              categoryTitle,
              style: CustomTextStyle.textStyle14_700(color: imageColor),
            )
          ],
        ),
      ),
    );
  }
}
