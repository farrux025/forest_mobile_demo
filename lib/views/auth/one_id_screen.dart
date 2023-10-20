import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:forest_mobile/constants/variables.dart';
import 'package:forest_mobile/service/dio_client.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../main.dart';
import '../app_scaffold.dart';

class OneIDScreen extends StatefulWidget {
  final String url;

  const OneIDScreen({Key? key, required this.url}) : super(key: key);

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
              MyApp.navigatorKey.currentState?.pushReplacement(
                  MaterialPageRoute(builder: (context) => AppScaffold()));
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
      Response response = await DioClient.instance
          .get(url.replaceAll(AppUrl.baseUrl, ""), queryParameters: {
        // "device_id":"test_id",
        // "device_model":"test_model"
      });
      if (response.statusCode == 200) {
        log("OneID login response: $response");
      }
    } on DioException catch (error) {
      log("Dio Error one id screen catch: $error");
    } catch (e) {
      log("Error one id screen catch: $e");
    }
  }
}
