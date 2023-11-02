import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forest_mobile/constants/colors.dart';
import 'package:forest_mobile/main.dart';
import 'package:forest_mobile/views/ruxsatnoma/chorva/jismoniy.dart';
import 'package:forest_mobile/views/ruxsatnoma/pichan/jismoniy.dart';
import 'package:forest_mobile/views/ruxsatnoma/pichan/yuridik.dart';

import '../../components/app_text.dart';
import 'chorva/yuridik.dart';

class SendMessageScreen extends StatelessWidget {
  const SendMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColorDarker,
      appBar: AppBar(
          centerTitle: true,
          title: AppText(
              text: "Ruxsatnoma olish",
              color: AppColor.textColor,
              size: 16.sp,
              fontWeight: FontWeight.w700),
          elevation: 0,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
            child: ExpansionTileCard(
              elevation: 1.sp,
              initialElevation: 1.sp,
              borderRadius: BorderRadius.circular(8.r),
              expandedColor: AppColor.white,
              title: AppText(
                  text: "Chorva mollarini boqish",
                  size: 14.sp,
                  color: AppColor.textColor,
                  fontWeight: FontWeight.w500),
              children: [
                _item(
                    title: "Jismoniy shaxs",
                    onPressed: () {
                      MyApp.navigatorKey.currentState?.push(MaterialPageRoute(
                          builder: (context) =>
                              const PetFeedingNoLegalScreen()));
                    }),
                _item(
                    title: "Yuridik shaxs",
                    onPressed: () {
                      MyApp.navigatorKey.currentState?.push(MaterialPageRoute(
                          builder: (context) => const PetFeedingLegalScreen()));
                    }),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
            child: ExpansionTileCard(
              elevation: 1.sp,
              initialElevation: 1.sp,
              borderRadius: BorderRadius.circular(8.r),
              expandedColor: AppColor.white,
              title: AppText(
                  text: "Pichan o'rish",
                  size: 14.sp,
                  color: AppColor.textColor,
                  fontWeight: FontWeight.w500),
              children: [
                _item(
                    title: "Jismoniy shaxs",
                    onPressed: () {
                      MyApp.navigatorKey.currentState?.push(MaterialPageRoute(
                          builder: (context) =>
                              const HaymakingNoLegalScreen()));
                    }),
                _item(
                    title: "Yuridik shaxs",
                    onPressed: () {
                      MyApp.navigatorKey.currentState?.push(MaterialPageRoute(
                          builder: (context) => const HaymakingLegalScreen()));
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _item({required VoidCallback onPressed, required String title}) {
    return MaterialButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
              text: title,
              size: 12.sp,
              color: AppColor.textColor,
              fontWeight: FontWeight.w400),
          Icon(Icons.chevron_right, color: AppColor.textColor, size: 16.sp)
        ],
      ),
    );
  }
}
