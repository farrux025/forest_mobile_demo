import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forest_mobile/components/app_text.dart';
import 'package:forest_mobile/components/functions.dart';
import 'package:forest_mobile/constants/colors.dart';
import 'package:forest_mobile/views/home/home.dart';
import 'package:forest_mobile/views/more/profile_screen.dart';
import 'package:forest_mobile/views/saved/saveds_screen.dart';

import 'send_message/send_message_screen.dart';

class AppScaffold extends StatefulWidget {
  AppBar? appBar;
  Color? backgroundColor;
  Widget? body;

  AppScaffold({super.key, this.appBar, this.backgroundColor, this.body});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int currentIndex = 0;
  List<IconData> iconList = [
    Icons.home,
    Icons.message,
    Icons.favorite,
    Icons.more_horiz,
  ];

  List<Widget> tabs = [
    const HomeScreen(),
    const SendMessageScreen(),
    const SavedOnesScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor ?? AppColor.backgroundColorDarker,
      appBar: widget.appBar,
      body: widget.body ?? tabs[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () => call(phone: '+998998188103'),
        heroTag: 'sos',
        shape: const CircleBorder(),
        backgroundColor: AppColor.mainColor,
        child: AppText(
            text: "SOS",
            color: AppColor.white,
            size: 14.sp,
            fontWeight: FontWeight.w900),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: currentIndex,
        backgroundColor: AppColor.backgroundColor,
        activeColor: AppColor.mainColor,
        inactiveColor: AppColor.textColorSecondary,
        iconSize: 22.sp,
        gapWidth: 80.w,
        borderColor: AppColor.mainColor,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 16.r,
        rightCornerRadius: 16.r,
        onTap: (index) => setState(() {
          currentIndex = index;
          widget.body = tabs[index];
        }),
      ),
    );
  }
}
