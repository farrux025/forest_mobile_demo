import 'dart:developer';

import 'package:flutter/material.dart';
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
      appBar: AppBar(),
      body: SafeArea(child: WebViewWidget(controller: webViewController)),
    );
  }
}
