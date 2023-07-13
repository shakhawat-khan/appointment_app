import 'dart:io';

import 'package:ag_appointment/src/extensions/extensions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../../../db/isar.dart';
import '../../../utils/helper/key.dart';
import '../components/flutter.toast/custom_snackbar.dart';
import '../model/member.dart';

final textControllerProvider =
    Provider.family((_, String __) => TextEditingController());
final datetimeProvider = StateProvider<DateTime?>((_) => null);

final datetimeProviderUpdate = StateProvider<DateTime?>((_) => null);
final timeProviderUpdate = StateProvider<TimeOfDay?>((_) => null);
final imageProvider = StateProvider<File?>((_) => null);
final imageUpdateProvider = StateProvider<File?>((_) => null);
final imagePathProvider = StateProvider<String?>((_) => null);
final scrollProvider = StateProvider<ScrollController?>((_) => null);

final imageUpdatePathProvider = StateProvider<String?>((_) => null);
final imageProviderComputer = StateProvider<File?>((_) => null);
final datetimeTempProvider = StateProvider<DateTime?>((_) => null);

final datetimeBool = StateProvider<bool?>((_) => null);

final colorTemp = StateProvider<Color?>((_) => null);

final listSearchTemp = StateProvider<List<Contact>?>((_) => null);

final memberListProvider = StreamProvider(
  (_) => db.members.where().sortByDate().watch(fireImmediately: true),
);

final homeScrollControllerProvider =
    Provider.autoDispose((_) => ScrollController());

final valueStateProvider = StateProvider<bool>((ref) => false);

final appointmentFormProvider =
    NotifierFamilyProvider<AppointmentFormNotifier, Member, Member?>(
        AppointmentFormNotifier.new);

class AppointmentFormNotifier extends FamilyNotifier<Member, Member?> {
  @override
  Member build(Member? arg) {
    final appointment = arg ??
        Member(
          name: '',
          email: '',
          imagePath: '',
          designation: '',
          phoneNumber: '',
          visitingWho: '',
          time: DateTime.now(),
          date: DateTime.now(),
        );
    nameController.text = appointment.name;
    designationController.text = appointment.designation;
    visitingWhoController.text = appointment.visitingWho;
    phoneNumberController.text = appointment.phoneNumber;
    emailController.text = appointment.email;
    return appointment;
  }

  final nameController = TextEditingController();
  final designationController = TextEditingController();
  final visitingWhoController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();

  void changeName(String name) => state.name = name;
  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  void changeDesignation(String designation) => state.designation = designation;

  String? designationValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  void changeVisitingWho(String visitingWho) => state.visitingWho = visitingWho;

  String? visitingWhoValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  void changePhoneNumber(String phoneNumber) => state.phoneNumber = phoneNumber;

  String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'field can not be empty';
    } else if (value.length <= 9 || value.isLetter == true) {
      return 'Phone number invalied';
    } else {
      return null;
    }
  }

  void changeEmail(String email) => state.email = email;

  String? emailValidator(String? value) {
    if (value!.isEmpty || value.isEmail != true) {
      return 'Please enter valid email';
    }
    return null;
  }

  void changeDate(DateTime date) {
    state.date = date;
  }

  void changeTime(DateTime time) => state.time = time;

  void changeImagePath(String? imagePath) => state.imagePath = imagePath;

  Future<void> save(BuildContext context) async {
    if (fromKeys.currentState!.validate() == false) {
      showErrorSnack(context: context, subTitle: 'Textfield must not empty');
      return;
    }

    await db.writeTxn(() => db.members.put(state));

    nameController.clear();
    visitingWhoController.clear();
    designationController.clear();
    emailController.clear();
    phoneNumberController.clear();
  }
}
