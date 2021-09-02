import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intern_project/configs/styles/app_colors.dart';
import 'package:intern_project/configs/styles/custom_text_style.dart';
import 'package:intern_project/configs/widgets/custom_app_bar.dart';
import 'package:intern_project/controller/categories_controller.dart';
import 'package:get/get.dart';
import 'package:intern_project/network/response/categories_response.dart';
import 'package:intern_project/network/response/item_response.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    Key? key,
    this.totalBookmarked,
    required this.categoriesResponse,
  }) : super(key: key);

  final String? totalBookmarked;
  final CategoriesResponse categoriesResponse;
  @override
  Widget build(BuildContext context) {
    CategoriesController _categoriesController = CategoriesController();

    return Container(
      color: AppColors.safeAreaColor,
      child: SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            needleading: false,
            isHomePage: false,
            titleText: categoriesResponse.category.toString(),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Labels",
                    style: CustomTextStyle.textStyle19_700(
                      color: AppColors.choclatyColor,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 30.h,
                    child: FutureBuilder(
                      future: _categoriesController
                          .getLabels(categoriesResponse.id.toString()),
                      builder: (context, AsyncSnapshot snapshot) {
                        return snapshot.hasData
                            ? SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.h, vertical: 0.h),
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        color: AppColors.primaryColor,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.add,
                                          color: AppColors.white,
                                          size: 15.h,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.h, vertical: 5.h),
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        color: AppColors.primaryColor,
                                      ),
                                      child: Text(
                                        "All",
                                        style:
                                            CustomTextStyle.textStyle12_700(),
                                      ),
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, index) =>
                                          Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.h, vertical: 5.h),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5.w),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                          color: AppColors.primaryColor,
                                        ),
                                        child: Text(
                                          snapshot.data[index].name.toString(),
                                          style:
                                              CustomTextStyle.textStyle12_700(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : CircularProgressIndicator();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Bookmarks",
                        style: CustomTextStyle.textStyle19_700(
                          color: AppColors.choclatyColor,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          "assets/images/fluent_arrow_swap.png",
                          color: AppColors.primaryColor,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.bookmark_outline,
                        color: AppColors.unselectedColor,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        categoriesResponse.totalBookmarked.toString(),
                        style: CustomTextStyle.textStyle11_400(
                          color: Color(0xffFF903F),
                          needOpenSans: true,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return FutureBuilder(
                        future: _categoriesController
                            .getItems(categoriesResponse.id.toString()),
                        builder: (context, AsyncSnapshot snapshot) {
                          return snapshot.hasData
                              ? snapshot.data.length > 0
                                  ? ListView.builder(
                                      itemCount: snapshot.data.length,
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return CategoriesItems(
                                          itemsResponse: snapshot.data[index],
                                          onTapDelete: () async {
                                            await _categoriesController
                                                .deleteItems(
                                                    snapshot.data[index],
                                                    categoriesResponse);

                                            setState(() {});
                                          },
                                        );
                                      },
                                    )
                                  : Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 142.h,
                                        ),
                                        child: Text(
                                          "No Bookmarks Found",
                                          style:
                                              CustomTextStyle.textStyle18_400(
                                                  needOpenSans: true,
                                                  color: AppColors
                                                      .unselectedColor),
                                        ),
                                      ),
                                    )
                              : SizedBox();
                        });
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoriesItems extends StatelessWidget {
  const CategoriesItems({
    Key? key,
    required this.itemsResponse,
    this.onTapBookMark,
    this.onTapFavourite,
    this.onTapDelete,
  }) : super(key: key);
  final ItemsResponse itemsResponse;
  final Function()? onTapBookMark;
  final Function()? onTapFavourite;
  final Function()? onTapDelete;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.r),
      child: Card(
        child: Container(
          height: 81.h,
          width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            color: AppColors.white,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(9.r),
                child: Image.network(
                  itemsResponse.image.toString(),
                  height: 58.h,
                  width: 60.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                flex: 9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      itemsResponse.title.toString(),
                      style: CustomTextStyle.textStyle15_700(
                          color: AppColors.choclatyColor),
                      maxLines: 2,
                    ),
                    Row(
                      children: [
                        StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) =>
                                  InkWell(
                            onTap: () {
                              setState(() {
                                itemsResponse.isFavorite == true
                                    ? itemsResponse.isFavorite = false
                                    : itemsResponse.isFavorite = true;
                              });
                            },
                            child: Icon(Icons.notifications_outlined,
                                color: itemsResponse.isFavorite == true
                                    ? AppColors.green
                                    : AppColors.unselectedColor),
                          ),
                        ),
                        StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) =>
                                  InkWell(
                            onTap: () {
                              setState(() {
                                itemsResponse.isBookmarked == true
                                    ? itemsResponse.isBookmarked = false
                                    : itemsResponse.isBookmarked = true;
                              });
                            },
                            child: Icon(Icons.star,
                                color: itemsResponse.isBookmarked == true
                                    ? AppColors.green
                                    : AppColors.unselectedColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              CircleAvatar(
                backgroundColor: AppColors.green,
                radius: 18.r,
                child: Image.asset(
                  "assets/images/system_uicons_door_alt.png",
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 7.w,
              ),
              InkWell(
                onTap: onTapDelete,
                child: CircleAvatar(
                  backgroundColor: Color(0xffFF7070),
                  radius: 18.r,
                  child: Image.asset(
                    "assets/images/lucide_trash.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
