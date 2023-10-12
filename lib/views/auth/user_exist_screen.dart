import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forest_mobile/components/app_text.dart';
import 'package:forest_mobile/components/app_text_form_field.dart';
import 'package:forest_mobile/constants/colors.dart';
import 'package:forest_mobile/constants/images.dart';
import 'package:forest_mobile/cubit/one_id_cubit.dart';

import '../../components/functions.dart';

class UserExistScreen extends StatefulWidget {
  const UserExistScreen({super.key});

  @override
  State<UserExistScreen> createState() => _UserExistScreenState();
}

class _UserExistScreenState extends State<UserExistScreen> {
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: ScreenUtil().screenHeight,
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  flex: 1,
                  child: Image.asset(
                    AppImages.forestLogoPng,
                    fit: BoxFit.cover,
                  )),
              Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      AppText(
                        text: 'Tizimga kirish',
                        size: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.textColor,
                      ),
                      SizedBox(height: 20.h),
                      AppTextFormField(
                        textEditingController: phoneController,
                        labelText: "Telefon raqami",
                        maxLines: 1,
                        keyboardType: TextInputType.phone,
                        prefix: AppText(
                            text: '+998 ',
                            size: 16.sp,
                            color: AppColor.textColor),
                        validator: (value) =>
                            AppTextValidator(phoneController.text),
                        inputFormatter: [Mask.PHONE_NUMBER],
                      ),
                      SizedBox(height: 20.h),
                      MaterialButton(
                        onPressed: () {},
                        color: AppColor.mainColor,
                        minWidth: ScreenUtil().screenWidth,
                        height: 44.h,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.r)),
                        child: AppText(
                          text: "Davom etish",
                          size: 14.sp,
                          color: AppColor.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      AppText(
                        text: "-or-",
                        size: 12.sp,
                        color: AppColor.textColor,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: 20.h),
                      BlocProvider(
                        create: (BuildContext context) => OneIDCubit(),
                        child: BlocBuilder<OneIDCubit, OneIDState>(
                          builder: (context, state) {
                            var read = context.read<OneIDCubit>();
                            return MaterialButton(
                              onPressed: () {
                                read.loginByOneID();
                              },
                              color: Colors.deepPurple,
                              minWidth: ScreenUtil().screenWidth,
                              height: 44.h,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14.r)),
                              child: AppText(
                                text: "ONE ID",
                                size: 14.sp,
                                color: AppColor.white,
                                fontWeight: FontWeight.w600,
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
