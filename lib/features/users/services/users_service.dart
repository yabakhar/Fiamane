import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fiamane/core/data/const.dart';

import '../../../core/errors/exception.dart';
import '../../../core/models/users_model.dart';


class UsersService {
  UsersService();
  Future getUsers(int page) async {
    try {
      Response response = await Dio(
        BaseOptions(
            baseUrl: baseUrl,
            receiveDataWhenStatusError: true,
            queryParameters: {
              "per_page": 10,
              "page": page,
            }),
      ).get('users');
      if (response.statusCode == 200) {
        UsersModel users = UsersModel.fromJson(response.data);
        return users;
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw NoInternetConnectionException();
      } else if (e.error is TimeoutException) {
        throw ServerException();
      } else if (e.response?.statusCode == 401) {
        throw UnauthorizedException();
      } else if (e.response?.statusCode == 422) {
        throw UnauthorizedException();
      } else {
        throw ServerException();
      }
    }
  }
}
