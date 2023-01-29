import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  const User({required this.id, required this.username, required this.email});

  final int id;

  final String username;

  final String email;

  @override
  List<Object> get props => [id, username, email];

  static const empty = User(id: 0, username: "", email: "");

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
