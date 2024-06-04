import 'package:mayday/core/constants/app_constants.dart';
import 'package:mayday/features/shared/widgets/app_text.dart';
import 'package:flutter/material.dart';

class SOSBtn extends StatefulWidget {
  const SOSBtn({super.key, required this.ontap});
  final Function() ontap;

  @override
  State<SOSBtn> createState() => _SOSBtnState();
}

class _SOSBtnState extends State<SOSBtn> {
  late Function() ontap;
  bool touched = false;
  final AppColorsTheme _appColors = AppColorsTheme.dark();
  @override
  void initState() {
    super.initState();
    ontap = widget.ontap;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTapDown: (details) {
          setState(() {
            touched = true;
          });
        },
        onTapUp: (details) {
          setState(() {
            touched = false;
          });
        },
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: touched ? Colors.white : _appColors.highlight,
                width: 16),
            shape: BoxShape.circle,
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent, width: 12),
              shape: BoxShape.circle,
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: touched ? Colors.white : _appColors.highlight,
                    width: 2),
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 150,
                backgroundColor: Colors.transparent,
                child: AppText.bigTextDefault(
                  'S.O.S',
                  context: context,
                  size: 60,
                  color: touched ? Colors.white : _appColors.highlight,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
