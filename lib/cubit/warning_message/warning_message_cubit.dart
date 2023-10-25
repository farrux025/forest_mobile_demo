import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:forest_mobile/models/warning_message/WarningMessageCreateReq.dart';
import 'package:forest_mobile/models/warning_message/WarningMessageCreateRes.dart';
import 'package:forest_mobile/service/message_service.dart';
import 'package:forest_mobile/service/secure_storage.dart';

part 'warning_message_state.dart';

class WarningMessageCubit extends Cubit<WarningMessageState> {
  WarningMessageCubit() : super(WarningMessageInitial());

  var keyTitle = GlobalKey<FormState>();
  var keyDesc = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descController = TextEditingController();

  createWarningMessage() async {
    try {
      if (keyTitle.currentState!.validate() &&
          keyDesc.currentState!.validate()) {
        emit(WarningMessageLoading());

        var request = WarningMessageCreateReq(
            message: WarningMessage(
                type: 1,
                title: titleController.text.trim(),
                description: descController.text.trim()),
            images: []);
        String? phone;
        if (await SecureStorage.containsKey(key: SecureStorage.phone)) {
          phone = await SecureStorage.read(key: SecureStorage.phone);
        }
        log("Phone: ${phone ?? ''}");
        Response response;
        if (phone?.isEmpty ?? false || phone == null) {
          response = await MessageService.createWarningMessageAnonymousUser(
              request: request);
        } else {
          response = await MessageService.createWarningMessageKnownUser(
              request: request);
        }
        log("WarningMessageCreate Response: $response");
        if (response.statusCode == 201) {
          WarningMessageCreateRes resData =
              WarningMessageCreateRes.fromJson(response.data);
          emit(WarningMessageLoaded(resData));
        } else if (response.statusCode == 401) {
          log("WarningMessageError: ${response.data['detail']}");
          emit(WarningMessageError(response.data['detail']));
        }
      }
    } on DioException catch (exception) {
      log("WarningMessageCubit dio exception: $exception");
      emit(WarningMessageError(exception.error.toString()));
    } catch (error) {
      log("WarningMessageCubit error: $error");
      emit(WarningMessageError(error.toString()));
    }
  }
}
