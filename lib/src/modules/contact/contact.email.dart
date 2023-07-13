import 'package:ag_appointment/src/modules/home/provider/functions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/build_email.dart';

class EmailListTest extends ConsumerWidget {
  final bool isUpdate;

  const EmailListTest({super.key, required this.isUpdate});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email'),
      ),
      body: FutureBuilder<List<Contact>?>(
        future: listContact(),
        builder: (context, snapshot) {
          final data = snapshot.data;

          if (snapshot.hasData) {
            return buildEmail(data, ref, isUpdate);
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
