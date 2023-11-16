import 'dart:developer';

import 'package:forest_mobile/models/auth/OneIDLoginResponse.dart';
import 'package:forest_mobile/models/auth/OneIdResData.dart';
import 'package:forest_mobile/models/region/RegionChildren.dart';
import 'package:forest_mobile/models/region/RegionResponse.dart';
import 'package:forest_mobile/models/bhm/BHMPrice.dart';
import 'package:forest_mobile/models/warning_message/EventTypeRes.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveStore {
  static late Box<List<EventTypeRes>> eventTypeResListBox;
  static late Box<OneIDLoginResponse> oneIdResBox;
  static late Box<BhmPrice> bhmPriceBox;
  static late Box<List<RegionResponse>> regionListBox;

  static init() async {
    log("Hive store init");
    await Hive.initFlutter();
    registerAdapters();
    await openBoxes();
  }

  static Future openBoxes() async {
    eventTypeResListBox = await Hive.openBox(MyHiveBoxName.eventTypeResListBox);
    oneIdResBox = await Hive.openBox(MyHiveBoxName.oneIDResBox);
    bhmPriceBox = await Hive.openBox(MyHiveBoxName.bhmPriceBox);
    regionListBox = await Hive.openBox(MyHiveBoxName.regionListBox);
  }

  static registerAdapters() {
    Hive.registerAdapter(EventTypeResAdapter());
    Hive.registerAdapter(OneIDLoginResponseAdapter());
    Hive.registerAdapter(OneIdResDataAdapter());
    Hive.registerAdapter(BhmPriceAdapter());
    Hive.registerAdapter(RegionResponseAdapter());
    Hive.registerAdapter(RegionChildrenAdapter());
  }

  static Future clearBoxes() async {
    log("Hive boxes cleared");
    await eventTypeResListBox.clear();
    await oneIdResBox.clear();
    await bhmPriceBox.clear();
    await regionListBox.clear();
  }
}

class MyHiveBoxName {
  static const String eventTypeResListBox = "eventTypeResListBox";
  static const String oneIDResBox = "oneIDResBox";
  static const String bhmPriceBox = "bhmPriceBox";
  static const String regionListBox = "regionListBox";
}

class MyHiveTypeId {
  static const int eventTypeResID = 1;
  static const int oneIDResBoxID = 2;
  static const int bhmPriceBoxID = 3;
  static const int regionListBoxID = 4;
}

class HiveSaver {
  static saveEventTypeRes(List<EventTypeRes> eventTypeList) {
    HiveStore.eventTypeResListBox
        .put(MyHiveBoxName.eventTypeResListBox, eventTypeList);
    log("EventTypes are saved");
    var list =
        HiveStore.eventTypeResListBox.get(MyHiveBoxName.eventTypeResListBox);
    list?.forEach((element) {
      log("EventType: ${element.name}");
    });
  }

  static saveOneIDLoginResponse(OneIDLoginResponse oneIDLoginResponse) {
    HiveStore.oneIdResBox.put(MyHiveBoxName.oneIDResBox, oneIDLoginResponse);
    log("OneIDLoginResponse is saved");
    var data = HiveStore.oneIdResBox.get(MyHiveBoxName.oneIDResBox)?.data;
    log("Email: ${data?.email}");
  }

  static saveBhmPrice(BhmPrice bhmPrice) {
    HiveStore.bhmPriceBox.put(MyHiveBoxName.bhmPriceBox, bhmPrice);
    log("BhmPrice is saved");
    var bhm = HiveStore.bhmPriceBox.get(MyHiveBoxName.bhmPriceBox)?.bhm;
    log("BHM: $bhm");
  }

  static saveRegionsAndDepartments(List<RegionResponse> regions) {
    HiveStore.regionListBox.put(MyHiveBoxName.regionListBox, regions);
    log("Regions are saved");
    var list = HiveStore.regionListBox.get(MyHiveBoxName.regionListBox);
    list?.forEach((element) {
      log("Region: ${element.name}");
    });
  }
}
