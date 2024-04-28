import 'package:contacts_service/contacts_service.dart';
import 'package:fluttemp/ViewModel/someClass_VM/contact_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contactProvider = StateNotifierProvider<ContactViewModel, List<Contact>>(
    (ref) => ContactViewModel());
