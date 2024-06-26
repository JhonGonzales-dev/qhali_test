import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import '../models/user.dart';

class UserService {
  final Dio dio;
  UserService(this.dio);
  Future<Result<UserModel, Exception>> getUsers() async {
    Map<String, dynamic> responseData = {};

    try {
      final response = await dio.get('/users');

      switch (response.statusCode) {
        case 200:
          responseData["data"] = response.data;
          final data = UserModel.fromJson(responseData);
          return Success(data);

        default:
          return Error(Exception(response.statusMessage));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log('ERROR: ${e.response}');

        String value = e.response?.data["message"] ?? '';
        return Error(Exception(value));
      } else {
        log('${e.message}');
        return Error(Exception('${e.message}'));
      }
    } catch (e) {
      log('$e');
      return Error(Exception("$e"));
    }
  }
}
