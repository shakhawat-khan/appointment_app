import 'package:ag_appointment/src/modules/home/provider/functions.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';

import 'package:flutter_contacts/flutter_contacts.dart';

import 'components/build_contact.dart';

class ContactListTest extends ConsumerWidget {
  final bool isUpdate;

  const ContactListTest({super.key, required this.isUpdate});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: FutureBuilder<List<Contact>?>(
        future: listContact(),
        builder: (context, snapshot) {
          final data = snapshot.data;

          if (snapshot.hasData) {
            return buildContact(data, ref, isUpdate);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
