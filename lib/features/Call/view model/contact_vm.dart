import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactViewModel extends StateNotifier<List<Contact>> {
  ContactViewModel() : super([]);
  List<Contact> contacts = [];

//asking for contact permission
  void getPermission() async {
    if (await Permission.contacts.isGranted) {
      _fetchContacts();
    } else {
      await Permission.contacts.request();
    }
  }

  void _fetchContacts() async {
    contacts = await ContactsService.getContacts();
  }
}
