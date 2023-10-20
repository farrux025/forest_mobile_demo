import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:forest_mobile/models/auth/ActivateRequest.dart';
import 'package:forest_mobile/models/auth/ActivateResponse.dart';
import 'package:forest_mobile/service/auth_service.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());

  var keyOTPCode = GlobalKey<FormState>();
  var otpCodeController = TextEditingController();

  activate(String phone) async {
    emit(OtpLoading());
    try {
      ActivateRequest activateRequest = ActivateRequest(
          phone: phone,
          deviceToken: "test deviceToken",
          deviceType: "test deviceType",
          code: otpCodeController.text.trim());
      var response = await AuthService.doActivate(activateRequest);
      ActivateResponse activateResponse =
          ActivateResponse.fromJson(response.data);
      if (activateResponse.success ?? false) {
        log("User activated Successfully");
        emit(OtpLoaded(activateResponse.success));
      } else {
        log("User not activated");
        emit(OtpLoaded(activateResponse.success));
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
