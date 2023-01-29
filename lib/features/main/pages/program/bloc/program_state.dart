part of 'program_bloc.dart';

enum ProgramPageStatus { initial, loading, success, failure }

class ProgramState extends Equatable {
  const ProgramState._({
    required this.status,
    required this.programList,
    required this.searchText,
    required this.filteredProgramList,
  });

  final ProgramPageStatus status;

  final List<Program> programList;

  final String searchText;

  final List<Program> filteredProgramList;

  const ProgramState.initial()
      : this._(
            status: ProgramPageStatus.initial,
            programList: const [],
            searchText: '',
            filteredProgramList: const []);

  const ProgramState.success({required List<Program> programList})
      : this._(
            status: ProgramPageStatus.success,
            programList: programList,
            searchText: '',
            filteredProgramList: programList);

  const ProgramState.failure()
      : this._(
            status: ProgramPageStatus.failure,
            programList: const [],
            searchText: '',
            filteredProgramList: const []);

  const ProgramState.loading()
      : this._(
            status: ProgramPageStatus.loading,
            programList: const [],
            searchText: '',
            filteredProgramList: const []);

  ProgramState copyWith({
    ProgramPageStatus? status,
    List<Program>? programList,
    String? searchText,
    List<Program>? filteredProgramList,
  }) {
    return ProgramState._(
      status: status ?? this.status,
      programList: programList ?? this.programList,
      searchText: searchText ?? this.searchText,
      filteredProgramList: filteredProgramList ?? this.filteredProgramList,
    );
  }

  bool get isSearching => searchText.trim().isEmpty ? false : true;

  @override
  List<Object> get props => [
        status,
        programList,
        searchText,
        filteredProgramList,
      ];
}
