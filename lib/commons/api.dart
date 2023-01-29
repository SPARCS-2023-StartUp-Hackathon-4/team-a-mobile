import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final Api api = Api._();

class Api {
  Api._();

  final _storage = const FlutterSecureStorage();
  final Dio dio1 = Dio(
    BaseOptions(
      baseUrl:
          "http://ec2-43-201-42-19.ap-northeast-2.compute.amazonaws.com:8000/",
    ),
  );

  final Dio dio2 = Dio(
    BaseOptions(
      baseUrl:
          "http://ec2-43-201-42-19.ap-northeast-2.compute.amazonaws.com:8080/",
    ),
  );

  String? _token;

  Future<String?> get token async {
    if (_token != null) {
      return _token;
    } else {
      var value = await _storage.read(key: "jwt");
      _token = value;
      return value;
    }
  }

  void setJwtToken(String? value) {
    _token = value;
    _storage.write(key: 'jwt', value: value);
  }
}
