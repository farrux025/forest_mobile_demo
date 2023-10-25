import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:forest_mobile/constants/variables.dart';
import 'package:forest_mobile/models/warning_message/EventTypeRes.dart';
import 'package:forest_mobile/service/dio_client.dart';

part 'event_type_state.dart';

class EventTypeCubit extends Cubit<EventTypeState> {
  EventTypeCubit() : super(EventTypeInitial());

  getEventList() async {
    emit(EventTypeLoading());
    try {
      Response<dynamic> response =
          await DioClient.instance.get(AppUrl.eventTypeListUrl);
      log("EventType response: $response");
      List<EventTypeRes> eventList = [];
      if (response.statusCode == 200) {
        if (response.data != null && response.data[0] != null) {
          response.data.forEach((event) {
            log("Event: $event");
            EventTypeRes eventTypeRes = EventTypeRes.fromJson(event);
            eventList.add(eventTypeRes);
          });
        }
        emit(EventTypeLoaded(eventList));
      }
    } on DioException catch (e) {
      log("EventType dio exception: $e");
      emit(EventTypeError(e.error.toString()));
    } catch (e) {
      log("EventType error: $e");
      emit(EventTypeError(e.toString()));
    }
  }
}
