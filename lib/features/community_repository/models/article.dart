import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article extends Equatable {
  const Article({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.writerId,
    required this.writerName,
    required this.tags,
    required this.imgUrl,
    required this.viewCount,
    required this.likeCount,
    required this.commentCount,
  });

  final int id;

  final String title;

  final String content;

  final String category;

  @JsonKey(name: 'user_id')
  final int writerId;

  @JsonKey(name: 'username')
  final String writerName;

  final String tags;

  @JsonKey(name: 'img')
  final String? imgUrl;

  @JsonKey(name: 'num_views')
  final int viewCount;

  @JsonKey(name: 'num_likes')
  final int likeCount;

  @JsonKey(name: 'num_comments')
  final int commentCount;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        content,
        category,
        writerId,
        writerName,
        tags,
        imgUrl,
        viewCount,
        likeCount,
        commentCount,
      ];
}
