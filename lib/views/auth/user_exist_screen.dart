import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forest_mobile/components/app_components.dart';
import 'package:forest_mobile/components/app_text.dart';
import 'package:forest_mobile/components/app_text_form_field.dart';
import 'package:forest_mobile/constants/colors.dart';
import 'package:forest_mobile/constants/images.dart';
import 'package:forest_mobile/cubit/one_id/one_id_cubit.dart';
import 'package:forest_mobile/cubit/user_exist/user_exist_cubit.dart';
import 'package:forest_mobile/views/auth/register_screen.dart';

import '../../components/functions.dart';
import '../../main.dart';
import 'one_id_screen.dart';

class UserExistScreen extends StatefulWidget {
  const UserExistScreen({super.key});

  @override
  State<UserExistScreen> createState() => _UserExistScreenState();
}

class _UserExistScreenState extends State<UserExistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, surfaceTintColor: Colors.transparent),
      body: BlocProvider(
        create: (BuildContext context) => UserExistCubit(),
        child: BlocListener<UserExistCubit, UserExistState>(
          listener: (BuildContext context, state) {
            if (state is UserExistLoading) {
              MyDialog.openLoading();
            }
            if (state is UserExistError) {
              MyDialog.closeLoading();
              openSnackBar(message: state.error);
            }
            if (state is UserExistLoaded) {
              MyDialog.closeLoading();
              if (state.success == false) {
                MyApp.navigatorKey.currentState?.push(MaterialPageRoute(
                    builder: (context) =>
                        RegisterScreen(phone: getPhone(phone: state.phone))));
              } else {
                openSnackBar(
                    message: "${state.phone} is exist",
                    background: AppColor.mainColor.withOpacity(0.7));
              }
            }
          },
          child: BlocBuilder<UserExistCubit, UserExistState>(
            builder: (BuildContext context, state) {
              var read = context.read<UserExistCubit>();
              var watch = context.watch<UserExistCubit>();
              return SingleChildScrollView(
                child: Container(
                  height: ScreenUtil().screenHeight,
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Column(
                    children: [
                      Flexible(
                          flex: 1,
                          child: Image.asset(
                            AppImages.forestLogoPng,
                            fit: BoxFit.cover,
                            width: ScreenUtil().screenWidth * 0.8,
                          )),
                      Flexible(
                          flex: 2,
                          child: Column(
                            children: [
                              SizedBox(height: 20.h),
                              AppText(
                                text: 'Tizimga kirish',
                                size: 18.sp,
                                fontWeight: FontWeight.w800,
                                color: AppColor.textColor,
                              ),
                              SizedBox(height: 20.h),
                              Form(
                                key: watch.keyPhone,
                                child: AppTextFormField(
                                  textEditingController: watch.phoneController,
                                  labelText: "Telefon raqami",
                                  maxLines: 1,
                                  keyboardType: TextInputType.phone,
                                  autofocus: true,
                                  textSize: 16.sp,
                                  // contentPadding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 4.h),
                                  prefix: AppText(
                                      text: '+998 ',
                                      size: 16.sp,
                                      color: AppColor.textColor),
                                  validator: (value) => AppTextValidator(
                                      watch.phoneController.text,
                                      required: true),
                                  inputFormatter: [Mask.PHONE_NUMBER],
                                ),
                              ),
                              SizedBox(height: 20.h),
                              appButton(
                                  text: 'Davom etish',
                                  color: AppColor.mainColor,
                                  onPressed: () async =>
                                      await read.userExist()),
                              SizedBox(height: 30.h),
                              Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                          height: 0.7,
                                          color: AppColor.textColor)),
                                  AppText(
                                    text: "  yoki  ",
                                    size: 12.sp,
                                    color: AppColor.textColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  Expanded(
                                      child: Container(
                                          height: 0.7,
                                          color: AppColor.textColor))
                                ],
                              ),
                              SizedBox(height: 30.h),
                              BlocProvider(
                                create: (BuildContext context) => OneIDCubit(),
                                child: BlocListener<OneIDCubit, OneIDState>(
                                  listener:
                                      (BuildContext context, state) async {
                                    if (state is OneIDLoading) {
                                      MyDialog.openLoading();
                                    }
                                    if (state is OneIDError) {
                                      await MyDialog.closeLoading();
                                      openSnackBar(message: state.error);
                                    }
                                    if (state is OneIDLoaded) {
                                      await MyDialog.closeLoading();
                                      MyApp.navigatorKey.currentState
                                          ?.push(MaterialPageRoute(
                                        builder: (context) =>
                                            OneIDScreen(url: state.url),
                                      ));
                                    }
                                  },
                                  child: BlocBuilder<OneIDCubit, OneIDState>(
                                    builder: (context, state) {
                                      var read = context.read<OneIDCubit>();
                                      return appButton(
                                          text: 'ONE ID',
                                          color: Colors.deepPurple,
                                          onPressed: () => read.loginByOneID());
                                    },
                                  ),
                                ),
                              )
                            ],
                          ))
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
}
