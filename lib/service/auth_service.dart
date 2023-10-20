import 'package:dio/dio.dart';
import 'package:forest_mobile/constants/variables.dart';
import 'package:forest_mobile/models/auth/ActivateRequest.dart';
import 'package:forest_mobile/models/auth/RegisterRequest.dart';
import 'package:forest_mobile/service/dio_client.dart';

class AuthService {
  static Future<Response> doLoginByOneID() async {
    var response = await DioClient.instance.post(AppUrl.oneIDUrl);
    return response;
  }

  // ---------------------------------------------------------------------------

  static Future<Response> doUserExist({required String phone}) async {
    var response = await DioClient.instance
        .post(AppUrl.userExistUrl, data: {"phone": phone});
    return response;
  }

  // ---------------------------------------------------------------------------

  static Future<Response> doRegister(RegisterRequest registerRequest) async {
    var response = await DioClient.instance.post(AppUrl.registerUrl, data: {
      "phone": registerRequest.phone,
      "first_name": registerRequest.firstName,
      "sur_name": registerRequest.lastName
    });
    return response;
  }

  // ---------------------------------------------------------------------------

  static Future<Response> doActivate(ActivateRequest activateRequest) async {
    var response = await DioClient.instance.post(AppUrl.activateUrl, data: {
      "phone": activateRequest.phone,
      "device_token": activateRequest.deviceToken,
      "device_type": activateRequest.deviceType,
      "code": activateRequest.code,
    });
    return response;
  }
}
