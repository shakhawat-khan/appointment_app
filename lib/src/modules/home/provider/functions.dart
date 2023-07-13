import 'dart:convert';
import 'dart:io';

import 'package:ag_appointment/src/db/isar.dart';
import 'package:ag_appointment/src/modules/home/provider/home.provider.dart';
import 'package:ag_appointment/src/utils/helper/key.dart';
import 'package:animations/animations.dart';
import 'package:cached_memory_image/cached_image_base64_manager.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../components/add.appointment.all.dart';
import '../components/buttons.dart/appointment.submit.btn.dart';
import '../components/flutter.toast/custom_snackbar.dart';
import '../components/update.form/deleteupdatebutton.dart';

import '../model/member.dart';

Future<DateTime?> selectDateTimeFromPicker(BuildContext context) async {
  DateTime? date = await selectDateFromPicker(context).then((value) async {
    if (value == null) return null;

    TimeOfDay? time = await selectTimeFromPicker(context);

    if (time == null) return null;

    return DateTime(value.year, value.month, value.day, time.hour, time.minute);
  });

  return date;
}

Future<DateTime?> selectDateFromPicker(BuildContext context,
    [DateTime? initialDateTime]) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: initialDateTime ?? DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2030),
  );
  if (picked != null) {
    return picked;
  }
  return null;
}

Future<TimeOfDay?> selectTimeFromPicker(BuildContext context,
    [DateTime? initialDateTime]) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: initialDateTime != null
        ? TimeOfDay.fromDateTime(initialDateTime)
        : TimeOfDay.now(),
  );
  if (picked != null) {
    return picked;
  }
  return null;
}

Future<DateTime?> pickDate(BuildContext context) async {
  final initialDate = DateTime.now();
  final newDate = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: DateTime(DateTime.now().year - 5),
    lastDate: DateTime(DateTime.now().year + 5),
  );

  return newDate;
}

Future<TimeOfDay?> pickTime(BuildContext context) async {
  const initialTime = TimeOfDay(hour: 9, minute: 00);
  final newTime =
      await showTimePicker(context: context, initialTime: initialTime);

  return newTime;
}

Future<XFile?> pickImageGallery() async {
  final image = await ImagePicker().pickImage(
    source: ImageSource.gallery,
    maxHeight: 700,
    maxWidth: 700,
  );

  return image;
}

Future<XFile?> pickImageCamera() async {
  final image = await ImagePicker().pickImage(
    source: ImageSource.camera,
    maxHeight: 700,
    maxWidth: 700,
  );

  return image;
}

DateTime fromTimeOfDay(DateTime datetime) => DateTime(datetime.year,
    datetime.month, datetime.day, datetime.hour, datetime.minute);

void submitPressButton() {
  return;
}

void clearInfo(WidgetRef ref) {
  ref.read(imagePathProvider.notifier).update((state) => null);

  //ref.read(datetimeProvider.notifier).update((state) => null);
  ref.read(imageProvider.notifier).update((state) => null);
  ref.read(imagePathProvider.notifier).update((state) => null);
  ref.read(datetimeProvider.notifier).update((state) => null);
}

void updateAppointment(WidgetRef ref, final id) async {
  final notifier = ref.read(appointmentFormProvider.notifier);
  final notifier1 = ref.read(appointmentFormProvider);

  final member = Member(
    id: id,
    name: notifier.nameController.text,
    designation: notifier.designationController.text,
    visitingWho: notifier.visitingWhoController.text,
    date: ref.read(datetimeProviderUpdate)!,
    time: notifier1.date,
    phoneNumber: notifier.phoneNumberController.text,
    email: notifier.emailController.text,
    imagePath: notifier1.imagePath,
  );

  await db.writeTxn(() => db.members.put(member));
}

imageFromBase64String(String base64String) {
  return base64Decode(base64String);
}

Future<File?> pickImageGalleryComputer() async {
  final image = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['jpg', 'png'],
  );

  if (image != null) {
    File file = File(image.files.single.path!);
    print(file.path);
    return file;
  } else {
    print('object');
  }
  return null;
}

String formatString(String str) {
  return str.replaceAll(' ', '').replaceAll('+88', '').replaceAll('-', '');
}

Future<CroppedFile?> corpImage(File? test) async {
  CroppedFile? croppedImage = await ImageCropper().cropImage(uiSettings: [
    AndroidUiSettings(
      toolbarTitle: 'Cropper',
      toolbarColor: Colors.blueAccent,
      toolbarWidgetColor: Colors.white,
      initAspectRatio: CropAspectRatioPreset.original,
    ),
    IOSUiSettings(
      title: 'Cropper',
    ),
  ], sourcePath: test!.path);
  return croppedImage;
}

