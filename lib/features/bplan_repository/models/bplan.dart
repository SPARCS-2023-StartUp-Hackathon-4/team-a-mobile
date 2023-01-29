import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bplan.g.dart';

@JsonSerializable()
class BPlan extends Equatable {
  const BPlan({
    required this.title,
    required this.content,
    required this.version,
  });

  final String title;
  final String content;
  final int version;

  static const empty = BPlan(title: "-", content: "", version: 0);

  factory BPlan.fromJson(Map<String, dynamic> json) => _$BPlanFromJson(json);

  Map<String, dynamic> toJson() => _$BPlanToJson(this);

  @override
  List<Object?> get props => [title, content, version];
}
