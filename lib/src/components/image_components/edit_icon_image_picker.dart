import 'package:ag_appointment/src/components/image_components/image_picker_camera_button1.dart';
import 'package:ag_appointment/src/modules/home/provider/home.provider.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'image_picker_gallery_button1.dart';

class EditIconImagePicker extends ConsumerWidget {
  final bool isUpdate;

  const EditIconImagePicker({super.key, required this.isUpdate});

  @override
  Widget build(BuildContext context, ref) {
    return InkWell(
      onTap: () async {
        await showModal(
          context: context,
          builder: (context) => _EditIconAlertDialog(isUpdate: isUpdate),
        );
      },
      child: const CircleAvatar(
        backgroundColor: Colors.black,
        radius: 20,
        child: Icon(
          Icons.edit,
          size: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _EditIconAlertDialog extends StatelessWidget {
  const _EditIconAlertDialog({
    Key? key,
    required this.isUpdate,
  }) : super(key: key);

  final bool isUpdate;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: isUpdate == false
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                PickImageFromGalleryTest(
                  imageProdiver1: imageProvider,
                  imagePathProdiver1: imagePathProvider,
                ),
                PickImageFromCameraTest(
                  imageProvider1: imageProvider,
                  imagePathProvider1: imagePathProvider,
                  iscamera: true,
                )
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                PickImageFromGalleryTest(
                  imageProdiver1: imageUpdateProvider,
                  imagePathProdiver1: imageUpdatePathProvider,
                ),
                PickImageFromCameraTest(
                  imageProvider1: imageUpdateProvider,
                  imagePathProvider1: imageUpdatePathProvider,
                  iscamera: true,
                )
              ],
            ),
    );
  }
}
