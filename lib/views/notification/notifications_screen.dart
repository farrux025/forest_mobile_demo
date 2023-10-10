import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forest_mobile/components/app_text.dart';
import 'package:forest_mobile/constants/colors.dart';

import '../../models/news/news.dart';
import 'news_item.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<NewsModel> forestList = [
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
        elevation: 1,
        backgroundColor: AppColor.backgroundColorDarker,
        surfaceTintColor: AppColor.backgroundColorDarker,
        leading: const BackButton(color: AppColor.textColor),
        title: AppText(
            text: "Notifications",
            size: 16.sp,
            color: AppColor.textColor,
            fontWeight: FontWeight.w700),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.filter_alt_outlined,
                  size: 22.sp, color: AppColor.textColor))
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  EdgeInsets.only(top: index == 0 ? 12.h : 0, bottom: 10.h),
              child: NewsItem(newsModel: forestList[index]),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(),
          itemCount: forestList.length),
    );
  }
}
