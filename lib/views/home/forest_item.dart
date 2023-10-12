import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forest_mobile/components/app_text.dart';
import 'package:forest_mobile/constants/colors.dart';
import 'package:forest_mobile/constants/images.dart';
import 'package:forest_mobile/models/forest/forest_model.dart';

class ForestItem extends StatelessWidget {
  ForestDetailsModel forestDetails;

  ForestItem({Key? key, required this.forestDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      width: ScreenUtil().screenWidth * 0.8,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
                color: AppColor.textColorSecondary.withOpacity(0.5),
                blurRadius: 4.r,
                spreadRadius: 0,
                offset: Offset(0, 3.h))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(12.r))),
                child: Image.asset(
                    forestDetails.imageList?[0] ?? AppImages.forestLogoPng,
                    width: forestDetails.imageList != []
                        ? ScreenUtil().screenWidth
                        : ScreenUtil().screenWidth * 0.5,
                    fit: BoxFit.cover),
              )),
          SizedBox(height: 8.h),
          Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                              flex: 2,
                              child: AppText(
                                  text: forestDetails.name ?? '',
                                  size: 14.sp,
                                  maxLines: 2,
                                  color: AppColor.textColor,
                                  fontWeight: FontWeight.w600)),
                          Flexible(
                              flex: 1,
                              child: AppText(
                                  text: forestDetails.address ?? '',
                                  size: 11.sp,
                                  color: AppColor.textColorSecondary,
                                  fontWeight: FontWeight.w400,
                                  maxLines: 1)),
                        ],
                      ),
                    ),
                    Flexible(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.directions_sharp,
                                color: AppColor.mainColor, size: 20.sp),
                            AppText(
                                text: "14 km",
                                size: 10.sp,
                                color: AppColor.textColor,
                                fontWeight: FontWeight.w400)
                          ],
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
