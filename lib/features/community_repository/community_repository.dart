import 'package:bloc_practice/features/community_repository/models/article.dart';
import 'package:dio/dio.dart';

import '../../commons/api.dart';
import 'models/comment.dart';

class CommunityRepository {
  Future<List<Article>> getArticles() async {
    return [
      Article(
        id: 1,
        title: "스타트업 성장기 : 성장하는 회사의 비결",
        content:
            "스타트업 성장기에서 성장하는 회사들의 비결을 살펴보며, 이를 응용해 자신의 회사를 성장시키는 방법에 대해 알아봅니다.",
        category: "material",
        writerId: 1,
        writerName: "John",
        tags: "#스타트업 #성장",
        imgUrl: null,
        viewCount: 200,
        likeCount: 12,
        commentCount: 6,
      ),
      Article(
        id: 2,
        title: "AI 기술의 미래 : 어떤 방향으로 발전할까?",
        content: "AI 기술의 미래를 살펴보며, 이를 이용한 새로운 산업들과 응용분야를 예상해봅니다.",
        category: "material",
        writerId: 2,
        writerName: "Emily",
        tags: "#AI #미래",
        imgUrl: null,
        viewCount: 150,
        likeCount: 8,
        commentCount: 4,
      ),
      Article(
        id: 3,
        title: "스타트업 성장을 위한 마케팅 전략",
        content: "스타트업의 성장을 위해 필요한 마케팅 전략에 대해 알아보겠습니다.",
        category: "material",
        writerId: 3,
        writerName: "Mark",
        tags: "#마케팅 #스타트업",
        imgUrl: null,
        viewCount: 200,
        likeCount: 15,
        commentCount: 5,
      ),
      Article(
        id: 4,
        title: "최신 기술 트렌드 - 블록체인",
        content: "블록체인 기술이 이제 어디서부터 사용되는지에 대해 알아보겠습니다.",
        category: "news",
        writerId: 4,
        writerName: "Kim",
        tags: "#기술 #블록체인",
        imgUrl: null,
        viewCount: 150,
        likeCount: 10,
        commentCount: 3,
      ),
      Article(
        id: 5,
        title: "사업 투자를 위한 파이널 발표 준비",
        content: "파이널 발표를 위한 준비를 하며 어떤 점을 신경써야 하는지에 대해 알아보겠습니다.",
        category: "material",
        writerId: 5,
        writerName: "Jane",
        tags: "#투자 #사업",
        imgUrl: null,
        viewCount: 250,
        likeCount: 20,
        commentCount: 7,
      ),
      Article(
        id: 6,
        title: "비즈니스 모델 이해하기",
        content:
            "비즈니스 모델은 스타트업의 성공을 위해 중요한 요소 중 하나입니다. 이번 글에서는 비즈니스 모델의 종류와 성공하는 방법에 대해 알아보겠습니다.",
        category: "material",
        writerId: 0,
        writerName: "Julia",
        tags: "#비즈니스 #모델",
        imgUrl: null,
        viewCount: 100,
        likeCount: 6,
        commentCount: 3,
      ),
      Article(
        id: 7,
        title: "AI 기술의 최신 트렌드",
        content:
            "AI 기술은 기술 업계에서 가장 화려한 트렌드 중 하나입니다. 이번 글에서는 AI 기술의 최신 트렌드를 알아보고, 이를 이용한 실제 사례를 살펴보겠습니다.",
        category: "news",
        writerId: 0,
        writerName: "Julia",
        tags: "#AI #트렌드",
        imgUrl: null,
        viewCount: 100,
        likeCount: 6,
        commentCount: 3,
      ),
      Article(
        id: 8,
        title: "스타트업 경험 공유",
        content:
            "저는 최근 스타트업에서 근무하면서 경험한 일들을 공유하고 싶습니다. 예를 들어, 투자자를 유치하는 방법, 사업 기획 방법 등등.",
        category: "blog",
        writerId: 8,
        writerName: "Tom",
        tags: "#스타트업 #경험공유",
        imgUrl: null,
        viewCount: 50,
        likeCount: 3,
        commentCount: 2,
      ),
      Article(
        id: 9,
        title: "멋진 일상을 위한 습관",
        content:
            "저는 일상에서 더 멋진 일을 경험하기 위해 습관을 기르는 것을 좋아합니다. 예를 들어, 아침 운동, 매일 일기 쓰기, 일과 전 읽는 책 등등.",
        category: "blog",
        writerId: 9,
        writerName: "Amy",
        tags: "#일상 #습관",
        imgUrl: null,
        viewCount: 30,
        likeCount: 5,
        commentCount: 1,
      ),
    ];

    try {
      var response = await api.dio1.get(
        "articles",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${await api.token}",
          },
        ),
      );

      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.of(response.data)
            .map((e) => Article.fromJson(e))
            .toList();
      }
    } catch (e) {
      print("error load Articles");
      print(e);
    }

    return [];
  }

  Future<List<Comment>> getComments(String articleId) async {
    try {
      var response = await api.dio1.get(
        "comments",
        queryParameters: {
          'articleId': articleId,
        },
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${await api.token}",
          },
        ),
      );

      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.of(response.data)
            .map((e) => Comment.fromJson(e))
            .toList();
      }
    } catch (e) {
      print("error load Comments");
      print(e);
    }

    return [];
  }
}
