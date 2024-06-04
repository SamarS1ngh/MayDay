import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mayday/core/constants/app_constants.dart';
import 'package:mayday/features/shared/widgets/app_text.dart';
import 'package:mayday/features/shared/widgets/centred_text_button.dart';
import 'package:mayday/features/shared/widgets/vertical_gap.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({
    super.key,
    required this.phnNumber,
    required this.verificationId,
  });
  String phnNumber;
  String verificationId;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    final TextEditingController _otpController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppColorsTheme.dark().bgColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText.bigTextBold('${AppString.enterOTP} +${widget.phnNumber}',
                size: 30, context: context),
            VerticalGap.medium(),
            Pinput(
              defaultPinTheme: PinTheme(
                  height: height / 15,
                  width: width / 6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColorsTheme.dark().bgInput),
                  textStyle: const TextStyle(color: Colors.white)),
              closeKeyboardWhenCompleted: true,
              controller: _otpController,
              keyboardType: TextInputType.number,
              length: 6,
              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsRetrieverApi,
              hapticFeedbackType: HapticFeedbackType.mediumImpact,
            ),
            VerticalGap.big(),
            CenteredTextButton.primary(
                label: AppString.verify,
                onTap: () async {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: _otpController.text);
                  await auth.signInWithCredential(credential);

                  context.go('/home');
                },
                context: context)
          ],
        ),
      ),
    );
  }
}
