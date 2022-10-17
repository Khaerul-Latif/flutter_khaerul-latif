import 'package:dio/dio.dart';
import 'package:section_26/models/user_model.dart';
import 'package:section_26/models/user.dart';

class ApiService {
  final Dio dio = Dio();

  Future<UserCreate> createUser(UserCreate user) async {
    try {
      var response = await dio.post(
        'https://reqres.in/api/users',
        data: user.toMap(),
      );
      var userFromResponse = UserCreate.fromJson(response.data);
      return userFromResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<Iterable<UserModel>> fetchUser() async {
    try {
      var response = await dio.get('https://reqres.in/api/users');
      if (response.statusCode != 200) {
        throw Exception('Fetch data users failed');
      }
      var data = response.data['data'] as List;
      var users = data.map((e) => UserModel.fromJson(e));
      return users;
    } catch (error) {
      rethrow;
    }
  }

  Future<UserUpdate?> updateUser(UserUpdate user) async {
    try {
      var response = await dio.put(
        'https://reqres.in/api/users/4',
        data: user.toMap(),
      );
      var userFromResponse = UserUpdate.fromJson(response.data);
      return userFromResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> deleteUser() async {
    try {
      var response = await dio.delete('https://reqres.in/api/users/4');
      return response.statusCode;
    } catch (e) {
      rethrow;
    }
  }
}