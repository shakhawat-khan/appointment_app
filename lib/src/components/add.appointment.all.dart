import 'dart:io';

import 'package:ag_appointment/src/components/image_components/image_picker_mobile.dart';
import 'package:ag_appointment/src/modules/contact/contact.dart';
import 'package:ag_appointment/src/modules/home/components/buttons.dart/date_time.buttons.dart';
import 'package:ag_appointment/src/modules/home/components/imagePicker/image_picker_computer.dart';
import 'package:ag_appointment/src/modules/home/provider/home.provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../modules/contact/contact.email.dart';
import '../modules/home/components/update.form/datetime.update.buttons.dart';

class AddAppointmentTest extends ConsumerWidget {
  final Key keydefine;
  final StateProvider<String?> imagePathProvider;
  final StateProvider<File?> imageProvider;

  final bool isUpdate;

  const AddAppointmentTest({
    super.key,
    required this.keydefine,
    required this.imagePathProvider,
    required this.imageProvider,
    required this.isUpdate,
  });

  @override
  Widget build(BuildContext context, ref) {
    final notifier = ref.watch(appointmentFormProvider.notifier);

    return Form(
      key: keydefine,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 15,
          ),
          Container(
            child: (Platform.isAndroid == true || Platform.isIOS == true)
                ? isUpdate == true
                    ? PickImageForMobile(
                        imagePathProviderAll: imagePathProvider,
                        imageProviderAll: imageProvider,
                        isUpdate: true,
                      )
                    : PickImageForMobile(
                        imagePathProviderAll: imagePathProvider,
                        imageProviderAll: imageProvider,
                        isUpdate: false,
                      )
                : isUpdate == true
                    ? PickImageForMobile(
                        isUpdate: true,
                        imageProviderAll: imageProvider,
                        imagePathProviderAll: imagePathProvider,
                      )
                    : const PickImageForComuputer(),
          ),
          const SizedBox(height: 15),
          TextFormField(
            onChanged: notifier.changeName,
            validator: notifier.nameValidator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: notifier.nameController,

            //ref.watch(textControllerProvider(nameController)),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person),
              hintText: 'What do people call you?',
              labelText: 'Name',
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            onChanged: notifier.changeDesignation,
            validator: notifier.designationValidator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: notifier.designationController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person),
              hintText: 'choosing someone to hold an office',
              labelText: 'Designation',
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            onChanged: notifier.changeVisitingWho,
            validator: notifier.visitingWhoValidator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: notifier.visitingWhoController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person),
              hintText: '',
              labelText: 'Visiting Who',
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            onChanged: notifier.changePhoneNumber,
            keyboardType: TextInputType.number,
            validator: notifier.phoneNumberValidator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: notifier.phoneNumberController,
            // controller: phoneController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.phone),
              hintText: '01*********',
              labelText: 'Phone Number',
              isDense: true,
              suffixIcon: Container(
                child: (Platform.isAndroid == true || Platform.isIOS == true)
                    ? InkWell(
                        child: const Icon(Icons.contact_phone),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ContactListTest(isUpdate: false),
                            ),
                          );
                        },
                      )
                    : const SizedBox(
                        width: 1,
                      ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            onChanged: notifier.changeEmail,
            validator: notifier.emailValidator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: notifier.emailController,
            decoration: InputDecoration(
              suffixIcon: (Platform.isAndroid == true || Platform.isIOS == true)
                  ? InkWell(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EmailListTest(
                              isUpdate: false,
                            ),
                          ),
                        );
                      },
                      child: const Icon(Icons.attach_email),
                    )
                  : const SizedBox(
                      width: 1,
                    ),
              prefixIcon: const Icon(Icons.email),
              hintText: 'example@example.com',
              labelText: 'Email',
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const SizedBox(
            height: 15,
          ),
          isUpdate == true
              ? const DatetimeUpdateButtons()
              : const DatetimePickeButtons(),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
