import 'package:fluttemp/Utils/constants/app_colors.dart';
import 'package:fluttemp/Utils/constants/app_constants.dart';
import 'package:fluttemp/Utils/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class CenteredTextButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  final Color color;

  const CenteredTextButton._internal({
    super.key,
    required this.label,
    required this.onTap,
    required this.color,
  });

  factory CenteredTextButton.primary({
    Key? key,
    required String label,
    required Function() onTap,
    required BuildContext context,
  }) {
    return CenteredTextButton._internal(
      key: key,
      label: label,
      onTap: onTap,
      color: AppColorsTheme.dark().bgInput,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(color: color),
        child: Center(
          child: Text(
            label,
            style:
                AppTypography.main().defaultText.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
