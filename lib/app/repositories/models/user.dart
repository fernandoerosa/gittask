import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class User extends HiveObject {
  @HiveField(0)
  final String uuid;
  @HiveField(1)
  final String email;

  User({
    required this.uuid,
    required this.email,
  });

  @override
  String toString() {
    return 'User{uuid: $uuid, email: $email}';
  }
}
