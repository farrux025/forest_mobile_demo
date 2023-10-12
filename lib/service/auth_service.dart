import 'package:dio/dio.dart';
import 'package:forest_mobile/constants/variables.dart';
import 'package:forest_mobile/service/dio_client.dart';

class AuthService {
  static Future<Response> doLoginByOneID() async {
    var response = await DioClient.instance.post(AppUrl.oneIDUrl);
    return response;
  }
}
