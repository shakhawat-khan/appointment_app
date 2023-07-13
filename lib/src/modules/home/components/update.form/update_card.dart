import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/constants.dart';
import '../../model/member.dart';

import '../../provider/functions.dart';
import '../../provider/home.provider.dart';

class CustomCard extends ConsumerWidget {
  final Member member;

  const CustomCard({super.key, required this.member});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(appointmentFormProvider.notifier);
    return GestureDetector(
      onLongPress: () {
        notifier.nameController.text = member.name;
        notifier.designationController.text = member.designation;
        notifier.visitingWhoController.text = member.visitingWho;
        notifier.phoneNumberController.text = member.phoneNumber;
        notifier.emailController.text = member.email;
        //notifier.changeImagePath(member.imagePath);
        // notifier.changeDate(member.date);
        // notifier.changeName(notifier.nameController.text);
        // notifier.changeDesignation(notifier.designationController.text);
        // notifier.changeVisitingWho(notifier.visitingWhoController.text);
        // notifier.changePhoneNumber(notifier.phoneNumberController.text);

        update(member, context, ref);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 40),
        child: FittedBox(
          child: SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      child: member.imagePath == null
                          ? Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/images/person.png'),
                                ),
                              ),
                              height: 140,
                              width: 140,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: SizedBox(
                                height: 140,
                                width: 140,
                                child: CachedMemoryImage(
                                  uniqueKey:
                                      'app://image/${member.id.toString()}',
                                  errorWidget: const Text('Error'),
                                  base64: member.imagePath,
                                  placeholder:
                                      const CircularProgressIndicator(),
                                ),
                              ),
                            ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            member.name,
                            style: Theme.of(context).textTheme.headlineMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            member.designation,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            member.visitingWho,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Flexible(
                            child: Text(
                              dateTimeFormatted.format(member.date),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
