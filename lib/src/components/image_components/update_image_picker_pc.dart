import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../modules/home/provider/functions.dart';

class EidtIconForPcUpdate extends ConsumerWidget {
  const EidtIconForPcUpdate({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return InkWell(
      onTap: () {
        updateImagePc(context, ref);
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
