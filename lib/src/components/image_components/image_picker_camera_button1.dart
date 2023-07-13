import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../modules/home/provider/functions.dart';

class PickImageFromCameraTest extends ConsumerWidget {
  final StateProvider<File?> imageProvider1;
  final StateProvider<String?> imagePathProvider1;
  final bool iscamera;

  const PickImageFromCameraTest({
    super.key,
    required this.imagePathProvider1,
    required this.imageProvider1,
    required this.iscamera,
  });

  @override
  Widget build(BuildContext context, ref) {
    return ElevatedButton(
      onPressed: () async {
        pickImageCameraButton(ref, context, imageProvider1, imagePathProvider1);
      },
      child: const Text('pick from camera'),
    );
  }
}
