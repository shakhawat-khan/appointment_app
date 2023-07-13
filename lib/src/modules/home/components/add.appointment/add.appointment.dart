import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../components/add.appointment.all.dart';

import '../../../../utils/helper/key.dart';

import '../../provider/home.provider.dart';

class AddAppointmentSection extends ConsumerWidget {
  const AddAppointmentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final isVisible = ref.watch(valueStateProvider);
    return Visibility(
      visible: isVisible,
      child: AddAppointmentTest(
        imagePathProvider: imagePathProvider,
        imageProvider: imageProvider,
        isUpdate: false,
        keydefine: fromKeys,
      ),
    );
  }
}
