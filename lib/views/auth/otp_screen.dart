import 'dart:developer';

import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forest_mobile/components/app_components.dart';
import 'package:forest_mobile/components/app_text.dart';
import 'package:forest_mobile/components/functions.dart';
import 'package:forest_mobile/constants/colors.dart';
import 'package:forest_mobile/constants/variables.dart';
import 'package:forest_mobile/cubit/otp/otp_cubit.dart';
import 'package:forest_mobile/main.dart';
import 'package:forest_mobile/views/app_scaffold.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../service/auth_service.dart';

class OtpScreen extends StatefulWidget {
  final String phone;
  final String screenPath;

  const OtpScreen({
    Key? key,
    required this.phone,
    required this.screenPath,
  }) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen>
    with SingleTickerProviderStateMixin {
  late CustomTimerController timerController;
  bool finished = false;

  @override
  void initState() {
    super.initState();
    timerController = CustomTimerController(
        vsync: this,
        begin: const Duration(minutes: 1),
        end: Duration.zero,
        interval: CustomTimerInterval.seconds);
    timerController.start();
    timerController.addListener(() {
      if (timerController.state.value == CustomTimerState.finished) {
        setState(() => finished = true);
      } else {
        setState(() => finished = false);
      }
    });
  }

  @override
  void dispose() {
    timerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent),
      body: BlocProvider(
        create: (BuildContext context) => OtpCubit(),
        child: BlocListener<OtpCubit, OtpState>(
          listener: (BuildContext context, state) {
            if (state is OtpLoading) {
              MyDialog.openLoading();
            }
            if (state is OtpError) {
              MyDialog.closeLoading();
              openSnackBar(message: state.error);
            }
            if (state is OtpLoaded) {
              MyDialog.closeLoading();
              ScreenPath.pushToScreen(widget.screenPath);
              // MyApp.navigatorKey.currentState?.pushAndRemoveUntil(
              //     MaterialPageRoute(builder: (context) => AppScaffold()),
              //     (route) => false);
            }
          },
          child: BlocBuilder<OtpCubit, OtpState>(
            builder: (context, state) {
              var read = context.read<OtpCubit>();
              var watch = context.watch<OtpCubit>();
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30.h),
                      AppText(
                          text: "Enter OTP",
                          size: 24.sp,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w600),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.timer_outlined,
                              size: 22.sp, color: AppColor.textColor),
                          SizedBox(width: 6.w),
                          CustomTimer(
                              controller: timerController,
                              builder: (state, time) {
                                return AppText(
                                    text: "${time.minutes}:${time.seconds}",
                                    size: 14.sp,
                                    color: AppColor.textColor,
                                    fontWeight: FontWeight.w500);
                              }),
                          SizedBox(width: 30.w),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Form(
                          key: watch.keyOTPCode,
                          child: PinCodeTextField(
                            appContext: context,
                            length: 6,
                            keyboardType: TextInputType.number,
                            autoFocus: true,
                            autoDismissKeyboard: true,
                            controller: watch.otpCodeController,
                            cursorColor: Colors.black,
                            cursorHeight: 20,
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColor.textColor,
                                fontSize: 18.sp),
                            pinTheme: PinTheme(
                              borderRadius: BorderRadius.circular(8.r),
                              shape: PinCodeFieldShape.box,
                              disabledColor: Colors.black54,
                              disabledBorderWidth: 2.w,
                              activeBorderWidth: 2.w,
                              fieldHeight: 50.h,
                              activeColor: AppColor.textColor,
                              inactiveBorderWidth: 1,
                              errorBorderColor: AppColor.errorColor,
                              inactiveColor: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: finished ? 20.h : 0),
                      finished
                          ? Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: AppText(
                                        text: "If you don't get the SMS code",
                                        size: 11.sp,
                                        color: AppColor.textColor,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: Container(
                                      height: 28.h,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1.w,
                                              color: AppColor.mainColor),
                                          borderRadius:
                                              BorderRadius.circular(4.r)),
                                      child: MaterialButton(
                                        onPressed: () async {
                                          timerController.reset();
                                          timerController.start();
                                          await AuthService.doUserExist(
                                              phone: widget.phone);
                                        },
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.r)),
                                        child: AppText(
                                            text: "Qayta yuborish",
                                            size: 11.sp,
                                            maxLines: 1,
                                            color: AppColor.mainColor,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : const SizedBox(),
                      SizedBox(height: 30.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: appButton(
                          text: "Davom etish",
                          color: AppColor.mainColor,
                          onPressed: () {
                            log(watch.otpCodeController.text);
                            read.activate(widget.phone);
                          },
                        ),
                      )
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
