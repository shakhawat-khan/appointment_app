import 'package:ag_appointment/src/modules/home/model/member.dart';
import 'package:ag_appointment/src/modules/home/provider/functions.dart';

import 'package:flutter/material.dart';

class DeleteUpdateButton extends StatelessWidget {
  final Member member;

  const DeleteUpdateButton({super.key, required this.member});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        deleteObject(context, member);
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: const Text(
        'Delete',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
