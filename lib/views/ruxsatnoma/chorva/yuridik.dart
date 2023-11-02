import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forest_mobile/components/app_bar.dart';
import 'package:forest_mobile/components/app_components.dart';
import 'package:forest_mobile/components/app_text.dart';
import 'package:forest_mobile/components/functions.dart';
import 'package:forest_mobile/constants/colors.dart';

class PetFeedingLegalScreen extends StatefulWidget {
  const PetFeedingLegalScreen({Key? key}) : super(key: key);

  @override
  State<PetFeedingLegalScreen> createState() => _PetFeedingLegalScreenState();
}

class _PetFeedingLegalScreenState extends State<PetFeedingLegalScreen>
    with SingleTickerProviderStateMixin {
  var emailController = TextEditingController();
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColorDarker,
      appBar: appBar("Chorva mollarini boqish (yuridik shaxs)"),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // yuridik info
              ExpansionTileCard(
                elevation: 2.h,
                borderRadius: BorderRadius.circular(8.r),
                title: AppText(
                    text: "Yuridik ma'lumotlar",
                    color: AppColor.textColor,
                    size: 12.sp,
                    fontWeight: FontWeight.w700),
                expandedColor: AppColor.white,
                initiallyExpanded: true,
                initialElevation: 2,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        titleEditText(title: "Email"),
                        editText(
                          editingController: emailController,
                          hint: "test@example.com",
                          inputType: TextInputType.emailAddress,
                          validator: (value) => AppTextValidator(
                              emailController.text.trim(),
                              required: true),
                        ),
                        titleEditText(title: "Telefon raqami"),
                        editText(
                          editingController: emailController,
                          hint: "+998991234567",
                          inputType: TextInputType.phone,
                          validator: (value) => AppTextValidator(
                              emailController.text.trim(),
                              required: true),
                        ),
                        titleEditText(title: "Yuridik shaxsning nomi"),
                        editText(
                          editingController: emailController,
                          hint: "Yuridik shaxs nomi",
                          inputType: TextInputType.text,
                        ),
                        titleEditText(title: "Familiya"),
                        editText(initialValue: "AKROMOV", readOnly: true),
                        titleEditText(title: "Ismi"),
                        editText(initialValue: "ABDULLA", readOnly: true),
                        titleEditText(title: "Otasining ismi"),
                        editText(initialValue: "QUDRAT O'G'LI", readOnly: true),
                        titleEditText(title: "STIR raqami"),
                        editText(
                          editingController: emailController,
                          inputType: TextInputType.number,
                          hint: "STIR",
                          validator: (value) => AppTextValidator(
                              emailController.text.trim(),
                              required: true),
                        ),
                        titleEditText(title: "Bank nomi"),
                        editText(
                          editingController: emailController,
                          inputType: TextInputType.text,
                          hint: "Bank nomi",
                          validator: (value) => AppTextValidator(
                              emailController.text.trim(),
                              required: true),
                        ),
                        titleEditText(title: "Bank MFO"),
                        editText(
                          editingController: emailController,
                          inputType: TextInputType.number,
                          hint: "MFO",
                          validator: (value) => AppTextValidator(
                              emailController.text.trim(),
                              required: true),
                        ),
                        titleEditText(title: "Bank hisob raqami"),
                        editText(
                          editingController: emailController,
                          inputType: TextInputType.number,
                          hint: "Hisob raqam",
                          validator: (value) => AppTextValidator(
                              emailController.text.trim(),
                              required: true),
                        ),
                        titleEditText(title: "Yuridik manzili"),
                        editText(
                          editingController: emailController,
                          inputType: TextInputType.text,
                          hint: "Yuridik manzili",
                          validator: (value) => AppTextValidator(
                              emailController.text.trim(),
                              required: true),
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.h),
              // ariza matni
              ExpansionTileCard(
                elevation: 2.h,
                borderRadius: BorderRadius.circular(8.r),
                expandedColor: AppColor.white,
                initiallyExpanded: true,
                initialElevation: 2,
                title: AppText(
                    text: "Ariza matni",
                    size: 12.sp,
                    color: AppColor.textColor,
                    fontWeight: FontWeight.w700),
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: editText(
                      editingController: emailController,
                      inputType: TextInputType.text,
                      hint: "Ariza matni",
                      maxLines: 3,
                      validator: (value) => AppTextValidator(
                          emailController.text.trim(),
                          required: true),
                    ),
                  ),
                  SizedBox(height: 10.h)
                ],
              ),
              SizedBox(height: 10.h),
              // o'rmon ma'lumotlari
              ExpansionTileCard(
                elevation: 2.h,
                borderRadius: BorderRadius.circular(8.r),
                expandedColor: AppColor.white,
                initiallyExpanded: true,
                initialElevation: 2,
                title: AppText(
                    text: "O'rmon xo'jaligi ma'lumotlari",
                    size: 12.sp,
                    color: AppColor.textColor,
                    fontWeight: FontWeight.w700),
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        titleEditText(title: "Bo'lim"),
                        editText(
                            editingController: emailController,
                            hint: "Bo'lim nomi",
                            inputType: TextInputType.text),
                        titleEditText(title: "Aylanmasi"),
                        editText(
                            editingController: emailController,
                            hint: "Aylanmasi",
                            inputType: TextInputType.number),
                        titleEditText(title: "Kvartal"),
                        editText(
                            editingController: emailController,
                            hint: "Kvartal raqami",
                            inputType: TextInputType.number),
                        titleEditText(title: "Kontur"),
                        editText(
                            editingController: emailController,
                            hint: "Kontur raqami",
                            inputType: TextInputType.number),
                        titleEditText(title: "Maydon (gektar)"),
                        editText(
                            editingController: emailController,
                            hint: "0",
                            inputType: TextInputType.number),
                        SizedBox(height: 10.h)
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.h),
              // hayvonlar soni
              ExpansionTileCard(
                elevation: 2.h,
                borderRadius: BorderRadius.circular(8.r),
                expandedColor: AppColor.white,
                initiallyExpanded: true,
                initialElevation: 2,
                title: AppText(
                    text: "Chorva mollari",
                    size: 12.sp,
                    color: AppColor.textColor,
                    fontWeight: FontWeight.w700),
                children: [
                  Container(
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            width: ScreenUtil().screenWidth * 1.1,
                            child: TabBar(
                                controller: tabController,
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                indicatorColor: AppColor.textColorGreen,
                                indicatorWeight: 3.h,
                                labelColor: AppColor.textColorGreen,
                                unselectedLabelColor: Colors.black54,
                                indicatorSize: TabBarIndicatorSize.tab,
                                labelPadding: EdgeInsets.zero,
                                tabs: [
                                  _tabItem(title: "Qoramol"),
                                  _tabItem(title: "Ot"),
                                  _tabItem(title: "Tuya"),
                                  _tabItem(title: "Eshak"),
                                  _tabItem(title: "Qo'y"),
                                  _tabItem(title: "Echki"),
                                ]),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().screenHeight * 0.28,
                          child:
                              TabBarView(controller: tabController, children: [
                            // qoramol
                            _tabView(
                                title1: "Katta yoshdagi",
                                editingController1: emailController,
                                title2: "2 yoshgacha bo'lgan",
                                editingController2: emailController),
                            // ot
                            _tabView(
                                title1: "Katta yoshdagi",
                                editingController1: emailController,
                                title2: "2 yoshgacha bo'lgan",
                                editingController2: emailController),
                            // tuya
                            _tabView(
                                title1: "Katta yoshdagi",
                                editingController1: emailController,
                                title2: "2 yoshgacha bo'lgan",
                                editingController2: emailController),
                            // eshak
                            _tabView(
                                title1: "Katta yoshdagi",
                                editingController1: emailController,
                                title2: "2 yoshgacha bo'lgan",
                                editingController2: emailController),
                            // qo'y
                            _tabView(
                                title1: "6 oydan katta",
                                editingController1: emailController,
                                title2: "6 oydan kichik",
                                editingController2: emailController),
                            // echki
                            _tabView(
                                title1: "6 oydan katta",
                                editingController1: emailController,
                                title2: "6 oydan kichik",
                                editingController2: emailController),
                          ]),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  _tabItem({required String title}) {
    return Tab(
      height: 24.h,
      child: AppText(text: title),
    );
  }

  _tabView({
    required String title1,
    required TextEditingController editingController1,
    required String title2,
    required TextEditingController editingController2,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          titleEditText(title: title1),
          editText(
              inputType: TextInputType.number,
              editingController: editingController1,
              hint: "0",
              maxLines: 1),
          SizedBox(height: 8.h),
          titleEditText(title: title2),
          editText(
              inputType: TextInputType.number,
              editingController: editingController2,
              hint: "0",
              maxLines: 1),
        ],
      ),
    );
  }
}
