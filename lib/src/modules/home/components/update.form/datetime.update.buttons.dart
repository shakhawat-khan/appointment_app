import 'package:ag_appointment/src/constants/constants.dart';
import 'package:ag_appointment/src/modules/home/provider/functions.dart';
import 'package:ag_appointment/src/modules/home/provider/home.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DatetimeUpdateButtons extends ConsumerWidget {
  const DatetimeUpdateButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () async {
            DateTime? dt = await selectDateTimeFromPicker(context);

            ref.read(datetimeProviderUpdate.notifier).update((state) => dt);
          },
          child: Consumer(
            builder: (_, ref, __) {
              final dt = ref.watch(datetimeProviderUpdate);

              return Text(
                dt == null ? 'select date' : dateFormatted.format(dt),
              );
            },
          ),
        ),
      ],
    );
  }
}