Future<List<Contact>?> listContact() async {
  if (await FlutterContacts.requestPermission()) {
    List<Contact> contacts = await FlutterContacts.getContacts(
      withProperties: true,
    );
    return contacts;
  } else {
    return null;
  }
}

void submitAppointment(WidgetRef ref, BuildContext context) async {
  final notifier = ref.read(appointmentFormProvider.notifier);

  final test = ref.read(datetimeProvider);
  if (fromKeys.currentState!.validate() == false) {
    showErrorSnack(context: context, subTitle: 'Textfield must not empty');
    return;
  }

  if (test == null) {
    showErrorSnack(context: context, subTitle: 'Date and time not selected');
    return;
  }
  notifier.changeDate(test);

  ref.read(valueStateProvider.notifier).update((state) => false);
  clearInfo(ref);
  await ref.read(appointmentFormProvider.notifier).save(context);
}

void isNotDone(ref) async {
  ref.read(valueStateProvider.notifier).update((state) => !state);
  ref.read(homeScrollControllerProvider).jumpTo(0.0);

  ref.read(colorTemp.notifier).update((state) => null);
  ref.read(datetimeBool.notifier).update((state) => null);
}

void dateTime(BuildContext context, ref) async {
  final dt = await selectDateTimeFromPicker(context);

  if (dt == null) {
    ref.read(datetimeBool.notifier).update((state) => false);
  } else {
    ref.read(datetimeBool.notifier).update((state) => true);
    ref.read(datetimeProvider.notifier).update((state) => dt);
  }
}

void cancleButton(ref) {
  final notifier = ref.watch(appointmentFormProvider.notifier);
  ref.read(valueStateProvider.notifier).update((state) => !state);
  ref.read(imagePathProvider.notifier).update((state) => null);
  ref.read(datetimeProvider.notifier).update((state) => null);
  ref.read(datetimeBool.notifier).update((state) => null);

  notifier.emailController.clear();
  notifier.nameController.clear();
  notifier.designationController.clear();
  notifier.phoneNumberController.clear();
  notifier.visitingWhoController.clear();
}

void dateTimeBoolFalse(BuildContext context, ref) async {
  final dt = await selectDateTimeFromPicker(context);

  if (dt == null) {
    ref.read(datetimeBool.notifier).update((state) => false);
  } else {
    ref.read(datetimeBool.notifier).update((state) => true);
  }

  ref.read(datetimeProvider.notifier).update((state) => dt);
}

void dateTimeBoolTrue(BuildContext context, ref) async {
  final dt = await selectDateTimeFromPicker(context);

  if (dt == null) {
    return;
  } else {
    ref.read(datetimeBool.notifier).update((state) => true);
  }

  ref.read(datetimeProvider.notifier).update((state) => dt);
}

void delete(BuildContext context, id) async {
  void close() {
    Navigator.pop(context);
  }

  await db.writeTxn(() async {
    await db.members.delete(id);
  });

  close();
  close();
}

void pickImageGalleryButton(
    ref,
    BuildContext context,
    StateProvider<File?> imageProdiver1,
    StateProvider<String?> imagePathProdiver1) async {
  final navigator = Navigator.of(context);
  final test = await pickImageGallery();

  if (test == null) {
    showErrorSnack(context: context, subTitle: 'no image selected');
    return;
  }

  final testImg = await corpImage(File(test.path));
  if (testImg == null) {
    showErrorSnack(context: context, subTitle: 'no image selected');
    return;
  }

  ref.read(imageProdiver1.notifier).update((state) => File(testImg.path));

  if (ref.read(imageProdiver1) != null) {
    var imageByte = ref.read(imageProdiver1)!.readAsBytesSync();

    final base64Image = base64Encode(imageByte);

    ref.read(imagePathProdiver1.notifier).update((state) => base64Image);
  }

  navigator.pop();
}

