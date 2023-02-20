import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  List properties = const <dynamic>[];

  Failure([properties]);

  @override
  List get props => properties;
}

class ServerFailure extends Failure {}

class UnprocessableContent extends Failure {}

class NetworkFailure extends Failure {}

class TokenExpirationFailure extends Failure {}

class InvalidInputFailure extends Failure {}

class UnauthorizedFailure extends Failure {}
