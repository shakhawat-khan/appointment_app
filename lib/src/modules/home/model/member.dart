import 'package:isar/isar.dart';

part 'member.g.dart';

@collection
class Member {
  Id? id;

  String? imagePath;

  String name;

  String designation;

  String visitingWho;

  String phoneNumber;

  String email;

  DateTime date;

  DateTime time;

  Member({
    this.id,
    this.imagePath,
    required this.name,
    required this.designation,
    required this.visitingWho,
    required this.date,
    required this.time,
    required this.phoneNumber,
    required this.email,
  });

  Member copyWith({
    Id? id,
    String? imagePath,
    String? name,
    String? designation,
    String? visitingWho,
    String? phoneNumber,
    String? email,
    DateTime? date,
    DateTime? time,
  }) =>
      Member(
        id: id ?? this.id,
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        designation: designation ?? this.designation,
        visitingWho: visitingWho ?? this.visitingWho,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        date: date ?? this.date,
        time: time ?? this.time,
      );

  @override
  operator ==(Object other) =>
      identical(this, other) || other is Member && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
