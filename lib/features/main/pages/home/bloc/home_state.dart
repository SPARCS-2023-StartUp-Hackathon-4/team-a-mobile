part of 'home_bloc.dart';

enum HomePageStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  const HomeState._({
    required this.status,
    required this.bPlanList,
  });

  const HomeState.initial()
      : this._(status: HomePageStatus.initial, bPlanList: const []);

  const HomeState.success({required List<BPlan> bplanList})
      : this._(status: HomePageStatus.success, bPlanList: bplanList);

  const HomeState.failure()
      : this._(status: HomePageStatus.failure, bPlanList: const []);

  const HomeState.loading()
      : this._(status: HomePageStatus.loading, bPlanList: const []);

  final HomePageStatus status;

  final List<BPlan> bPlanList;

  @override
  List<Object> get props => [status, bPlanList];
}
