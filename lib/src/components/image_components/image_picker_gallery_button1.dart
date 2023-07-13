import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../modules/home/provider/functions.dart';

class PickImageFromGalleryTest extends ConsumerWidget {
  final StateProvider<File?> imageProdiver1;
  final StateProvider<String?> imagePathProdiver1;

  const PickImageFromGalleryTest({
    super.key,
    required this.imageProdiver1,
    required this.imagePathProdiver1,
  });

  @override
  Widget build(BuildContext context, ref) {
    return ElevatedButton(
      onPressed: () async {
        pickImageGalleryButton(
            ref, context, imageProdiver1, imagePathProdiver1);
      },
      child: const Text('pick from gallery'),
    );
  }
}
