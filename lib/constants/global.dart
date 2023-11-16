import 'package:forest_mobile/service/hive/hive_store.dart';

import '../models/auth/OneIDLoginResponse.dart';

class Global {
  static bool isLogin = HiveStore.oneIdResBox.isNotEmpty &&
      HiveStore.oneIdResBox.get(MyHiveBoxName.oneIDResBox) != null;

  static OneIDLoginResponse? getUserDataByOneID() {
    OneIDLoginResponse? oneIDLoginResponse =
        HiveStore.oneIdResBox.get(MyHiveBoxName.oneIDResBox);
    return oneIDLoginResponse;
  }
}

class AuthType {
  static String oneId = 'OneID';
  static String phone = 'Phone';
}
