import 'package:bloc_practice/features/bplan_repository/bplan_repository.dart';
import 'package:bloc_practice/features/bplan_repository/models/bplan.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required BPlanRepository bPlanRepository})
      : _bPlanRepository = bPlanRepository,
        super(const HomeState.initial()) {
    on<HomeLoadData>(_onHomeLoadData);
    on<_HomeLoadDataInProgress>(_onHomeLoadDataInProgress);
    on<_HomeLoadDataSuccess>(_onHomeLoadDataSuccess);
    on<_HomeLoadDataFailure>(_onHomeLoadDataFailure);
  }

  final BPlanRepository _bPlanRepository;

  void _onHomeLoadData(HomeLoadData event, Emitter<HomeState> emit) async {
    add(const _HomeLoadDataInProgress());
    try {
      await Future.delayed(const Duration(milliseconds: 600));
      final bplanList = await _bPlanRepository.getBPlanList();
      add(_HomeLoadDataSuccess(bplanList));
    } catch (e) {
      add(_HomeLoadDataFailure(e.toString()));
    }
  }

  void _onHomeLoadDataInProgress(
      _HomeLoadDataInProgress event, Emitter<HomeState> emit) {
    emit(const HomeState.loading());
  }

  void _onHomeLoadDataSuccess(
      _HomeLoadDataSuccess event, Emitter<HomeState> emit) {
    emit(HomeState.success(bplanList: event.bplanList));
  }

  void _onHomeLoadDataFailure(
      _HomeLoadDataFailure event, Emitter<HomeState> emit) {
    emit(const HomeState.failure());
  }
}
