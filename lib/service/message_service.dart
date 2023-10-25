import 'package:dio/dio.dart';
import 'package:forest_mobile/constants/variables.dart';
import 'package:forest_mobile/models/warning_message/WarningMessageCreateReq.dart';
import 'package:forest_mobile/service/dio_client.dart';
import 'package:forest_mobile/service/secure_storage.dart';

class MessageService {
  static Future<Response> createWarningMessageKnownUser(
      {required WarningMessageCreateReq request}) async {
    String token = '';
    if (await SecureStorage.containsKey(key: SecureStorage.token)) {
      token = await SecureStorage.read(key: SecureStorage.token);
    }
    Response knownUserResponse = await DioClient.instance.post(
        AppUrl.sendWarningMessageUrl,
        options: Options(headers: {"Authorization": token}),
        data: {
          "message": {
            "type": request.message?.type,
            "title": request.message?.title,
            "description": request.message?.description
          },
          "images": request.images
        });
    return knownUserResponse;
  }

  static Future<Response> createWarningMessageAnonymousUser(
      {required WarningMessageCreateReq request}) async {
    Response anonymousUserResponse =
        await DioClient.instance.post(AppUrl.sendWarningMessageUrl, data: {
      "message": {
        "type": request.message?.type,
        "title": request.message?.title,
        "description": request.message?.description
      },
      "images": request.images
    });
    return anonymousUserResponse;
  }
}
