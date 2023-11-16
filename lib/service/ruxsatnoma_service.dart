import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:forest_mobile/components/app_components.dart';
import 'package:forest_mobile/constants/variables.dart';
import 'package:forest_mobile/models/region/RegionResponse.dart';
import 'package:forest_mobile/models/bhm/BHMPrice.dart';
import 'package:forest_mobile/service/dio_client.dart';
import 'package:forest_mobile/service/hive/hive_store.dart';

class RuxsatnomaService {
  static getBHMPrice() async {
    try {
      Response response = await DioClient.instance.get(AppUrl.bhmPriceUrl);
      log("Bhm price response: $response");
      if (response.statusCode == 200) {
        BhmPrice bhmPrice = BhmPrice.fromJson(response.data);
        HiveSaver.saveBhmPrice(bhmPrice);
      }
    } catch (exception) {
      toast(message: "BHM narxini olib kelishda xatolik!");
      log("Error in getBHMPrice: $exception");
    }
  }

  static getRegionsAndDepartments() async {
    try {
      List<RegionResponse> regions = [];
      Response response =
          await DioClient.instance.get(AppUrl.regionsAndDepartmentsUrl);
      log("Regions and departments response: $response");
      if (response.statusCode == 200) {
        if (response.data != null && response.data[0] != null) {
          response.data.map((region) {
            RegionResponse regionResponse = RegionResponse.fromJson(region);
            regions.add(regionResponse);
            return regionResponse;
          }).toList();
          HiveSaver.saveRegionsAndDepartments(regions);
        }
      }
    } catch (exception) {
      toast(message: "O'rmon xo'jaliklarini olib kelishda xatolik!");
      log("Error in getRegionsAndDepartments: $exception");
    }
  }
}
