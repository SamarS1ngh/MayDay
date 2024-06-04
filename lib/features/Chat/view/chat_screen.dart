import 'package:mayday/core/constants/app_constants.dart';
import 'package:mayday/features/shared/widgets/app_text.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsTheme.dark().bgColor,
      appBar: AppBar(
        title: AppText.bigTextDefault(
          AppString.inbox,
          context: context,
          size: 33,
        ),
      ),
    );
  }
}
