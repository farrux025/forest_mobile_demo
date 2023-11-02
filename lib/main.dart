import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forest_mobile/service/dio_client.dart';
import 'package:forest_mobile/service/hive/hive_store.dart';
import 'package:forest_mobile/service/location_service.dart';
import 'package:forest_mobile/service/secure_storage.dart';
import 'package:forest_mobile/views/app_scaffold.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'firebase_options.dart';

void main() async {
  AndroidYandexMap.useAndroidViewSurface = false;
  WidgetsFlutterBinding.ensureInitialized();
  LocationService.listen;
  await LocationService.determinePosition();
  await DioClient.init();
  await HiveStore.init();
  SecureStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static var navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: 'Forest Mobile',
        debugShowCheckedModeBanner: false,
        navigatorKey: MyApp.navigatorKey,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true),
        home: AppScaffold(),
      ),
    );
  }
}
