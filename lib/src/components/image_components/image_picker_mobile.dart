import 'dart:io';
import 'dart:typed_data';

import 'package:ag_appointment/src/components/image_components/image_picker_pc.dart';
import 'package:ag_appointment/src/components/image_components/update_image_picker_pc.dart';
import 'package:ag_appointment/src/modules/home/provider/home.provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../modules/home/provider/functions.dart';
import 'edit_icon_image_picker.dart';

class PickImageForMobile extends ConsumerWidget {
  final bool isUpdate;
  final StateProvider<File?> imageProviderAll;
  final StateProvider<String?> imagePathProviderAll;

  const PickImageForMobile(
      {super.key,
      required this.isUpdate,
      required this.imageProviderAll,
      required this.imagePathProviderAll});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    dynamic bytes;
    final notifier = ref.watch(appointmentFormProvider.notifier);
    if (isUpdate == true) {
      if (ref.watch(imagePathProviderAll) != null) {
        final imageBytes = Uint8List.fromList(
            imageFromBase64String(ref.watch(imageUpdatePathProvider)!));

        bytes = imageBytes.buffer.asUint8List();
      }
    }

    notifier.changeImagePath(
      ref.watch(imagePathProviderAll),
    );

    return Stack(
      clipBehavior: Clip.none,
      children: [
        ref.watch(imagePathProviderAll) == null
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/person.png'),
                      fit: BoxFit.cover),
                ),
                height: 200,
                width: 200,
              )
            : Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: isUpdate == true
                      ? DecorationImage(
                          image: MemoryImage(bytes, scale: 0.1),
                          fit: BoxFit.cover)
                      : DecorationImage(
                          image: FileImage(ref.watch(imageProviderAll)!),
                          fit: BoxFit.cover),
                ),
              ),
        Positioned(
          bottom: -10,
          right: -10,
          child: (Platform.isAndroid == true || Platform.isIOS == true)
              ? isUpdate == true
                  ? const EditIconImagePicker(
                      isUpdate: true,
                    )
                  : const EditIconImagePicker(isUpdate: false)
              : isUpdate == true
                  ? const EidtIconForPcUpdate()
                  : const EidtIconForPc(),
        )
      ],
    );
  }
}
