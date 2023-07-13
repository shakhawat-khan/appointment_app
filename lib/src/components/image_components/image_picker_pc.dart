import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../modules/home/provider/functions.dart';

class EidtIconForPc extends ConsumerWidget {
  const EidtIconForPc({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return InkWell(
      onTap: () {
        imagePickerpc(context, ref);
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
