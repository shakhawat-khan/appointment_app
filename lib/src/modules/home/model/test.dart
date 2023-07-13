import 'package:isar/isar.dart';

part 'test.g.dart';

@collection
class Test1 {
  Id? id = Isar.autoIncrement;

  String v1;

  Test1({
    required this.v1
  });
}
