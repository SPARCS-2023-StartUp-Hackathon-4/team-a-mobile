import 'package:bloc_practice/commons/api.dart';
import 'package:dio/dio.dart';

import 'models/user.dart';

class UserRepository {
  User? _user;

  Future<User?> getUser() async {
    if (_user != null) return _user;

    try {
      var response = await api.dio1.get(
        "user",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${await api.token}",
          },
        ),
      );

      if (response.statusCode == 200) {
        _user = User.fromJson(response.data);
        return _user;
      }
    } catch (e) {
      print("error load user, token: ${await api.token}");
      print(e);
    }

    return null;
  }
}
