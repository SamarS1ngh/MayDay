import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mayday/core/constants/app_colors.dart';
import 'package:mayday/core/constants/app_constants.dart';
import 'package:mayday/features/Auth/view/widgets/custom_button.dart';
import 'package:mayday/features/shared/widgets/app_text.dart';
import 'package:mayday/features/shared/widgets/vertical_gap.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final FirebaseAuth auth = FirebaseAuth.instance;
  String countryCode = '91';
  final TextEditingController phnNumber = TextEditingController();
  final TextEditingController nameCtrllr = TextEditingController();

  void sendOtp(BuildContext context) async {
    await auth.verifyPhoneNumber(
        phoneNumber: '+${countryCode + phnNumber.text}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          log(e.toString());
        },
        codeSent: (String verificationId, int? resendToken) async {
          context.go('/otp', extra: {
            "phnNumber": countryCode + phnNumber.text,
            "verificationId": verificationId,
          });
        },
        timeout: const Duration(seconds: 60),
        codeAutoRetrievalTimeout: (String verificationId) {
          log('time out happened');
        });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final AppColorsTheme _appColorsTheme = AppColorsTheme.dark();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _appColorsTheme.bgColor,
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView(
            children: [
              VerticalGap.custom(size.height / 5),
              AppText.bigTextBold(AppString.welcomeBack,
                  textAlign: TextAlign.center, size: 26, context: context),
              VerticalGap.big(),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: AppText.defaultText(AppString.enterNumber,
                    size: 16, context: context),
              ),
              VerticalGap.small(),
              IntlPhoneField(
                cursorColor: _appColorsTheme.highlight,
                style: TextStyle(color: _appColorsTheme.textDefault),
                dropdownTextStyle:
                    TextStyle(color: _appColorsTheme.textDefault),
                decoration: InputDecoration(
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: _appColorsTheme.snackBarFailure)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: _appColorsTheme.highlight)),
                    labelText: AppString.phone,
                    isDense: true,
                    floatingLabelStyle:
                        TextStyle(color: _appColorsTheme.highlight),
                    focusColor: _appColorsTheme.highlight,
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54))),
                controller: phnNumber,
                initialCountryCode: 'IN',
                invalidNumberMessage: AppString.invalidNumber,
                onCountryChanged: (value) {
                  countryCode = value.dialCode;
                  log(countryCode);
                },
              ),
              VerticalGap.medium(),
              CustomButton(
                text: AppString.logmein,
                function: () {
                  sendOtp(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    context.go('/');
                  },
                  child: RichText(
                    textAlign: TextAlign.right,
                    text: TextSpan(text: AppString.newUser, children: [
                      TextSpan(
                          text: ' ${AppString.signup}',
                          style: TextStyle(color: _appColorsTheme.highlight))
                    ]),
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            'assets/pngwing.com2.png',
            fit: BoxFit.cover,
          ),
        ),
      ]),
    );
  }
}
