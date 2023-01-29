import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment extends Equatable {
  const Comment({
    required this.id,
    required this.writerId,
    required this.writerName,
    required this.content,
    required this.likeCount,
  });

  final String id;

  @JsonKey(name: 'writer_id')
  final String writerId;

  @JsonKey(name: 'writer_name')
  final String writerName;

  final String content;

  @JsonKey(name: 'num_like')
  final int likeCount;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);

  @override
  List<Object?> get props => [
        id,
        writerId,
        writerName,
        content,
        likeCount,
      ];
}
