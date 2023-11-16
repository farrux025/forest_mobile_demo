import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:forest_mobile/components/app_components.dart';
import 'package:forest_mobile/constants/colors.dart';
import 'package:forest_mobile/constants/variables.dart';
import 'package:forest_mobile/models/auth/OneIDLoginResponse.dart';
import 'package:forest_mobile/service/dio_client.dart';
import 'package:forest_mobile/service/hive/hive_store.dart';
import 'package:forest_mobile/service/secure_storage.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../main.dart';
import '../app_scaffold.dart';

class OneIDScreen extends StatefulWidget {
  final String url;
  final String? screenPath;

  const OneIDScreen({Key? key, required this.url, this.screenPath})
      : super(key: key);

  @override
  State<OneIDScreen> createState() => _OneIDScreenState();
}

class _OneIDScreenState extends State<OneIDScreen> {
  late WebViewController webViewController;

  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            log("Started url; $url");
          },
          onPageFinished: (String url) {
            log("Finished url; $url");
          },
          onWebResourceError: (WebResourceError error) {
            log("onWebResourceError; $error");
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.contains('?code=')) {
              log("request url: ${request.url}");
              login(request.url);
              return NavigationDecision.navigate;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..clearLocalStorage()
    // ..loadHtmlString(widget.url,baseUrl: widget.url);
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF4C06AA),
          leading: const BackButton(color: Colors.white)),
      body: SafeArea(child: WebViewWidget(controller: webViewController)),
    );
  }

  login(String url) async {
    try {
      var context = MyApp.navigatorKey.currentState?.context;
      String platform = '';
      bool isAndroid = Theme
          .of(context!)
          .platform == TargetPlatform.android;
      bool isIOS = Theme
          .of(context)
          .platform == TargetPlatform.iOS;
      if (isAndroid) platform = TargetPlatform.android.name;
      if (isIOS) platform = TargetPlatform.iOS.name;
      var deviceToken = await FirebaseMessaging.instance.getToken();
      log("Token: $deviceToken, Platform: $platform");
      Response response = await DioClient.instance
          .get(url.replaceAll(AppUrl.baseUrl, ""), queryParameters: {
        "device_id": deviceToken,
        "device_model": platform
      });
      if (response.statusCode == 200) {
        log("OneID login response: $response");
        openSnackBar(
            message: "One ID login iss successful",
            background: AppColor.mainColor.withOpacity(0.8));
        var data = OneIDLoginResponse.fromJson(response.data);
        log("Token: ${data.accessToken}");
        HiveSaver.saveOneIDLoginResponse(data);
        await SecureStorage.write(
            key: SecureStorage.token, value: data.accessToken ?? 'Error token');
        await SecureStorage.write(
            key: SecureStorage.authType,
            value: data.data?.authType ?? 'Error authType');
        await SecureStorage.write(
            key: SecureStorage.phone, value: data.data?.phone ?? 'Error phone');
        ScreenPath.pushToScreen(widget.screenPath ?? ScreenPath.appScaffold);
        // MyApp.navigatorKey.currentState?.pushReplacement(
        //     MaterialPageRoute(builder: (context) => AppScaffold()));
      }
    } on DioException catch (error) {
      log("Dio Error one id screen catch: $error");
    } catch (e) {
      log("Error one id screen catch: $e");
    }
  }
}
