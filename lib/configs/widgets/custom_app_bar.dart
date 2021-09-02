import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intern_project/configs/styles/app_colors.dart';
import 'package:intern_project/configs/styles/custom_text_style.dart';
import 'package:intern_project/configs/widgets/custom_text_form_field.dart';
import 'package:intern_project/controller/home_page_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar(
      {Key? key, this.needleading, this.isHomePage, this.titleText})
      : super(key: key);

  final bool? needleading;
  final bool? isHomePage;
  final String? titleText;
  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size.fromHeight(170.h);

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    HomePageController _homePageController = HomePageController();

    return ClipRRect(
      borderRadius: BorderRadius.circular(34.r),
      child: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.5.h,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          height: 170.h,
          padding: EdgeInsets.fromLTRB(14.w, 24.h, 14.w, 0),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(34.r),
          ),
          child: isHomePage == true
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        Stack(
                          children: [
                            Icon(
                              Icons.notifications_outlined,
                              color: AppColors.white,
                              size: 20.h,
                            ),
                            Positioned(
                              left: 10,
                              // bottom: 7,
                              child: CircleAvatar(
                                radius: 5.r,
                                backgroundColor: AppColors.green,
                                child: Text(
                                  "",
                                  style: CustomTextStyle.textStyle10_400(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    FutureBuilder(
                        future: _homePageController.getUserDetails(),
                        builder: (context, AsyncSnapshot snapshot) {
                          return snapshot.hasData
                              ? Text(
                                  "Hi, ${snapshot.data.toString()}",
                                  style: CustomTextStyle.textStyle18_600(
                                    needOpenSans: true,
                                  ),
                                )
                              : SizedBox();
                        }),
                    // SizedBox(
                    //   height: 3.h,
                    // ),
                    Text(
                      "Welcome Back !!!",
                      style: CustomTextStyle.textStyle22_700(),
                    ),
                    Spacer(),
                    CustomTextFormField(
                      validator: (value) {},
                      controller: _searchController,
                      needBorder: false,
                      fillColor: Color(0xffFEBA88),
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      obscureText: false,
                      hintText: "What bookmarks are you searching for ?",
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_ios,
                                color: AppColors.white)),
                        Spacer(),
                        Text(titleText ?? "",
                            style: CustomTextStyle.textStyle22_700()),
                        Spacer(),
                        Stack(
                          children: [
                            Icon(
                              Icons.notifications_outlined,
                              color: AppColors.white,
                              size: 20.h,
                            ),
                            Positioned(
                              left: 10,
                              // bottom: 7,
                              child: CircleAvatar(
                                radius: 5.r,
                                backgroundColor: AppColors.green,
                                child: Text(
                                  "",
                                  style: CustomTextStyle.textStyle10_400(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    CustomTextFormField(
                      validator: (value) {},
                      controller: _searchController,
                      needBorder: false,
                      fillColor: Color(0xffFEBA88),
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      obscureText: false,
                      hintText: "What bookmarks are you searching for ?",
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                ),
        ),
        leading: needleading == true
            ? IconButton(
                icon: Icon(Icons.arrow_back_ios, color: AppColors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : null,
      ),
    );
  }
}
