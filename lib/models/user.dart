import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class Users {
  int? id;
  String? name;
  int? age;
  String? username;
  String? email;

  String? phone;
  String? website;
  String? occupation;
  List<String>? hobbies;

  Users({
    this.id,
    this.name,
    this.age,
    this.username,
    this.email,
    this.phone,
    this.website,
    this.hobbies,
    this.occupation,
  });

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  Map<String, dynamic> toJson() => _$UsersToJson(this);
}
