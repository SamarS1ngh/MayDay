import 'package:contacts_service/contacts_service.dart';
import 'package:mayday/core/constants/app_constants.dart';
import 'package:mayday/Utils/provider/app_providers.dart';
import 'package:mayday/features/shared/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CallScreen extends ConsumerWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Contact> contacts = ref.watch(contactProvider.notifier).contacts;
    return Scaffold(
      backgroundColor: AppColorsTheme.dark().bgColor,
      appBar: AppBar(
        title: AppText.bigTextDefault(AppString.contacts,
            size: 33, context: context),
      ),
      body: contacts.isEmpty
          ? Center(
              child: AppText.subtitleDefault(AppString.addContactPermission,
                  context: context),
            )
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    tileColor: AppColorsTheme.dark().bgInput.withAlpha(150),
                    onTap: () {
                      launchUrlString(
                          "tel://${contacts[index].phones!.first.value}");
                    },
                    title: AppText.defaultText(
                        size: 20,
                        contacts[index].displayName.toString(),
                        context: context),
                  ),
                );
              },
            ),
    );
  }
}
