// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      id: json['id'] as String,
      writerId: json['writer_id'] as String,
      writerName: json['writer_name'] as String,
      content: json['content'] as String,
      likeCount: json['num_like'] as int,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'writer_id': instance.writerId,
      'writer_name': instance.writerName,
      'content': instance.content,
      'num_like': instance.likeCount,
    };
