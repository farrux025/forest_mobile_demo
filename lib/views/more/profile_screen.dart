import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forest_mobile/components/app_text.dart';
import 'package:forest_mobile/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColor.backgroundColorDarker,
        title: AppText(
            text: "Settings",
            size: 16.sp,
            color: AppColor.mainColor,
            fontWeight: FontWeight.w500),
      ),
      body: Column(
        children: [settingsItem(title: 'change language', onPressed: () {})],
      ),
    );
  }

  Widget settingsItem(
      {required String title,
      IconData? leading,
      IconData? trailing,
      required VoidCallback onPressed}) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
          child: Row(
        children: [
          leading == null
              ? const SizedBox()
              : CircleAvatar(
                  backgroundColor: AppColor.backgroundColorDarker,
                  child: Icon(leading, color: AppColor.mainColor, size: 20.sp),
                )
        ],
      )),
    );
  }
}
