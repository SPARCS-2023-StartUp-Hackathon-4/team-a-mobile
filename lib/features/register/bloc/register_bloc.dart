import 'package:bloc_practice/features/authentication_repository/authentication_repository.dart';
import 'package:bloc_practice/features/register/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const RegisterState()) {
    on<RegisterEmailChanged>(_onEmailChanged);
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterVerificationPasswordChanged>(_onVerificationPasswordChanged);
    on<RegisterNameChanged>(_onNameChanged);
    on<RegisterSubmitted>(_onSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onEmailChanged(
      RegisterEmailChanged event, Emitter<RegisterState> emit) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
          email: email,
          status: Formz.validate(
              [email, state.verificationPassword, state.password, state.name])),
    );
  }

  void _onPasswordChanged(
      RegisterPasswordChanged event, Emitter<RegisterState> emit) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
          password: password,
          status: Formz.validate([
            state.email,
            password,
            state.verificationPassword,
            state.password,
            state.name,
          ])),
    );
  }

  void _onVerificationPasswordChanged(
      RegisterVerificationPasswordChanged event, Emitter<RegisterState> emit) {
    final verificationPassword = Password.dirty(event.password);
    emit(
      state.copyWith(
          verificationPassword: verificationPassword,
          status: Formz.validate([
            state.email,
            state.password,
            verificationPassword,
            state.password,
            state.name,
          ])),
    );
  }

  void _onNameChanged(
    RegisterNameChanged event,
    Emitter<RegisterState> emit,
  ) {
    final name = Name.dirty(event.name);
    emit(
      state.copyWith(
          name: name,
          status: Formz.validate([
            state.email,
            state.password,
            state.verificationPassword,
            state.password,
            name,
          ])),
    );
  }

  Future<void> _onSubmitted(
      RegisterSubmitted event, Emitter<RegisterState> emit) async {
    if (state.status.isValidated) {
      try {
        await _authenticationRepository.register(
          email: state.email.value,
          password1: state.password.value,
          password2: state.verificationPassword.value,
          name: state.name.value,
        );
        emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
        ));
      } catch (_) {
        emit(state.copyWith(
          status: FormzStatus.submissionFailure,
        ));
      }
    }
  }
}
