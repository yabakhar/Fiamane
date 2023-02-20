import 'package:dartz/dartz.dart';
import 'package:fiamane/core/models/users_model.dart';

import '../../../core/errors/exception.dart';
import '../../../core/errors/failure.dart';
import '../services/users_service.dart';

class UsersRepository {
  final UsersService usersService;

  UsersRepository({required this.usersService});

  Future<Either<Failure, UsersModel>> getUsers(int page) async {
    try {
      UsersModel cashRegister = await usersService.getUsers(page);
      return (Right(cashRegister));
    } on ServerException {
      return Left(ServerFailure());
    } on UnauthorizedException {
      return Left(UnauthorizedFailure());
    } on NoInternetConnectionException {
      return Left(NetworkFailure());
    }
  }
}
