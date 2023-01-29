import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'program.g.dart';

@JsonSerializable()
class Program extends Equatable {
  const Program({
    required this.title,
    required this.url,
    required this.category,
    required this.organization,
    required this.subject,
    required this.applyPeriod,
    required this.applyMethod,
    required this.content,
    required this.inquiries,
    required this.age,
  });

  final String title;
  final String url;
  final String category;
  final String organization;
  final String subject;

  @JsonKey(name: "apply_period")
  final String applyPeriod;

  @JsonKey(name: "apply_method")
  final String applyMethod;

  final String content;

  final String inquiries;

  final String age;

  static const empty = Program(
    title: '',
    url: '',
    category: '',
    organization: '',
    subject: '',
    applyPeriod: '',
    applyMethod: '',
    content: '',
    inquiries: '',
    age: '',
  );

  factory Program.fromJson(Map<String, dynamic> json) =>
      _$ProgramFromJson(json);

  Map<String, dynamic> toJson() => _$ProgramToJson(this);

  @override
  List<Object?> get props => [
        title,
        url,
        category,
        organization,
        subject,
        applyPeriod,
        applyMethod,
        content,
        inquiries,
        age,
      ];
}
