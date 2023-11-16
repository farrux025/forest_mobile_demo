import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forest_mobile/main.dart';
import 'package:forest_mobile/views/app_scaffold.dart';
import 'package:forest_mobile/views/more/profile_screen.dart';
import 'package:forest_mobile/views/ruxsatnoma/ruxsatnoma_screen.dart';

class AppUrl {
  static const baseUrl = "https://forest.onemillion.uz";

  // auth-----------------------------------------------------------------------

  static const oneIDUrl = "/accounts/api/v1/one-id";
  static const userExistUrl = "/accounts/api/v1/login";
  static const registerUrl = "/accounts/api/v1/register";
  static const activateUrl = "/accounts/api/v1/activate";

  // ruxsatnoma-----------------------------------------------------------------

  static const bhmPriceUrl = "/forest/api/v1/bhm/price";
  static const regionsAndDepartmentsUrl = "/mobile/api/v1/region/list";
  static const createRuxsatnomaUrl = "/mobile/api/v1/application/create";

  // ---------------------------------------------------------------------------

  static const uploadImageUrl = "/message/api/v1/upload";
  static const sendWarningMessageUrl = "/message/api/v1/create";
  static const eventTypeListUrl = "/message/api/v1/type/list";
}

class MyValueNotifiers {
  static const uploadImageLoading = 'uploadImageLoading';
  static const uploadImageLoaded = 'uploadImageLoaded';
  static const uploadImageError = 'uploadImageError';
  static const uploadImageDefault = 'uploadImageDefault';

  // ---------------------------------------------------------------------------
  static ValueNotifier uploadImageNotifier =
      ValueNotifier<String>(uploadImageLoading);

// *****************************************************************************
}

class ScreenPath {
  static const appScaffold = '/appScaffold';
  static const ruxsatnoma = '/ruxsatnoma';
  static const profile = '/profile';

  static void pushToScreen(String path) {
    switch (path) {
      case appScaffold:
        MyApp.navigatorKey.currentState?.pushReplacement(
            MaterialPageRoute(builder: (context) => AppScaffold()));
        break;
      case ruxsatnoma:
        MyApp.navigatorKey.currentState?.pushReplacement(
            MaterialPageRoute(builder: (context) => const RuxsatnomaScreen()));
        break;
      case profile:
        MyApp.navigatorKey.currentState?.pushReplacement(
            MaterialPageRoute(builder: (context) => const ProfileScreen()));
        break;
    }
  }
}
