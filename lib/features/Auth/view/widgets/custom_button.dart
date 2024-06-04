import 'package:mayday/core/constants/app_colors.dart';
import 'package:mayday/features/shared/widgets/app_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  CustomButton({super.key, required this.text, required this.function});
  String text;
  Function function;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  final AppColorsTheme _appColorsTheme = AppColorsTheme.dark();
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          backgroundColor: WidgetStatePropertyAll(_appColorsTheme.highlight)),
      onPressed: () => widget.function(),
      child: AppText.defaultTextBold(
        widget.text,
        context: context,
        size: 20,
      ),
    );
  }
}
