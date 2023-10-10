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
        height: 180.h,
        decoration: BoxDecoration(
            color: AppColor.white, borderRadius: BorderRadius.circular(12.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                flex: 3,
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                      newsModel.image ?? 'assets/images/forest_mobile_logo.jpg',
                      width: newsModel.image == null
                          ? ScreenUtil().screenWidth * 0.75
                          : ScreenUtil().screenWidth,
                      fit: BoxFit.cover),
                )),
            SizedBox(height: 8.h),
            Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: AppText(
                      text: newsModel.title,
                      size: 14.sp,
                      maxLines: 1,
                      fontWeight: FontWeight.w800,
                      color: AppColor.textColor),
                )),
            newsModel.description != null
                ? Flexible(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: AppText(
                          text: newsModel.description ?? '',
                          size: 10.sp,
                          maxLines: 2,
                          fontWeight: FontWeight.w400,
                          color: AppColor.textColorSecondary),
                    ))
                : const SizedBox(),
            SizedBox(height: 10.h),
            Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 3.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColor.backgroundColorDarker),
                        child: AppText(
                            text: newsModel.date,
                            size: 11.sp,
                            color: AppColor.mainColor,
                            fontWeight: FontWeight.w500),
                      ),
                      MaterialButton(
                        onPressed: () {
                          log("Batafsil");
                        },
                        child: AppText(
                            text: "Batafsil",
                            size: 12.sp,
                            fontStyle: FontStyle.italic,
                            color: AppColor.mainColor,
                            fontWeight: FontWeight.w400,
                            textDecoration: TextDecoration.underline,
                            decorationColor: AppColor.mainColor),
                      )
                    ],
                  ),
                )),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
