import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

closeKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

call({required String phone}) async {
  // await FlutterPhoneDirectCaller.callNumber(phone);
  launchUrl(Uri.parse("tel:$phone"));
}