void pickImageCameraButton(
    ref,
    BuildContext context,
    StateProvider<File?> imageProvider1,
    StateProvider<String?> imagePathProvider1) async {
  final navigator = Navigator.of(context);
  final test = await pickImageCamera();

  if (test == null) {
    showErrorSnack(context: context, subTitle: 'no image selected');
    return;
  }

  final testImg = await corpImage(File(test.path));

  if (testImg == null) {
    showErrorSnack(context: context, subTitle: 'no image selected');
    return;
  }

  ref.read(imageProvider1.notifier).update(
        (state) => File(testImg.path),
      );

  if (ref.read(imageProvider1) != null) {
    var imageByte = ref.read(imageProvider1)!.readAsBytesSync();

    final base64Image = base64Encode(imageByte);

    ref.read(imagePathProvider1.notifier).update((state) => base64Image);
  }

  navigator.pop();
}

void deleteObject(BuildContext context, Member member) async {
  await showModal(
    context: context,
    builder: (context) => AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Are you sure ??'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  delete(context, member.id);

                  if (member.imagePath != null) {
                    final cachedImageManager =
                        CachedImageBase64Manager.instance();
                    await cachedImageManager
                        .removeFile('app://image/${member.id.toString()}');
                  }
                  //OnPress().delete(context, id);
                },
                child: const Text('Yes'),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('No'),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

void imagePickerpc(BuildContext context, ref) async {
  final test = await pickImageGalleryComputer();

  if (test == null) {
    showErrorSnack(context: context, subTitle: 'no image selected');
    return;
  }

  ref.read(imageProvider.notifier).update(
        (state) => File(test.path),
      );

  if (ref.read(imageProvider) != null) {
    var imageByte = ref.read(imageProvider)!.readAsBytesSync();

    final base64Image = base64Encode(imageByte);

    ref.read(imagePathProvider.notifier).update((state) => base64Image);
  }
}

void updateImagePc(BuildContext context, ref) async {
  final test = await pickImageGalleryComputer();

  if (test == null) {
    showErrorSnack(context: context, subTitle: 'no image selected');
    return;
  }

  ref.read(imageUpdateProvider.notifier).update(
        (state) => File(test.path),
      );

  if (ref.read(imageUpdateProvider) != null) {
    var imageByte = ref.read(imageUpdateProvider)!.readAsBytesSync();

    final base64Image = base64Encode(imageByte);

    ref.read(imageUpdatePathProvider.notifier).update((state) => base64Image);
  }
}

modalForUpdate(
  BuildContext context,
  WidgetRef ref,
  Member member,
) async {
  await showModal(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AddAppointmentTest(
              isUpdate: true,
              keydefine: fromKeyUpdate,
              imagePathProvider: imageUpdatePathProvider,
              imageProvider: imageUpdateProvider,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Button(
                  name: 'Update',
                  callback: () async {
                    try {
                      if (fromKeyUpdate.currentState!.validate() == false) {
                        showErrorSnack(
                            context: context,
                            subTitle: 'TextField must not empty');
                        return;
                      }
                      if (ref.watch(datetimeProviderUpdate) == null) {
                        showErrorSnack(
                            context: context, subTitle: 'Date not selected');
                        return;
                      } else if (ref.watch(timeProviderUpdate) == null) {
                        showErrorSnack(
                            context: context, subTitle: 'Time not selected');
                        return;
                      }
                      updateAppointment(
                        ref,
                        member.id,
                      );
                      Navigator.pop(context);
                    } catch (e) {
                      showErrorSnack(context: context, subTitle: e.toString());
                    }

                    if (member.imagePath !=
                        ref.watch(imageUpdatePathProvider)) {
                      final cachedImageManager =
                          CachedImageBase64Manager.instance();
                      await cachedImageManager
                          .removeFile('app://image/${member.id.toString()}');
                    }
                  },
                ),
                DeleteUpdateButton(
                  member: member,
                )
              ],
            ),
          ],
        ),
      ),
    ),
  ).then((value) {
    final notifier = ref.watch(appointmentFormProvider.notifier);

    notifier.nameController.clear();
    notifier.designationController.clear();
    notifier.visitingWhoController.clear();
    notifier.emailController.clear();
    notifier.phoneNumberController.clear();
    ref.read(valueStateProvider.notifier).update((state) => false);
  });
}

void update(Member member, BuildContext context, WidgetRef ref) {
  ref.read(datetimeProviderUpdate.notifier).update((state) => member.date);

  ref.read(timeProviderUpdate.notifier).update(
        (state) => TimeOfDay.fromDateTime(member.date),
      );

  ref.read(valueStateProvider.notifier).update((state) => false);

  ref
      .read(imageUpdatePathProvider.notifier)
      .update((state) => member.imagePath);

  modalForUpdate(context, ref, member);
}
