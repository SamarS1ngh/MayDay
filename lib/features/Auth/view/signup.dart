import 'dart:developer';

import 'package:mayday/core/constants/app_colors.dart';
import 'package:mayday/core/constants/app_constants.dart';
import 'package:mayday/features/Auth/view/widgets/custom_button.dart';
import 'package:mayday/features/Auth/view/widgets/custom_textfield.dart';
import 'package:mayday/features/shared/widgets/app_text.dart';
import 'package:mayday/features/shared/widgets/vertical_gap.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final TextEditingController _phnNumber = TextEditingController();
    final TextEditingController nameCtrllr = TextEditingController();

    final AppColorsTheme _appColorsTheme = AppColorsTheme.dark();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _appColorsTheme.bgColor,
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView(
            children: [
              VerticalGap.custom(size.height / 6),
              AppText.bigTextBold(AppString.welcome,
                  textAlign: TextAlign.center, size: 26, context: context),
              VerticalGap.big(),
              CustomTextField(
                labelText: AppString.name,
                textEditingController: nameCtrllr,
                prefixIcon: const Icon(
                  Icons.person,
                  size: 24,
                ),
              ),
              VerticalGap.medium(),
              IntlPhoneField(
                onChanged: (value) {
                  log(value.countryCode + value.number);
                },
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
                controller: _phnNumber,
                initialCountryCode: 'IN',
                invalidNumberMessage: AppString.invalidNumber,
              ),
              VerticalGap.big(),
              CustomButton(
                text: 'Register',
                function: () {},
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    context.go('/login');
                  },
                  child: RichText(
                    textAlign: TextAlign.right,
                    text: TextSpan(text: AppString.alreadyauser, children: [
                      TextSpan(
                          text: AppString.login,
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
            'assets/pngwing.com.png',
            fit: BoxFit.cover,
          ),
        ),
      ]),
    );
  }
}
