import 'package:ag_appointment/src/modules/contact/components/search_contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home/provider/functions.dart';
import '../../home/provider/home.provider.dart';
import '../provider/contact_functions.dart';

Widget buildContact(List<Contact>? contacts, WidgetRef ref, bool isUpdate) {
  final tempSearchList = ref.watch(listSearchTemp);
  final searchTextController =
      ref.watch(textControllerProvider('search_contact'));
  return Column(
    children: [
      const SizedBox(
        height: 15,
      ),
      SearchContact(
        contacts: contacts!,
        searchTextController: searchTextController,
        email: false,
      ),
      Expanded(
        child: searchTextController.text.isNotEmpty && tempSearchList!.isEmpty
            ? const Text('No result found')
            : ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: ref
                        .watch(textControllerProvider('search_contact'))
                        .text
                        .isNotEmpty
                    ? ref.watch(listSearchTemp)!.length
                    : contacts.length,
                itemBuilder: (context, index) {
                  //print(contacts[index].phones[0].number);
                  return InkWell(
                    onTap: () async {
                      selectContact(
                          contacts[index].phones,
                          isUpdate,
                          searchTextController,
                          tempSearchList,
                          contacts,
                          context,
                          index,
                          ref);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Image.asset('assets/images/person.png'),
                        //subtitle: Text(contacts[index].phones[0].number),
                        title: searchTextController.text.isNotEmpty
                            ? Text(tempSearchList![index].displayName)
                            : Text(contacts[index].displayName),

                        subtitle: searchTextController.text.isNotEmpty
                            ? Text(
                                tempSearchList![index].phones.isEmpty
                                    ? ''
                                    : formatString(
                                        tempSearchList[index].phones[0].number),
                              )
                            : Text(
                                contacts[index].phones.isEmpty
                                    ? ''
                                    : formatString(
                                        contacts[index].phones[0].number,
                                      ),
                              ),
                      ),
                    ),
                  );
                },
              ),
      ),
    ],
  );
}
