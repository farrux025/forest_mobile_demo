import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:forest_mobile/components/app_components.dart';
import 'package:forest_mobile/models/ruxsatnoma/RuxsatnomaRequest.dart';
import 'package:forest_mobile/models/ruxsatnoma/RuxsatnomaResponse.dart';
import 'package:forest_mobile/service/ruxsatnoma/ruxsatnoma_service.dart';

part 'individual_state.dart';

class HayMakingIndividualCubit extends Cubit<HayMakingIndividualState> {
  HayMakingIndividualCubit() : super(HayMakingIndividualInitial());

  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var arizaTextController = TextEditingController();
  var sectionController = TextEditingController();
  var rotationController = TextEditingController();
  var massiveController = TextEditingController();
  var contourController = TextEditingController();
  var hectareController = TextEditingController();
  var weightController = TextEditingController();

  var hectareKey = GlobalKey<FormState>();
  var arizaTextKey = GlobalKey<FormState>();
  var addressKey = GlobalKey<FormState>();
  var phoneKey = GlobalKey<FormState>();
  var emailKey = GlobalKey<FormState>();

  haymakingIndividual() async {
    try {
      if (emailKey.currentState!.validate() &&
          phoneKey.currentState!.validate() &&
          addressKey.currentState!.validate() &&
          arizaTextKey.currentState!.validate() &&
          hectareKey.currentState!.validate()) {
        emit(HayMakingIndividualLoading());
        RuxsatnomaRequest request = RuxsatnomaRequest(
          email: emailController.text,
          phoneNumber: phoneController.text,
          address: addressController.text,
          description: arizaTextController.text,
          sectionInfo: sectionController.text,
          rotationInfo: int.parse(rotationController.text.trim()),
          massiveInfo: int.parse(massiveController.text.trim()),
          contourInfo: int.parse(contourController.text.trim()),
          hectare: int.parse(hectareController.text.trim()),
          weight: int.parse(weightController.text.trim()),
        );
        Response response =
            await RuxsatnomaService.getRuxsatnoma(request: request);
        log("Create ruxsatnoma response: $response");
        if (response.statusCode == 200) {
          RuxsatnomaResponse responseFromJson =
              RuxsatnomaResponse.fromJson(response.data);
          log("Create ruxsatnoma response: $responseFromJson");
          emit(HayMakingIndividualLoaded(responseFromJson));
        } else if (response.statusCode == 401) {
          openSnackBar(message: '${response.data['detail']}');
          emit(HayMakingIndividualError(response.data['detail']));
        }
      }
    } on DioException catch (exception) {
      log("haymakingIndividual dio exception: $exception");
      openSnackBar(message: exception.error.toString());
    } catch (error) {
      log("haymakingIndividual error: $error");
      openSnackBar(message: error.toString());
    }
  }
}
