import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static late FlutterSecureStorage secureStorage;

  // keys
  static const phone = 'phone';
  static const authType = 'auth_type';
  static const userId = 'user_id';
  static const token = 'token';

  static init() {
    log("SecureStorage init");
    secureStorage = const FlutterSecureStorage();
  }

  static Future write({required String key, required String value}) async {
    return await secureStorage.write(key: key, value: value);
  }

  static Future read({required String key}) async {
    return await secureStorage.read(key: key);
  }

  static Future delete({required String key}) async {
    return await secureStorage.delete(key: key);
  }

  static clearSecureStorage() async {
    await SecureStorage.delete(key: SecureStorage.phone);
    await SecureStorage.delete(key: SecureStorage.authType);
    await SecureStorage.delete(key: SecureStorage.token);
    await SecureStorage.delete(key: SecureStorage.userId);
  }

  static Future<bool> containsKey({required String key}) async {
    return await secureStorage.containsKey(key: key);
  }
}
