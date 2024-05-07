import 'package:fluttemp/Utils/constants/app_constants.dart';
import 'package:fluttemp/Utils/provider/app_providers.dart';
import 'package:fluttemp/View/Pages/HomeScreen/sos_btn.dart';
import 'package:fluttemp/View/shared/app_text.dart';
import 'package:fluttemp/View/shared/centred_text_button.dart';
import 'package:fluttemp/View/shared/vertical_gap.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class Home extends ConsumerWidget {
  Home({super.key});

  final AppColorsTheme _appColorsTheme = AppColorsTheme.dark();

  _scaffoldCtrller(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..removeCurrentSnackBar()
      ..removeCurrentMaterialBanner()
      ..hideCurrentMaterialBanner()
      ..showSnackBar(SnackBar(
          backgroundColor: _appColorsTheme.bgColor,
          content: AwesomeSnackbarContent(
              inMaterialBanner: true,
              color: _appColorsTheme.bgInput,
              title: 'Success',
              message: 'S.O.S signal sent to all emergency contacts',
              contentType: ContentType.success)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(contactProvider.notifier).getPermission();
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.go('/chat');
              },
              icon: const Icon(Icons.chat_rounded))
        ],
      ),
      drawer: Drawer(
        backgroundColor: _appColorsTheme.bgInput,
      ),
      backgroundColor: _appColorsTheme.bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          VerticalGap.custom(size.height / 10),
          AppText.subtitleDefault(
              textAlign: TextAlign.center,
              'Tap on the S.O.S button to send the alert signal to all your emergency contacts',
              context: context),
          VerticalGap.big(),
          SOSBtn(ontap: () {
            _scaffoldCtrller(context);
          }),
          VerticalGap.huge(),
          CenteredTextButton.primary(
              width: size.width / 2.3,
              label: 'Call Members',
              onTap: () {
                context.go('/call');
              },
              context: context)
        ],
      ),
    );
  }
}
