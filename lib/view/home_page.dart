import 'package:flutter/material.dart';
import 'package:intern_project/configs/styles/app_colors.dart';
import 'package:intern_project/configs/styles/custom_text_style.dart';
import 'package:intern_project/configs/widgets/container_for_categories_items.dart';
import 'package:intern_project/configs/widgets/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intern_project/controller/home_page_controller.dart';
import 'package:intern_project/view/categories.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageController _homePageController = HomePageController();
    return Container(
      color: Color(0xffE5E5E5),
      child: SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(
              isHomePage: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Categories",
                      style: CustomTextStyle.textStyle19_700(
                        color: AppColors.choclatyColor,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: Get.height,
                      child: FutureBuilder(
                          future: _homePageController.getAllCategories(),
                          builder: (context, AsyncSnapshot snapshot) {
                            return snapshot.hasData
                                ? GridView.builder(
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 15.w,
                                      mainAxisSpacing: 15.h,
                                    ),
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) =>
                                        _homePageController
                                                .categories.isNotEmpty
                                            ? ContainerForCategoriesItems(
                                                categoryTitle:
                                                    _homePageController
                                                            .categories[index]
                                                            .toString()
                                                            .isEmpty
                                                        ? ""
                                                        : _homePageController
                                                            .categories[index]
                                                            .toString(),
                                                imagePath: index.isEven
                                                    ? "assets/images/monitor_1.png"
                                                    : "assets/images/hamburger_1.png",
                                                containerColor: index == 0
                                                    ? Color(0xffB7F1D9)
                                                    : index == 1
                                                        ? Color(0xffFBCFCF)
                                                        : index == 2
                                                            ? Color(0xffF1EFB7)
                                                            : Color(0xffCFEBFB),
                                                imageColor: index == 0
                                                    ? Color(0xff2BCD89)
                                                    : index == 1
                                                        ? Color(0xffFF7070)
                                                        : index == 2
                                                            ? Color(0xffCDBD2B)
                                                            : Color(0xff7087FF),
                                                onTap: () {
                                                  Get.to(
                                                    () => CategoriesScreen(
                                                      categoriesResponse:
                                                          snapshot.data[index],
                                                    ),
                                                  );
                                                },
                                              )
                                            : SizedBox(),
                                  )
                                : SizedBox();
                          }),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
