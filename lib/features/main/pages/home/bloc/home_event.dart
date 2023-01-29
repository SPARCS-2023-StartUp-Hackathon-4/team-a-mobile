part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeLoadData extends HomeEvent {
  const HomeLoadData();
}

class _HomeLoadDataInProgress extends HomeEvent {
  const _HomeLoadDataInProgress();
}

class _HomeLoadDataSuccess extends HomeEvent {
  const _HomeLoadDataSuccess(this.bplanList);

  final List<BPlan> bplanList;

  @override
  List<Object> get props => [bplanList];
}

class _HomeLoadDataFailure extends HomeEvent {
  const _HomeLoadDataFailure(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
