// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      category: json['category'] as String,
      writerId: json['writer_id'] as int,
      writerName: json['writer_name'] as String,
      tags: json['tags'] as String,
      imgUrl: json['img_url'] as String?,
      viewCount: json['num_view'] as int,
      likeCount: json['num_like'] as int,
      commentCount: json['num_count'] as int,
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'category': instance.category,
      'writer_id': instance.writerId,
      'writer_name': instance.writerName,
      'tags': instance.tags,
      'img_url': instance.imgUrl,
      'num_view': instance.viewCount,
      'num_like': instance.likeCount,
      'num_count': instance.commentCount,
    };
