import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:forest_mobile/models/auth/RegisterRequest.dart';
import 'package:forest_mobile/models/auth/RegisterResponse.dart';
import 'package:forest_mobile/service/auth_service.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  var keyFirstname = GlobalKey<FormState>();
  var keyLastname = GlobalKey<FormState>();

  // var keyEmail = GlobalKey<FormState>();
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();

  // var emailController = TextEditingController();

  register(String phone) async {
    emit(RegisterLoading());
    try {
      if (keyFirstname.currentState!.validate() &&
          keyLastname.currentState!.validate()) {
        RegisterRequest registerRequest = RegisterRequest(
            phone: phone,
            firstName: firstnameController.text.trim(),
            lastName: lastnameController.text.trim());
        var response = await AuthService.doRegister(registerRequest);
        log("RegisterResponse: $response");
        RegisterResponse registerResponse =
            RegisterResponse.fromJson(response.data);
        if (registerResponse.success ?? false) {
          log("Register is successful\n");
          emit(RegisterLoaded(registerResponse.success));
        } else {
          log("Register is not successful\n");
          emit(RegisterLoaded(registerResponse.success));
        }
      }
    } on DioException catch (exp) {
      log("RegisterCubit dio exception: $exp");
      emit(RegisterError(exp.error.toString()));
    } catch (error) {
      log("RegisterCubit error: $error");
      emit(RegisterError(error.toString()));
    }
  }
}
