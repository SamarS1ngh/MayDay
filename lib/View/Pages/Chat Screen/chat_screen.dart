import 'package:fluttemp/Utils/constants/app_colors.dart';
import 'package:fluttemp/View/shared/app_text.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsTheme.dark().bgColor,
      appBar: AppBar(
        title: AppText.bigTextDefault(
          'Inbox',
          context: context,
          size: 33,
        ),
      ),
    );
  }
}
