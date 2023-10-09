import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forest_mobile/constants/colors.dart';
import 'package:forest_mobile/models/news/news.dart';
import 'package:forest_mobile/views/home/news_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 4.w),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: AppColor.textColor,
                  size: 22.sp,
                )),
          )
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsets.only(top: index == 0 ? 12.h : 0, bottom: 10.h),
                child: NewsItem(newsModel: forestList[index]),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(),
            itemCount: forestList.length),
      ),
    );
  }
}
