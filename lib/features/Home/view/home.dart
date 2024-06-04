import 'package:mayday/core/constants/app_constants.dart';
import 'package:mayday/Utils/provider/app_providers.dart';
import 'package:mayday/features/Home/view/widgets/sos_btn.dart';
import 'package:mayday/features/shared/widgets/app_text.dart';
import 'package:mayday/features/shared/widgets/centred_text_button.dart';
import 'package:mayday/features/shared/widgets/vertical_gap.dart';
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
              message: AppString.alertSent,
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
              AppString.tapToAlert,
              context: context),
          VerticalGap.big(),
          SOSBtn(ontap: () {
            _scaffoldCtrller(context);
          }),
          VerticalGap.huge(),
          CenteredTextButton.primary(
              width: size.width / 2.3,
              label: AppString.callMembers,
              onTap: () {
                context.go('/call');
              },
              context: context)
        ],
      ),
    );
  }
}
