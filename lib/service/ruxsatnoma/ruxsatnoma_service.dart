import 'package:dio/dio.dart';
import 'package:forest_mobile/constants/variables.dart';
import 'package:forest_mobile/models/ruxsatnoma/RuxsatnomaRequest.dart';
import 'package:forest_mobile/service/dio_client.dart';
import 'package:forest_mobile/service/secure_storage.dart';

class RuxsatnomaService {
  static Future<Response> getRuxsatnoma(
      {required RuxsatnomaRequest request}) async {
    String token = await SecureStorage.read(key: SecureStorage.token);
    Response response = await DioClient.instance.post(
        AppUrl.createRuxsatnomaUrl,
        options: Options(headers: {'Authorization': 'Token $token'}),
        data: {
          "email": "${request.email}",
          "phone_number": "${request.phoneNumber}",
          "passpord": "${request.passpord}",
          "username": "${request.username}",
          "stir": "${request.stir}",
          "address": "${request.address}",
          "company_name": "${request.companyName}",
          "company_director": "${request.companyDirector}",
          "company_bank_name": "${request.companyBankName}",
          "company_mfo": "${request.companyMfo}",
          "company_phone": "${request.companyPhone}",
          "company_account_number": "${request.companyAccountNumber}",
          "company_address": "${request.companyAddress}",
          "type": "${request.type}",
          "is_legal": request.isLegal,
          "animals": {
            "big_animals": {
              "big_cattle": request.animals?.bigAnimals?.bigCattle ?? 0,
              "big_horse": request.animals?.bigAnimals?.bigHorse ?? 0,
              "big_camels": request.animals?.bigAnimals?.bigCamels ?? 0,
              "big_donkey": request.animals?.bigAnimals?.bigDonkey ?? 0
            },
            "mid_animals": {
              "mid_cattle": request.animals?.midAnimals?.midCattle ?? 0,
              "mid_horse": request.animals?.midAnimals?.midHorse ?? 0,
              "mid_camels": request.animals?.midAnimals?.midCamels ?? 0,
              "mid_donkey": request.animals?.midAnimals?.midDonkey ?? 0
            },
            "big_sheep": {
              "big_sheep": request.animals?.bigSheep?.bigSheep ?? 0,
              "big_goat": request.animals?.bigSheep?.bigGoat ?? 0
            },
            "mid_sheep": {
              "mid_sheep": request.animals?.midSheep?.midSheep ?? 0,
              "mid_goat": request.animals?.midSheep?.midGoat ?? 0
            }
          },
          "description": "${request.description}",
          "department": request.department,
          "section_info": "${request.sectionInfo}",
          "rotation_info": request.rotationInfo,
          "contour_info": request.contourInfo,
          "massive_info": request.massiveInfo,
          "hectare": request.hectare ?? 0,
          "weight": request.weight ?? 0
        });
    return response;
  }
}
