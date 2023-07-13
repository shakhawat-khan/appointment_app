import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/properties/email.dart';
import 'package:flutter_contacts/properties/phone.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home/provider/functions.dart';
import '../../home/provider/home.provider.dart';

class ContactOnpress extends Notifier<void> {
  @override
  build() {}

  // void selectContact(
  //     List<Phone> listPhone,
  //     bool isUpdate,
  //     dynamic searchTextController,
  //     dynamic tempSearchList,
  //     dynamic contacts,
  //     BuildContext context,
  //     int index,
  //     ref) async {
  //   if (listPhone.isEmpty) return;

  //   isUpdate == true
  //       ? searchTextController.text.isNotEmpty
  //           ? ref
  //                   .read(
  //                     textControllerProvider('updatePhoneNumber'),
  //                   )
  //                   .text =
  //               formatString(tempSearchList![index].phones[0].normalizedNumber)
  //           : ref
  //               .read(
  //                 textControllerProvider('updatePhoneNumber'),
  //               )
  //               .text = formatString(contacts[index].phones[0].number)
  //       : searchTextController.text.isNotEmpty
  //           ? ref
  //                   .read(
  //                     textControllerProvider('phoneNumber'),
  //                   )
  //                   .text =
  //               formatString(tempSearchList![index].phones[0].normalizedNumber)
  //           : ref
  //               .read(
  //                 textControllerProvider('phoneNumber'),
  //               )
  //               .text = formatString(contacts[index].phones[0].number);
  //   Navigator.pop(context);
  // }

}

void selectEmail(
    List<Email> listemail,
    dynamic tempSearchList,
    bool isUpdate,
    dynamic searchTextController,
    dynamic contacts,
    BuildContext context,
    WidgetRef ref,
    int index) {
  if (listemail.isEmpty && tempSearchList == null) {
    return;
  }
  final notifier = ref.read(appointmentFormProvider.notifier);
  //final notifier1 = ref.read(appointmentFormProvider);

  isUpdate == true
      ? searchTextController.text.isNotEmpty
          ? notifier.emailController.text =
              tempSearchList[index].emails[0].address
          : notifier.emailController.text = contacts[index].emails[0].address
      : searchTextController.text.isNotEmpty
          ? notifier.emailController.text =
              tempSearchList[index].emails[0].address
          : notifier.emailController.text = contacts[index].emails[0].address;

  notifier.changePhoneNumber(notifier.phoneNumberController.text);
  notifier.changeEmail(notifier.emailController.text);
  Navigator.pop(context);
}

void selectContact(
  List<Phone> listPhone,
  bool isUpdate,
  dynamic searchTextController,
  dynamic tempSearchList,
  dynamic contacts,
  BuildContext context,
  int index,
  WidgetRef ref,
) async {
  if (listPhone.isEmpty) return;

  final notifier = ref.read(appointmentFormProvider.notifier);

  isUpdate == true
      ? searchTextController.text.isNotEmpty
          ? notifier.phoneNumberController.text =
              (formatString(tempSearchList![index].phones[0].normalizedNumber))
          : notifier.phoneNumberController.text =
              (formatString(contacts[index].phones[0].number))
      : searchTextController.text.isNotEmpty
          ? notifier.phoneNumberController.text =
              (formatString(tempSearchList![index].phones[0].normalizedNumber))
          : notifier.phoneNumberController.text =
              (formatString(contacts[index].phones[0].number));
  Navigator.pop(context);
}
