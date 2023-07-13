import 'package:ag_appointment/src/modules/home/provider/home.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/constants.dart';
import '../../provider/functions.dart';

class DatetimePickeButtons extends ConsumerWidget {
  const DatetimePickeButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Consumer(builder: (_, ref, __) {
          return Container(
            child: ref.watch(datetimeBool) == null
                ? InkWell(
                    onTap: () async {
                      dateTime(context, ref);
                    },
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Consumer(
                        builder: (_, ref, __) {
                          final dt = ref.watch(datetimeProvider);

                          return Center(
                            child: Text(
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18),
                              dt == null
                                  ? 'Press select for date and time'
                                  : dateFormatted.format(dt),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : ref.watch(datetimeBool) == false
                    ? InkWell(
                        onTap: () async {
                          dateTimeBoolFalse(context, ref);
                        },
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.red),
                          child: const Center(
                            child: Text(
                              'Please select date time',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () async {
                          dateTimeBoolTrue(context, ref);
                        },
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Consumer(
                            builder: (_, ref, __) {
                              final dt = ref.watch(datetimeProvider);

                              return Center(
                                child: Text(
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18),
                                  dateFormatted.format(dt!),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
          );
        }),
        const SizedBox(
          height: 15,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: const Text(
            'cancel',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            cancleButton(ref);
          },
        )
      ],
    );
  }
}
