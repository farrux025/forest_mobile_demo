import 'dart:developer';

import 'package:forest_mobile/models/warning_message/EventTypeRes.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveStore {
  static late Box<List<EventTypeRes>> eventTypeResListBox;

  static init() async {
    log("Hive store init");
    await Hive.initFlutter();
    registerAdapters();
    await openBoxes();
  }

  static Future openBoxes() async {
    eventTypeResListBox = await Hive.openBox(MyHiveBoxName.eventTypeResListBox);
  }

  static registerAdapters() {
    Hive.registerAdapter(EventTypeResAdapter());
  }

  static Future clearBoxes() async {
    log("Hive boxes cleared");
    await eventTypeResListBox.clear();
  }
}

class MyHiveBoxName {
  static const String eventTypeResListBox = "eventTypeResListBox";
}

class MyHiveTypeId {
  static const int eventTypeResID = 1;
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
}
