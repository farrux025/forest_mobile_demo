import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forest_mobile/components/app_components.dart';
import 'package:forest_mobile/components/app_text.dart';
import 'package:forest_mobile/cubit/register/register_cubit.dart';

import '../../components/app_text_form_field.dart';
import '../../components/functions.dart';
import '../../constants/colors.dart';
import '../../constants/images.dart';

class RegisterScreen extends StatefulWidget {
  final String phone;

  const RegisterScreen({Key? key, required this.phone}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: BlocProvider(
        create: (BuildContext context) => RegisterCubit(),
        child: BlocListener<RegisterCubit, RegisterState>(
          listener: (BuildContext context, state) {
            if (state is RegisterLoading) {
              MyDialog.openLoading();
            }
            if (state is RegisterError) {
              MyDialog.closeLoading();
              openSnackBar(message: state.error);
            }
            if (state is RegisterLoaded) {
              MyDialog.closeLoading();
            }
          },
          child: BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              var watch = context.watch<RegisterCubit>();
              var read = context.read<RegisterCubit>();
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  height: ScreenUtil().screenHeight,
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
                              AppText(
                                  text: "Ro'yxatdan o'tish",
                                  size: 18.sp,
                                  fontWeight: FontWeight.w800,
                                  color: AppColor.textColor),
                              SizedBox(height: 20.h),
                              Form(
                                key: watch.keyFirstname,
                                child: AppTextFormField(
                                  textEditingController:
                                      watch.firstnameController,
                                  labelText: "Ism",
                                  maxLines: 1,
                                  keyboardType: TextInputType.text,
                                  autofocus: true,
                                  textSize: 16.sp,
                                  validator: (value) => AppTextValidator(
                                      watch.firstnameController.text.trim(),
                                      required: true),
                                ),
                              ),
                              SizedBox(height: 12.h),
                              Form(
                                key: watch.keyLastname,
                                child: AppTextFormField(
                                  textEditingController:
                                      watch.lastnameController,
                                  labelText: "Familiya",
                                  maxLines: 1,
                                  keyboardType: TextInputType.text,
                                  textSize: 16.sp,
                                  validator: (value) => AppTextValidator(
                                      watch.lastnameController.text.trim(),
                                      required: true),
                                ),
                              ),
                              // SizedBox(height: 12.h),
                              // Form(
                              //   key: watch.keyEmail,
                              //   child: AppTextFormField(
                              //     textEditingController: watch.emailController,
                              //     labelText: "Email",
                              //     keyboardType: TextInputType.emailAddress,
                              //     textSize: 16.sp,
                              //     validator: (value) => AppTextValidator(
                              //         watch.emailController.text.trim()),
                              //   ),
                              // ),
                              SizedBox(height: 24.h),
                              appButton(
                                text: "Davom etish",
                                color: AppColor.mainColor,
                                onPressed: () async =>
                                    await read.register(widget.phone),
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
