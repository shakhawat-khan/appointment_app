import 'package:ag_appointment/src/components/image_components/image_picker_mobile.dart';
import 'package:ag_appointment/src/modules/home/provider/home.provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class PickImageForComuputer extends ConsumerWidget {
  const PickImageForComuputer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return PickImageForMobile(
      isUpdate: false,
      imageProviderAll: imageProvider,
      imagePathProviderAll: imagePathProvider,
    );
  }
}
