import 'package:formz/formz.dart';

enum UsernamelValidationError { empty }

class Username extends FormzInput<String, UsernamelValidationError> {
  const Username.pure() : super.pure('');

  const Username.dirty([super.value = '']) : super.dirty();

  @override
  UsernamelValidationError? validator(String value) {
    if(value.isEmpty) return UsernamelValidationError.empty;
    return null;
  }
}
