import 'dart:developer';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forest_mobile/components/app_bar.dart';
import 'package:forest_mobile/components/app_components.dart';
import 'package:forest_mobile/components/app_text.dart';
import 'package:forest_mobile/components/functions.dart';
import 'package:forest_mobile/constants/colors.dart';
import 'package:forest_mobile/constants/global.dart';
import 'package:forest_mobile/cubit/hay_making/individual_cubit.dart';
import 'package:forest_mobile/service/hive/hive_store.dart';
import 'package:forest_mobile/service/secure_storage.dart';

import '../../../models/auth/OneIDLoginResponse.dart';

class HaymakingNoLegalScreen extends StatefulWidget {
  const HaymakingNoLegalScreen({Key? key}) : super(key: key);

  @override
  State<HaymakingNoLegalScreen> createState() => _HaymakingNoLegalScreenState();
}

class _HaymakingNoLegalScreenState extends State<HaymakingNoLegalScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  OneIDLoginResponse? userDataByOneID;
  String authType = '';

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 6, vsync: this);
    SecureStorage.read(key: SecureStorage.authType).then((value) {
      authType = value;
      log("Auth type: $authType");
      if (authType == AuthType.oneId) {
        userDataByOneID = HiveStore.oneIdResBox.get(MyHiveBoxName.oneIDResBox);
        log("Email:${userDataByOneID?.data?.email}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColorDarker,
      appBar: appBar("Pichan o'rish (jismoniy shaxs)"),
      body: BlocProvider(
        create: (BuildContext context) => HayMakingIndividualCubit(),
        child: BlocListener<HayMakingIndividualCubit, HayMakingIndividualState>(
          listener: (BuildContext context, state) {},
          child:
              BlocBuilder<HayMakingIndividualCubit, HayMakingIndividualState>(
            builder: (context, state) {
              var read = context.read<HayMakingIndividualCubit>();
              var watch = context.watch<HayMakingIndividualCubit>();
              watch.emailController.text = userDataByOneID?.data?.email ?? '';
              watch.phoneController.text = userDataByOneID?.data?.phone ?? '';
              watch.addressController.text = userDataByOneID?.data?.gd ?? '';
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExpansionTileCard(
                        elevation: 2.h,
                        borderRadius: BorderRadius.circular(8.r),
                        title: AppText(
                            text: "Shaxsiy ma'lumotlar",
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
                                Form(
                                    key: watch.emailKey,
                                    child: editText(
                                      editingController: watch.emailController,
                                      hint: "test@example.com",
                                      inputType: TextInputType.emailAddress,
                                      validator: (value) => AppTextValidator(
                                          watch.emailController.text.trim(),
                                          required: true),
                                    )),
                                titleEditText(title: "Telefon raqami"),
                                Form(
                                    key: watch.phoneKey,
                                    child: editText(
                                      editingController: watch.phoneController,
                                      hint: "+998991234567",
                                      inputType: TextInputType.phone,
                                      validator: (value) => AppTextValidator(
                                          watch.phoneController.text.trim(),
                                          required: true),
                                    )),
                                titleEditText(title: "Familiya"),
                                editText(
                                    initialValue:
                                        "${userDataByOneID?.data?.surName}",
                                    readOnly: true),
                                titleEditText(title: "Ismi"),
                                editText(
                                    initialValue:
                                        "${userDataByOneID?.data?.firstName}",
                                    readOnly: true),
                                titleEditText(title: "Otasining ismi"),
                                editText(
                                    initialValue:
                                        "${userDataByOneID?.data?.midName}",
                                    readOnly: true),
                                titleEditText(title: "Manzili"),
                                Form(
                                    key: watch.addressKey,
                                    child: editText(
                                      editingController:
                                          watch.addressController,
                                      inputType: TextInputType.text,
                                      hint: "Yashash joyi",
                                      validator: (value) => AppTextValidator(
                                          watch.addressController.text.trim(),
                                          required: true),
                                    )),
                                titleEditText(title: "JSHSHIR"),
                                editText(
                                    initialValue:
                                        "${userDataByOneID?.data?.stir}",
                                    readOnly: true,
                                    maxLines: 1),
                                titleEditText(
                                    title: "Passport seriya va raqami"),
                                editText(
                                    initialValue:
                                        "${userDataByOneID?.data?.passport}",
                                    readOnly: true),
                                SizedBox(height: 10.h),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10.h),
                      ExpansionTileCard(
                        elevation: 2.h,
                        borderRadius: BorderRadius.circular(8.r),
                        expandedColor: AppColor.white,
                        initiallyExpanded: false,
                        initialElevation: 2,
                        title: AppText(
                            text: "Ariza matni",
                            size: 12.sp,
                            color: AppColor.textColor,
                            fontWeight: FontWeight.w700),
                        children: [
                          Form(
                            key: watch.arizaTextKey,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 18.w),
                              child: editText(
                                editingController: watch.arizaTextController,
                                inputType: TextInputType.text,
                                hint: "Ariza matni",
                                maxLines: 3,
                                validator: (value) => AppTextValidator(
                                    watch.arizaTextController.text.trim(),
                                    required: true),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h)
                        ],
                      ),
                      SizedBox(height: 10.h),
                      ExpansionTileCard(
                        elevation: 2.h,
                        borderRadius: BorderRadius.circular(8.r),
                        expandedColor: AppColor.white,
                        initiallyExpanded: false,
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
                                    editingController: watch.sectionController,
                                    hint: "Bo'lim nomi",
                                    inputType: TextInputType.text),
                                titleEditText(title: "Aylanmasi"),
                                editText(
                                    editingController: watch.rotationController,
                                    hint: "Aylanmasi",
                                    inputType: TextInputType.number),
                                titleEditText(title: "Kvartal"),
                                editText(
                                    editingController: watch.massiveController,
                                    hint: "Kvartal raqami",
                                    inputType: TextInputType.number),
                                titleEditText(title: "Kontur"),
                                editText(
                                    editingController: watch.contourController,
                                    hint: "Kontur raqami",
                                    inputType: TextInputType.number),
                                titleEditText(title: "Maydon (gektar)"),
                                Form(
                                    key: watch.hectareKey,
                                    child: editText(
                                      editingController:
                                          watch.hectareController,
                                      hint: "0",
                                      inputType: TextInputType.number,
                                      validator: (value) => AppTextValidator(
                                          watch.hectareController.text.trim(),
                                          required: true),
                                    )),
                                titleEditText(title: "Vazni (tonna)"),
                                editText(
                                    editingController: watch.weightController,
                                    hint: "0",
                                    inputType: TextInputType.number),
                                SizedBox(height: 10.h)
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20.h),
                      appButton(
                        text: "Ariza berish",
                        color: AppColor.mainColor,
                        onPressed: () {
                          read.haymakingIndividual();
                        },
                      ),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              );
            },
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
