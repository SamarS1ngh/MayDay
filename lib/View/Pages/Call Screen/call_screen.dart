import 'package:contacts_service/contacts_service.dart';
import 'package:fluttemp/Utils/constants/app_constants.dart';
import 'package:fluttemp/Utils/provider/app_providers.dart';
import 'package:fluttemp/View/shared/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CallScreen extends ConsumerWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Contact> contacts = ref.watch(contactProvider.notifier).contacts;
    return Scaffold(
      backgroundColor: AppColorsTheme.dark().bgColor,
      appBar: AppBar(
        title: AppText.bigTextDefault('Contacts', size: 33, context: context),
      ),
      body: contacts.isEmpty
          ? Center(
              child: AppText.subtitleDefault('Add Contacts Permission',
                  context: context),
            )
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {},
                  title: AppText.defaultText(
                      contacts[index].displayName.toString(),
                      context: context),
                );
              },
            ),
    );
  }
}
