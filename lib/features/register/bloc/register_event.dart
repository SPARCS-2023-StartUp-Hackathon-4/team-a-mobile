part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

class RegisterEmailChanged extends RegisterEvent {
  const RegisterEmailChanged(this.email);

  final String email;

  @override
  List<Object?> get props => [email];
}

class RegisterPasswordChanged extends RegisterEvent {
  const RegisterPasswordChanged(this.password);

  final String password;

  @override
  List<Object?> get props => [password];
}

class RegisterVerificationPasswordChanged extends RegisterEvent {
  const RegisterVerificationPasswordChanged(this.password);

  final String password;

  @override
  List<Object?> get props => [password];
}

class RegisterNameChanged extends RegisterEvent {
  const RegisterNameChanged(this.name);

  final String name;

  @override
  List<Object?> get props => [name];
}
class RegisterSubmitted extends RegisterEvent {
  const RegisterSubmitted();
}
