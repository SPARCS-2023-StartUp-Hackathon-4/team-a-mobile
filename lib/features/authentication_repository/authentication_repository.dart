import 'dart:async';
import 'package:bloc_practice/features/user_repository/user_repository.dart';
import 'package:bloc_practice/commons/api.dart';
import 'package:dio/dio.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  AuthenticationRepository({required UserRepository userRepository})
      : _userRepository = userRepository;

  final UserRepository _userRepository;
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    var user = await _userRepository.getUser();
    if (user != null) {
      await Future<void>.delayed(const Duration(milliseconds: 1000));
      yield AuthenticationStatus.authenticated;
    } else {
      yield AuthenticationStatus.unauthenticated;
    }

    yield* _controller.stream;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    try {
      var response = await api.dio1.post(
        "/user/login",
        data: {
          "username": username,
          "password": password,
        },
        options: Options(
          contentType: "application/x-www-form-urlencoded",
        ),
      );
      if (response.statusCode == 200) {
        api.setJwtToken(response.data['access_token']);
        print("logined : ${response.data}");
        _controller.add(AuthenticationStatus.authenticated);
      }
    } catch (e) {
      print("fail login");
      print(e);
      _controller.add(AuthenticationStatus.unauthenticated);
    }
  }

  void logOut() async {
    try {
      // var response = await api.dio1.post("/user/logout");
      // if (response.statusCode == 200) {
      api.setJwtToken(null);
      _controller.add(AuthenticationStatus.unauthenticated);
      // }
    } catch (_) {}
  }

  Future<void> register({
    required String name,
    required String password1,
    required String password2,
    required String email,
  }) async {
    try {
      var response = await api.dio1.post(
        "/user/create",
        data: {
          "email": email,
          "password1": password1,
          "password2": password2,
          "username": name,
        },
      );
      if (response.statusCode == 200) {
        api.setJwtToken(response.data['access_token']);
        _controller.add(AuthenticationStatus.authenticated);
      }
    } catch (e) {
      print("fail register");
      print(e);
      _controller.add(AuthenticationStatus.unauthenticated);
    }
  }

  void dispose() => _controller.close();
}
