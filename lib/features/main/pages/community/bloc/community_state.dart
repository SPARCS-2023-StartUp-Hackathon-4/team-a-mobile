part of 'community_bloc.dart';

enum CommunityPageStatus { initial, loading, success, failure }

class CommunityState extends Equatable {
  const CommunityState._({
    required this.status,
    required this.articleList,
    required this.filterCategory,
    required this.topArticleList,
    required this.filteredArticleList,
  });

  final CommunityPageStatus status;

  final List<Article> articleList;

  final String filterCategory;

  final List<Article> topArticleList;

  final List<Article> filteredArticleList;

  const CommunityState.initial()
      : this._(
            status: CommunityPageStatus.initial,
            articleList: const [],
            filterCategory: '',
            topArticleList: const [],
            filteredArticleList: const []);

  const CommunityState.success(
      {required List<Article> articleList,
      required List<Article> topArticleList})
      : this._(
            status: CommunityPageStatus.success,
            articleList: articleList,
            filterCategory: '',
            topArticleList: topArticleList,
            filteredArticleList: articleList);

  const CommunityState.failure()
      : this._(
            status: CommunityPageStatus.failure,
            articleList: const [],
            filterCategory: '',
            topArticleList: const [],
            filteredArticleList: const []);

  const CommunityState.loading()
      : this._(
            status: CommunityPageStatus.loading,
            articleList: const [],
            filterCategory: '',
            topArticleList: const [],
            filteredArticleList: const []);

  CommunityState copyWith({
    CommunityPageStatus? status,
    List<Article>? articleList,
    String? filterCategory,
    List<Article>? topArticleList,
    List<Article>? filteredArticleList,
  }) {
    return CommunityState._(
      status: status ?? this.status,
      articleList: articleList ?? this.articleList,
      filterCategory: filterCategory ?? this.filterCategory,
      topArticleList: topArticleList ?? this.topArticleList,
      filteredArticleList: filteredArticleList ?? this.filteredArticleList,
    );
  }

  bool get isFiltered => filterCategory.trim().isEmpty ? false : true;

  @override
  List<Object> get props => [
        status,
        articleList,
        filterCategory,
        topArticleList,
        filteredArticleList,
      ];
}
