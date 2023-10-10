import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forest_mobile/components/app_text.dart';
import 'package:forest_mobile/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColorDarker,
      appBar: AppBar(
        surfaceTintColor: AppColor.backgroundColorDarker,
        backgroundColor: AppColor.backgroundColorDarker,
        title: AppText(
            text: "Settings",
            size: 16.sp,
            color: AppColor.mainColor,
            fontWeight: FontWeight.w500),
      ),
      body: Column(
        children: [
          settingsItem(
              title: 'Change language',
              onPressed: () {},
              leading: Icons.language)
        ],
      ),
    );
  }

  Widget settingsItem(
      {required String title,
      IconData? leading,
      Widget? trailing,
      required VoidCallback onPressed}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 14.w),
      width: ScreenUtil().screenWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.sp),
          color: AppColor.white),
      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
          children: [
            leading == null
                ? const SizedBox()
                : Flexible(
                    flex: 1,
                    child: CircleAvatar(
                      backgroundColor: AppColor.backgroundColorDarker,
                      child: Icon(leading,
                          color: AppColor.mainColor, size: 20.sp),
                    ),
                  ),
            Flexible(
                flex: 4,
                child: AppText(
                    text: title,
                    size: 14.sp,
                    color: AppColor.textColor,
                    fontWeight: FontWeight.w500)),
            Flexible(
                flex: 1,
                child: trailing ??
                    Icon(Icons.chevron_right,
                        color: AppColor.textColor, size: 20.sp))
          ],
        ),
      ),
    );
  }
}
