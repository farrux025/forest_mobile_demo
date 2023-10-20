import 'package:flutter/cupertino.dart';

class AppUrl {
  static const baseUrl = "https://7bff-213-230-114-157.ngrok-free.app";

  // auth-----------------------------------------------------------------------

  static const oneIDUrl = "/accounts/api/v1/one-id";
  static const userExistUrl = "/accounts/api/v1/login";
  static const registerUrl = "/accounts/api/v1/register";
  static const activateUrl = "/accounts/api/v1/activate";

  // ---------------------------------------------------------------------------

  static const uploadImageUrl = "/message/api/v1/upload";
  static const sendWarningMessageUrl = "/message/api/v1/create";
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
