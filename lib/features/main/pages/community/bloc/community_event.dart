part of 'community_bloc.dart';

abstract class CommunityEvent extends Equatable {
  const CommunityEvent();

  @override
  List<Object> get props => [];
}

class CommunityLoadData extends CommunityEvent {
  const CommunityLoadData();
}

class _CommunityLoadDataInProgress extends CommunityEvent {
  const _CommunityLoadDataInProgress();
}

class _CommunityLoadDataSuccess extends CommunityEvent {
  const _CommunityLoadDataSuccess({
    required this.articleList,
    required this.topArticleList,
  });

  final List<Article> articleList;

  final List<Article> topArticleList;

  @override
  List<Object> get props => [articleList];
}

class _CommunityLoadDataFailure extends CommunityEvent {
  const _CommunityLoadDataFailure(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}

class CommunityFilterCategoryChanged extends CommunityEvent {
  const CommunityFilterCategoryChanged(this.filterCategory);

  final String filterCategory;

  @override
  List<Object> get props => [filterCategory];
}
