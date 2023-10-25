import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:forest_mobile/components/functions.dart';
import 'package:forest_mobile/models/auth/UserExistResponse.dart';
import 'package:forest_mobile/service/auth_service.dart';

part 'user_exist_state.dart';

class UserExistCubit extends Cubit<UserExistState> {
  UserExistCubit() : super(UserExistInitial());

  var keyPhone = GlobalKey<FormState>();
  var phoneController = TextEditingController();

  userExist() async {
    try {
      if (keyPhone.currentState!.validate()) {
        emit(UserExistLoading());
        closeKeyboard();
        String number = PREFIX_PHONE + phoneController.text;
        var phone = getPhone(phone: number);
        log("Phone: $phone");
        var response = await AuthService.doUserExist(phone: phone);
        log("UserExistResponse: $response");
        var userExistResponse = UserExistResponse.fromJson(response.data);
        if (userExistResponse.success ?? false) {
          emit(UserExistLoaded(userExistResponse.success, phone));
          log("$phone is exist");
        } else {
          emit(UserExistError(userExistResponse.msg ?? '$phone is not exist'));
          log("$phone is not exist");
        }
      }
    } on DioException catch (exp) {
      log("UserExistCubit Dio exception: $exp");
      emit(UserExistError(exp.error.toString()));
    } catch (error) {
      log("UserExistCubit error: $error");
      emit(UserExistError(error.toString()));
    }
  }
}
