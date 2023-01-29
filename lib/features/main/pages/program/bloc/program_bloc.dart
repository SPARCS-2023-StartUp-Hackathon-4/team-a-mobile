import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../program_repository/models/program.dart';
import '../../../../program_repository/program_repository.dart';

part 'program_event.dart';

part 'program_state.dart';

class ProgramBloc extends Bloc<ProgramEvent, ProgramState> {
  ProgramBloc({required ProgramRepository programRepository})
      : _programRepository = programRepository,
        super(const ProgramState.initial()) {
    on<ProgramLoadData>(_onProgramLoadData);
    on<ProgramSearchTextChanged>(_onProgramSearchTextChanged);
    on<_ProgramLoadDataInProgress>(_onProgramLoadDataInProgress);
    on<_ProgramLoadDataSuccess>(_onProgramLoadDataSuccess);
    on<_ProgramLoadDataFailure>(_onProgramLoadDataFailure);
  }

  final ProgramRepository _programRepository;

  Future<void> _onProgramLoadData(
      ProgramLoadData event, Emitter<ProgramState> emit) async {
    add(const _ProgramLoadDataInProgress());
    try {
      await Future<void>.delayed(const Duration(milliseconds: 400));
      final programList = await _programRepository.getProgramList();
      add(_ProgramLoadDataSuccess(programList));
    } catch (e) {
      add(_ProgramLoadDataFailure(e.toString()));
    }
  }

  void _onProgramLoadDataInProgress(
    _ProgramLoadDataInProgress event,
    Emitter<ProgramState> emit,
  ) {
    emit(const ProgramState.loading());
  }

  void _onProgramLoadDataSuccess(
    _ProgramLoadDataSuccess event,
    Emitter<ProgramState> emit,
  ) {
    emit(ProgramState.success(programList: event.programList));
  }

  void _onProgramLoadDataFailure(
    _ProgramLoadDataFailure event,
    Emitter<ProgramState> emit,
  ) {
    emit(const ProgramState.failure());
  }

  List<Program> _filterProgramList(List<Program> list, String searchText) =>
      searchText.trim().isEmpty
          ? list
          : list
              .where((element) => element.title
                  .toLowerCase()
                  .contains(searchText.trim().toLowerCase()))
              .toList();

  void _onProgramSearchTextChanged(
    ProgramSearchTextChanged event,
    Emitter<ProgramState> emit,
  ) {
    emit(
      state.copyWith(
        searchText: event.searchText,
        filteredProgramList: _filterProgramList(
          state.programList,
          event.searchText,
        ),
      ),
    );
  }
}
