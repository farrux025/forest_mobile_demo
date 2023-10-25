import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forest_mobile/components/app_text.dart';
import 'package:forest_mobile/constants/colors.dart';
import 'package:forest_mobile/main.dart';

import '../../components/functions.dart';
import 'send_warning_screen.dart';

class SOSScreen extends StatelessWidget {
  const SOSScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColorDarker,
      appBar: AppBar(
          leading: const BackButton(color: AppColor.textColor),
          title: AppText(
              text: "SOS",
              size: 16.sp,
              color: AppColor.textColor,
              fontWeight: FontWeight.w700),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0),
      body: Column(
        children: [
          SizedBox(height: 10.h),
          _sosItem(
              leading: Icons.phone,
              title: "Ishonch telefoni",
              subTitle: "1111",
              onPressed: () => call(phone: '1111')),
          SizedBox(height: 10.h),
          _sosItem(
              leading: Icons.message_outlined,
              title: "Ogohlantirish yuborish",
              subTitle: "Sodir bo'lgan hodisalar haqida ogohlantirish berish",
              onPressed: () {
                MyApp.navigatorKey.currentState?.push(MaterialPageRoute(
                    builder: (context) => const SendWarningScreen()));
              }),
        ],
      ),
    );
  }

  _sosItem(
      {required IconData leading,
      required String title,
      required String subTitle,
      required VoidCallback onPressed}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r), color: AppColor.white),
      child: MaterialButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        child: ListTile(
          leading: Icon(leading, size: 20.sp, color: AppColor.mainColor),
          title: AppText(
              text: title,
              size: 14.sp,
              color: AppColor.textColor,
              fontWeight: FontWeight.w500,
              maxLines: 1),
          subtitle: AppText(
              text: subTitle,
              size: 12.sp,
              color: AppColor.textColorSecondary,
              fontWeight: FontWeight.w500,
              maxLines: 1),
          trailing:
              Icon(Icons.chevron_right, color: AppColor.textColor, size: 18.sp),
        ),
      ),
    );
  }
}
