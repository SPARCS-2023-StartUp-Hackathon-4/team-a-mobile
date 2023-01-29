part of 'program_bloc.dart';

abstract class ProgramEvent extends Equatable {
  const ProgramEvent();

  @override
  List<Object> get props => [];
}

class ProgramLoadData extends ProgramEvent {
  const ProgramLoadData();
}

class ProgramSearchTextChanged extends ProgramEvent {
  const ProgramSearchTextChanged(this.searchText);

  final String searchText;

  @override
  List<Object> get props => [searchText];
}

class _ProgramLoadDataInProgress extends ProgramEvent {
  const _ProgramLoadDataInProgress();
}

class _ProgramLoadDataSuccess extends ProgramEvent {
  const _ProgramLoadDataSuccess(this.programList);

  final List<Program> programList;

  @override
  List<Object> get props => [programList];
}

class _ProgramLoadDataFailure extends ProgramEvent {
  const _ProgramLoadDataFailure(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
