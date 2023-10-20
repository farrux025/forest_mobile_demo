import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forest_mobile/components/app_text.dart';
import 'package:forest_mobile/constants/colors.dart';
import 'package:forest_mobile/main.dart';
import 'package:forest_mobile/views/auth/user_exist_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColorDarker,
      appBar: AppBar(
        leading: const SizedBox(),
        centerTitle: true,
        surfaceTintColor: AppColor.backgroundColorDarker,
        backgroundColor: AppColor.backgroundColorDarker,
        title: AppText(
            text: "Settings",
            size: 16.sp,
            color: AppColor.textColor,
            fontWeight: FontWeight.w800),
      ),
      body: Column(
        children: [
          settingsItem(
              title: 'Change language',
              onPressed: () {},
              leading: Icons.language),
          settingsItem(
              title: 'Sign in',
              onPressed: () {
                MyApp.navigatorKey.currentState?.push(MaterialPageRoute(
                  builder: (context) => const UserExistScreen(),
                ));
              },
              leading: Icons.login),
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
      margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.sp), color: AppColor.white),
      child: MaterialButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        height: 50.h,
        onPressed: onPressed,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(
          children: [
            Flexible(
              flex: leading != null ? 1 : 0,
              child: CircleAvatar(
                radius: 18.r,
                backgroundColor: AppColor.backgroundColorDarker,
                child: Icon(leading, color: AppColor.mainColor, size: 20.sp),
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
