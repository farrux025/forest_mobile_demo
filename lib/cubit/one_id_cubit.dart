import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:forest_mobile/main.dart';
import 'package:forest_mobile/service/auth_service.dart';
import 'package:forest_mobile/views/auth/one_id_screen.dart';

part 'one_id_state.dart';

class OneIDCubit extends Cubit<OneIDState> {
  OneIDCubit() : super(OneIDInitial());

  loginByOneID() async {
    emit(OneIDLoading());
    try {
      await AuthService.doLoginByOneID().then((response) {
        if (response.statusCode == 200) {
          var url = response.data['url'];
          log("One ID url: $url");
          MyApp.navigatorKey.currentState?.push(
              MaterialPageRoute(builder: (context) => OneIDScreen(url: url),));
          emit(OneIDLoaded());
        }
      });
    } on DioException catch (e) {
      emit(OneIDError());
      log("Error in ONE ID: $e");
    }
  }
}
