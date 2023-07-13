import 'package:ag_appointment/src/modules/contact/components/search_contact.dart';
import 'package:ag_appointment/src/modules/contact/provider/contact_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';

import '../../home/provider/home.provider.dart';

Widget buildEmail(List<Contact>? contacts, ref, final bool isUpdate) {
  final tempSearchList = ref.watch(listSearchTemp);
  final searchTextController = ref.watch(
    textControllerProvider('search_contact'),
  );
  return Column(
    children: [
      SearchContact(
        contacts: contacts!,
        searchTextController: searchTextController,
        email: true,
      ),
      Expanded(
        child: searchTextController.text.isNotEmpty && tempSearchList!.isEmpty
            ? const Text('No result found')
            : ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemCount: ref
                        .watch(
                          textControllerProvider('search_contact'),
                        )
                        .text
                        .isNotEmpty
                    ? ref.watch(listSearchTemp)!.length
                    : contacts.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      selectEmail(
                          contacts[index].emails,
                          tempSearchList,
                          isUpdate,
                          searchTextController,
                          contacts,
                          context,
                          ref,
                          index);
                    },
                    child: ListTile(
                      leading: Image.asset('assets/images/person.png'),
                      title: searchTextController.text.isNotEmpty
                          ? Text(tempSearchList![index].displayName)
                          : Text(contacts[index].displayName),
                      subtitle: searchTextController.text.isNotEmpty
                          ? Text(tempSearchList![index].emails.isEmpty
                              ? ''
                              : tempSearchList[index].emails[0].address)
                          : Text(contacts[index].emails.isEmpty
                              ? ''
                              : contacts[index].emails[0].address),
                    ),
                  );
                },
              ),
      ),
    ],
  );
}
