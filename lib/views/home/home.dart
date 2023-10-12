import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forest_mobile/components/app_text.dart';
import 'package:forest_mobile/constants/colors.dart';
import 'package:forest_mobile/constants/images.dart';
import 'package:forest_mobile/views/home/forest_item.dart';

import '../../models/forest/forest_model.dart';
import '../../models/news/news.dart';
import '../notification/news_item.dart';

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

  List<NewsModel> newsList = [
    NewsModel(
      title: "Bla bla Bla bla Bla bla Bla bla Bla bla",
      date: "23.10.2023",
      isRead: true,
      image: 'assets/images/forest1.png',
      description:
          "sdfs fdsfs fsdgfsdgs gsdg sfgs gsg sdgsasfvsdklbz vdfbdfgdobln dfiobndf",
    ),
    NewsModel(
      title: "Bla bla Bla bla Bla bla Bla bla Bla bla",
      date: "23.10.2023",
      isRead: true,
      image: 'assets/images/forest2.png',
      description:
          "sdfs fdsfs fsdgfsdgs gsdg sfgs gsg sdgsasfvsdklbz vdfbdfgdobln dfiobndf",
    ),
    NewsModel(
      title: "Bla bla Bla bla Bla bla Bla bla Bla bla",
      date: "23.10.2023",
      isRead: true,
      description:
          "sdfs fdsfs fsdgfsdgs gsdg sfgs gsg sdgsasfvsdklbz vdfbdfgdobln dfiobndf",
    ),
    NewsModel(
      title: "Bla bla Bla bla Bla bla Bla bla Bla bla",
      date: "23.10.2023",
      isRead: true,
      description:
          "sdfs fdsfs fsdgfsdgs gsdg sfgs gsg sdgsasfvsdklbz vdfbdfgdobln dfiobndf",
    ),
    NewsModel(
      title: "Bla bla Bla bla Bla bla Bla bla Bla bla",
      date: "23.10.2023",
      isRead: true,
      image: 'assets/images/forest2.png',
      description:
          "sdfs fdsfs fsdgfsdgs gsdg sfgs gsg sdgsasfvsdklbz vdfbdfgdobln dfiobndf",
    ),
    NewsModel(
      title: "Bla bla Bla bla Bla bla Bla bla Bla bla",
      date: "23.10.2023",
      image: 'assets/images/forest3.png',
      isRead: true,
      description:
          "sdfs fdsfs fsdgfsdgs gsdg sfgs gsg sdgsasfvsdklbz vdfbdfgdobln dfiobndf",
    ),
    NewsModel(
      title: "Bla bla Bla bla Bla bla Bla bla Bla bla",
      date: "23.10.2023",
      isRead: true,
      image: 'assets/images/forest1.png',
      description:
          "sdfs fdsfs fsdgfsdgs gsdg sfgs gsg sdgsasfvsdklbz vdfbdfgdobln dfiobndf",
    ),
    NewsModel(
      title: "Bla bla Bla bla Bla bla Bla bla Bla bla",
      date: "23.10.2023",
      isRead: true,
      image: 'assets/images/forest3.png',
      description:
          "sdfs fdsfs fsdgfsdgs gsdg sfgs gsg sdgsasfvsdklbz vdfbdfgdobln dfiobndf",
    ),
    NewsModel(
      title: "Bla bla Bla bla Bla bla Bla bla Bla bla",
      date: "23.10.2023",
      isRead: true,
      description:
          "sdfs fdsfs fsdgfsdgs gsdg sfgs gsg sdgsasfvsdklbz vdfbdfgdobln dfiobndf",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColorDarker,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
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
        // actions: [
        //   IconButton(
        //       onPressed: () {},
        //       icon: Icon(
        //         Icons.search,
        //         color: AppColor.textColor,
        //         size: 22.sp,
        //       )),
        //   Padding(
        //     padding: EdgeInsets.only(right: 4.w),
        //     child: IconButton(
        //         onPressed: () {
        //           MyApp.navigatorKey.currentState?.push(MaterialPageRoute(
        //               builder: (context) => const NotificationsScreen()));
        //         },
        //         icon: Icon(
        //           Icons.notifications_none,
        //           color: AppColor.textColor,
        //           size: 22.sp,
        //         )),
        //   ),
        // ],
      ),
      body: Container(
        color: AppColor.backgroundColorDarker,
        height: ScreenUtil().screenHeight,
        child: SingleChildScrollView(
          child: Column(
            children: [forests(), SizedBox(height: 20.h), news()],
          ),
        ),
      ),
    );
  }

  forests() {
    return Card(
      elevation: 1,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.horizontal(left: Radius.circular(10.r)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
              child: AppText(
                text: "O'rmonlar",
                color: AppColor.textColor,
                size: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 180.h,
              child: ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(
                            top: index == 0 ? 8.h : 0, bottom: 10.h),
                        child: ForestItem(forestDetails: forestList[index]),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(),
                  itemCount: forestList.length),
            ),
            SizedBox(height: 12.h)
          ],
        ),
      ),
    );
  }

  news() {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.r))),
      // width: ScreenUtil().screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            child: AppText(
                text: "Yangiliklar",
                color: AppColor.textColor,
                size: 16.sp,
                fontWeight: FontWeight.w700),
          ),
          ListView.separated(
              shrinkWrap: true,
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: NewsItem(newsModel: newsList[index]),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(),
              itemCount: newsList.length),
        ],
      ),
    );
  }
}
