import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:forest_mobile/components/app_components.dart';
import 'package:forest_mobile/constants/colors.dart';
import 'package:forest_mobile/main.dart';
import 'package:forest_mobile/models/auth/ActivateRequest.dart';
import 'package:forest_mobile/models/auth/ActivateResponse.dart';
import 'package:forest_mobile/service/auth_service.dart';

import '../../service/secure_storage.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());

  var keyOTPCode = GlobalKey<FormState>();
  var otpCodeController = TextEditingController();

  activate(String phone) async {
    emit(OtpLoading());
    try {
      var context = MyApp.navigatorKey.currentState?.context;
      String platform = '';
      bool isAndroid = Theme.of(context!).platform == TargetPlatform.android;
      bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
      if (isAndroid) platform = TargetPlatform.android.name;
      if (isIOS) platform = TargetPlatform.iOS.name;
      var deviceToken = await FirebaseMessaging.instance.getToken();
      log("Token: $deviceToken, Platform: $platform");
      if (keyOTPCode.currentState!.validate()) {
        ActivateRequest activateRequest = ActivateRequest(
            phone: phone,
            deviceToken: deviceToken,
            deviceType: platform,
            code: otpCodeController.text.trim());
        var response = await AuthService.doActivate(activateRequest);
        log("ActivateResponse: $response");
        ActivateResponse activateResponse =
            ActivateResponse.fromJson(response.data);
        if (activateResponse.success ?? false) {
          log("User activated Successfully");
          openSnackBar(
              message: "User activated Successfully",
              background: AppColor.mainColor.withOpacity(0.8));
          await SecureStorage.write(
              key: SecureStorage.token,
              value: activateResponse.accessToken ?? 'Error token');
          await SecureStorage.write(
              key: SecureStorage.authType,
              value: activateResponse.data?.authType ?? 'Error authType');
          await SecureStorage.write(
              key: SecureStorage.phone,
              value: activateResponse.data?.phone ?? 'Error phone');
          emit(OtpLoaded(activateResponse.success, phone));
        } else {
          log("User not activated");
          emit(OtpError(activateResponse.msg ?? 'User not activated'));
        }
      }
    } on DioException catch (exp) {
      log("OtpCubit dio exception: $exp");
      emit(OtpError(exp.error.toString()));
    } catch (error) {
      log("OtpCubit error: $error");
      emit(OtpError(error.toString()));
    }
  }
}
