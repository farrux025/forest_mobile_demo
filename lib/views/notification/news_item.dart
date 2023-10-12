import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forest_mobile/components/app_text.dart';
import 'package:forest_mobile/constants/colors.dart';

import '../../models/news/news.dart';

class NewsItem extends StatelessWidget {
  NewsModel newsModel;

  NewsItem({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Container(
        padding: EdgeInsets.all(10.h),
        width: ScreenUtil().screenWidth,
        decoration: BoxDecoration(
            color: AppColor.white, borderRadius: BorderRadius.circular(12.r)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                    newsModel.image ?? 'assets/images/forest_mobile_logo.jpg',
                    width: 80,
                    height: 80,
                    scale: newsModel.image == null ? 0.2 : 1,
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 8.h),
            Flexible(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: AppText(
                        text: newsModel.title,
                        size: 12.sp,
                        maxLines: 1,
                        fontWeight: FontWeight.w800,
                        color: AppColor.textColor),
                  ),
                  newsModel.description != null
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: AppText(
                              text: newsModel.description ?? '',
                              size: 10.sp,
                              maxLines: 1,
                              fontWeight: FontWeight.w400,
                              color: AppColor.textColorSecondary),
                        )
                      : const SizedBox(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 1.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: AppColor.backgroundColorDarker),
                          child: AppText(
                              text: newsModel.date,
                              size: 8.sp,
                              color: AppColor.mainColor,
                              fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                          onPressed: () {
                            log("Batafsil");
                          },
                          child: AppText(
                              text: "Batafsil",
                              size: 10.sp,
                              fontStyle: FontStyle.italic,
                              color: AppColor.mainColor,
                              fontWeight: FontWeight.w400,
                              textDecoration: TextDecoration.underline,
                              decorationColor: AppColor.mainColor),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
