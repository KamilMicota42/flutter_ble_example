import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({int? id, required String name, required String surname, required int age, required String gender}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
