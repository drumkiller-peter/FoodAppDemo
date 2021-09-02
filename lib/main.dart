import 'package:flutter/material.dart';
import 'package:intern_project/configs/styles/app_colors.dart';
import 'package:intern_project/view/home_page.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: AppColors.scaffoldColor,
        ),
        home: HomePage(),
      ),
    );
  }
}
