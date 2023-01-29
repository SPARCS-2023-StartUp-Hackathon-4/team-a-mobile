import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../community_repository/community_repository.dart';
import '../../../../community_repository/models/article.dart';

part 'community_event.dart';

part 'community_state.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  CommunityBloc({
    required CommunityRepository communityRepository,
  })  : _communityRepository = communityRepository,
        super(const CommunityState.initial()) {
    on<CommunityLoadData>(_onCommunityLoadData);
    on<CommunityFilterCategoryChanged>(_onCommunityFilterCategoryChanged);
    on<_CommunityLoadDataInProgress>(_onCommunityLoadDataInProgress);
    on<_CommunityLoadDataSuccess>(_onCommunityLoadDataSuccess);
    on<_CommunityLoadDataFailure>(_onCommunityLoadDataFailure);
  }

  final CommunityRepository _communityRepository;

  void _onCommunityLoadData(
    CommunityLoadData event,
    Emitter<CommunityState> emit,
  ) async {
    emit(const CommunityState.loading());
    try {
      await Future<void>.delayed(const Duration(milliseconds: 400));
      final articleList = await _communityRepository.getArticles();
      final List<Article> topArticleList = [];
      for (int i = 0; i < 3 && i < articleList.length; i++) {
        topArticleList.add(articleList[i]);
      }
      add(_CommunityLoadDataSuccess(
        articleList: articleList,
        topArticleList: topArticleList,
      ));
    } catch (e) {
      add(_CommunityLoadDataFailure(e.toString()));
    }
  }

  void _onCommunityFilterCategoryChanged(
    CommunityFilterCategoryChanged event,
    Emitter<CommunityState> emit,
  ) {
    final filteredArticleList = event.filterCategory.trim().isEmpty
        ? state.articleList
        : state.articleList
            .where((article) => article.category == event.filterCategory)
            .toList();
    emit(state.copyWith(
      filteredArticleList: filteredArticleList,
    ));
  }

  void _onCommunityLoadDataFailure(
    _CommunityLoadDataFailure event,
    Emitter<CommunityState> emit,
  ) {
    emit(const CommunityState.failure());
  }

  void _onCommunityLoadDataInProgress(
    _CommunityLoadDataInProgress event,
    Emitter<CommunityState> emit,
  ) {
    emit(const CommunityState.loading());
  }

  void _onCommunityLoadDataSuccess(
    _CommunityLoadDataSuccess event,
    Emitter<CommunityState> emit,
  ) {
    emit(CommunityState.success(
      articleList: event.articleList,
      topArticleList: event.topArticleList,
    ));
  }
}
