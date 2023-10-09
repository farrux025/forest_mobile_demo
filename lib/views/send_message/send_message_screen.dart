import 'package:flutter/material.dart';

import '../../components/app_text.dart';

class SendMessageScreen extends StatelessWidget {
  const SendMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppText(text: 'Send Message'),
    );
  }
}
