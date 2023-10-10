import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forest_mobile/constants/colors.dart';
import 'package:forest_mobile/constants/images.dart';
import 'package:forest_mobile/main.dart';
import 'package:forest_mobile/views/home/forest_item.dart';
import 'package:forest_mobile/views/notification/notifications_screen.dart';

import '../../models/forest/forest_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ForestDetailsModel> forestList = [
    ForestDetailsModel(
        name: "Zomin Qo'riqxonasi",
        address: "Zomin, Jizzax",
        imageList: [AppImages.forest1, AppImages.forest2]),
    ForestDetailsModel(name: "Zomin Qo'riqxonasi", address: "Zomin, Jizzax"),
    ForestDetailsModel(
        name: "Zomin Qo'riqxonasi",
        address: "Zomin, Jizzax",
        imageList: [AppImages.forest3, AppImages.forest2]),
    ForestDetailsModel(
        name: "Zomin Qo'riqxonasi",
        address: "Zomin, Jizzax",
        imageList: [AppImages.forest2]),
    ForestDetailsModel(
        name: "Zomin Qo'riqxonasi",
        address: "Zomin, Jizzax",
        imageList: [AppImages.forest1, AppImages.forest2, AppImages.forest3]),
    ForestDetailsModel(name: "Zomin Qo'riqxonasi", address: "Zomin, Jizzax"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColorDarker,
      appBar: AppBar(
        elevation: 1,
        surfaceTintColor: AppColor.backgroundColorDarker,
        backgroundColor: AppColor.backgroundColorDarker,
        title: ColorFiltered(
          colorFilter: const ColorFilter.mode(
              AppColor.backgroundColorDarker, BlendMode.darken),
          child: Image.asset(
            'assets/images/forest_mobile_logo.jpg',
            fit: BoxFit.cover,
            height: 60.h,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: AppColor.textColor,
                size: 22.sp,
              )),
          Padding(
            padding: EdgeInsets.only(right: 4.w),
            child: IconButton(
                onPressed: () {
                  MyApp.navigatorKey.currentState?.push(MaterialPageRoute(
                      builder: (context) => const NotificationsScreen()));
                },
                icon: Icon(
                  Icons.notifications_none,
                  color: AppColor.textColor,
                  size: 22.sp,
                )),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: (context, index) => Padding(
                  padding:
                      EdgeInsets.only(top: index == 0 ? 8.h : 0, bottom: 10.h),
                  child: ForestItem(forestDetails: forestList[index]),
                ),
            separatorBuilder: (context, index) => const SizedBox(),
            itemCount: forestList.length),
      ),
    );
  }
}
