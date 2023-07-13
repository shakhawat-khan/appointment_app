import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../home/provider/home.provider.dart';

class SearchContact extends ConsumerWidget {
  const SearchContact({
    Key? key,
    required this.contacts,
    required this.searchTextController,
    required this.email,
  }) : super(key: key);

  final List<Contact> contacts;
  final TextEditingController searchTextController;
  final bool email;

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: TextField(
        onChanged: (value) {
          ref.read(listSearchTemp.notifier).update(
                (state) => contacts
                    .where(
                      (element) => (email == true)
                          ? element.emails.isEmpty
                              ? element.displayName
                                  .toLowerCase()
                                  .contains(value.toLowerCase())
                              : element.emails[0].address
                                      .toLowerCase()
                                      .contains(
                                        value.toLowerCase(),
                                      ) ||
                                  element.displayName
                                      .toLowerCase()
                                      .contains(value.toLowerCase())
                          : element.phones.isEmpty
                              ? element.displayName
                                  .toLowerCase()
                                  .contains(value.toLowerCase())
                              : element.phones[0].normalizedNumber
                                      .toLowerCase()
                                      .contains(
                                        value.toLowerCase(),
                                      ) ||
                                  element.displayName.toLowerCase().contains(
                                        value.toLowerCase(),
                                      ),
                    )
                    .toList(),
              );
        },
        controller: searchTextController,
        decoration: InputDecoration(
          labelText: 'Search',
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: InkWell(
            onTap: () {
              ref.read(listSearchTemp.notifier).update((state) => null);

              searchTextController.clear();

              searchTextController.text = '';
            },
            child: const Icon(Icons.clear),
          ),
        ),
      ),
    );
  }
}
