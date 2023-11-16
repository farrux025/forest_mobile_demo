import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forest_mobile/components/functions.dart';
import 'package:forest_mobile/constants/colors.dart';
import 'package:forest_mobile/constants/global.dart';
import 'package:forest_mobile/constants/variables.dart';
import 'package:forest_mobile/main.dart';
import 'package:forest_mobile/service/hive/hive_store.dart';
import 'package:forest_mobile/service/ruxsatnoma_service.dart';
import 'package:forest_mobile/views/auth/user_exist_screen.dart';
import 'package:forest_mobile/views/ruxsatnoma/chorva/jismoniy.dart';
import 'package:forest_mobile/views/ruxsatnoma/pichan/jismoniy.dart';
import 'package:forest_mobile/views/ruxsatnoma/pichan/yuridik.dart';

import '../../components/app_text.dart';
import 'chorva/yuridik.dart';

class RuxsatnomaScreen extends StatefulWidget {
  const RuxsatnomaScreen({super.key});

  @override
  State<RuxsatnomaScreen> createState() => _RuxsatnomaScreenState();
}

class _RuxsatnomaScreenState extends State<RuxsatnomaScreen> {
  @override
  void initState() {
    super.initState();
    RuxsatnomaService.getBHMPrice();
    RuxsatnomaService.getRegionsAndDepartments();
  }

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
        backgroundColor: AppColor.backgroundColorDarker,
        surfaceTintColor: AppColor.backgroundColorDarker,
        actions: [
          Global.isLogin
              ? const SizedBox()
              : IconButton(
                  onPressed: () => MyApp.navigatorKey.currentState?.push(
                      MaterialPageRoute(
                          builder: (context) => const UserExistScreen(
                              screenPath: ScreenPath.ruxsatnoma))),
                  icon:
                      Icon(Icons.login, size: 22.sp, color: AppColor.textColor))
        ],
      ),
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
                    onPressed: () => Global.isLogin
                        ? MyApp.navigatorKey.currentState?.push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PetFeedingNoLegalScreen()))
                        : noLoginAlert(context: context)),
                _item(
                    title: "Yuridik shaxs",
                    onPressed: () => Global.isLogin
                        ? MyApp.navigatorKey.currentState?.push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PetFeedingLegalScreen()))
                        : noLoginAlert(context: context)),
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
                    onPressed: () => Global.isLogin
                        ? MyApp.navigatorKey.currentState?.push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const HaymakingNoLegalScreen()))
                        : noLoginAlert(context: context)),
                _item(
                    title: "Yuridik shaxs",
                    onPressed: () => Global.isLogin
                        ? MyApp.navigatorKey.currentState?.push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const HaymakingLegalScreen()))
                        : noLoginAlert(context: context)),
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

noLoginAlert({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        contentPadding: EdgeInsets.all(16.sp),
        title: AppText(
            text: "Iltimos, ruxsatnoma olish uchun avval tizimga kiring!",
            size: 14.sp,
            color: AppColor.textColor,
            textAlign: TextAlign.center,
            maxLines: 2,
            fontWeight: FontWeight.w500),
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 32.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColor.mainColor, width: 2),
                      borderRadius: BorderRadius.circular(12.r)),
                  child: MaterialButton(
                    onPressed: () => pop(),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r)),
                    height: 32.h,
                    child: AppText(
                        text: "Yopish",
                        size: 11.sp,
                        color: AppColor.mainColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    pop();
                    MyApp.navigatorKey.currentState?.push(MaterialPageRoute(
                        builder: (context) => const UserExistScreen(
                            screenPath: ScreenPath.ruxsatnoma)));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r)),
                  height: 32.h,
                  color: AppColor.mainColor,
                  child: AppText(
                      text: "Tizimga kirish",
                      size: 11.sp,
                      color: AppColor.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          )
        ],
      );
    },
  );
}
