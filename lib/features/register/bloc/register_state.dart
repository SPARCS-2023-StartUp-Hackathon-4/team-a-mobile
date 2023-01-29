part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.verificationPassword = const Password.pure(),
    this.name = const Name.pure(),
    this.status = FormzStatus.pure,
  });

  final Email email;
  final Password password;
  final Password verificationPassword;
  final Name name;
  final FormzStatus status;

  RegisterState copyWith({
    FormzStatus? status,
    Email? email,
    Password? password,
    Password? verificationPassword,
    Name? name,
  }) {
    return RegisterState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      verificationPassword: verificationPassword ?? this.verificationPassword,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [email, password, verificationPassword];
}
