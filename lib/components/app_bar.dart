import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import 'app_text.dart';

AppBar appBar(String title) {
  return AppBar(
      centerTitle: true,
      title: AppText(
          text: title,
          color: AppColor.textColor,
          size: 16.sp,
          fontWeight: FontWeight.w700),
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColor.backgroundColorDarker);
}
