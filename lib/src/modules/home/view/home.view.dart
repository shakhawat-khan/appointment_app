import 'package:ag_appointment/src/modules/home/components/update.form/update_card.dart';

import 'package:ag_appointment/src/modules/home/provider/functions.dart';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/home.provider.dart';
import '../components/add.appointment/add.appointment.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memberList = ref.watch(memberListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Appointment')),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
        child: NestedScrollView(
          controller: ref.watch(homeScrollControllerProvider),
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (_, __) => [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(height: 2),
                  const AddAppointmentSection(),
                ],
              ),
            ),
          ],
          body: memberList.when(
            data: (data) {
              if (data.isEmpty) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'No appointment so far',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Please press the + icon button',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return CustomCard(
                    member: data[index],
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Text(e.toString()),
          ),
        ),
      ),
      floatingActionButton: Consumer(
        builder: (_, ref, __) {
          final isDone = ref.watch(valueStateProvider);
          return FloatingActionButton(
            backgroundColor: isDone ? Colors.green : null,
            onPressed: isDone
                ? () {
                    submitAppointment(ref, context);
                  }
                : () {
                    isNotDone(ref);
                  },
            child: Icon(isDone ? Icons.done : Icons.add),
          );
        },
      ),
    );
  }
}
